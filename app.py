from flask import Flask, render_template, request, session, redirect, make_response
import pymysql
from werkzeug.security import generate_password_hash, check_password_hash
import re  # for password validation
from functools import wraps
from mpesa import*

app = Flask(__name__)
app.secret_key = "You Are Logged In"

def validate_password(password):
    """
    Validates that a password meets the following criteria:
    - At least 8e characters long
    - Contains an uppercase letter
    - Contains a lowercase letter
    - Contains a number
    - Contains a special character
    """
    if len(password) < 8:
        return False, "Password must be at least 8 characters long."
    if not re.search(r'[A-Z]', password):
        return False, "Password must contain at least one uppercase letter."
    if not re.search(r'[a-z]', password):
        return False, "Password must contain at least one lowercase letter."
    if not re.search(r'[0-9]', password):
        return False, "Password must contain at least one number."
    if not re.search(r'[\W_]', password):
        return False, "Password must contain at least one special character."
    return True, ""

def validate_email(email):
    """
    Validates that the email format is correct.
    """
    email_regex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
    return re.match(email_regex, email)

def validate_phone(phone):
    """
    Validates that the phone number format is correct.
    """
    phone_regex = r'^\+?[1-9]\d{1,14}$'  # E.164 format
    return re.match(phone_regex, phone)

# Admin session decorator note :use if all pages are visible
def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'is_admin' not in session or session['is_admin'] != 'is_admin':
            return redirect('/')  # Redirect non-admins to home
        return f(*args, **kwargs)
    return decorated_function

@app.route('/')
def homepage():
    connection = pymysql.connect(host='localhost', user='root', password='', database='My_cafee')
    cursor = connection.cursor()

    sql = "SELECT * FROM uploads WHERE product_category = 'breakfast'"
    cursor.execute(sql)
    breakfast = cursor.fetchall()

    sql1 = "SELECT * FROM uploads WHERE product_category = 'lunch'"
    cursor.execute(sql1)
    lunch = cursor.fetchall()

    sql2 = "SELECT * FROM uploads WHERE product_category = 'dinner'"
    cursor.execute(sql2)
    dinner = cursor.fetchall()

    sql3 = "SELECT * FROM uploads WHERE product_category = 'drinks'"
    cursor.execute(sql3)
    drinks = cursor.fetchall()

    return render_template('index.html', breakfast=breakfast, lunch=lunch, dinner=dinner, drinks=drinks)

@app.route('/uploaddishes', methods=['POST', 'GET'])
@admin_required
def uploaddishes():
    if request.method == 'POST':
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        product_category = request.form['product_category']
        product_image_name = request.files['product_image_name']

        product_image_name.save('static/images/' + product_image_name.filename)

        connection = pymysql.connect(host='localhost', user='root', password='', database='My_cafee')
        cursor = connection.cursor()
        sql = "INSERT INTO uploads (Product_name, product_desc, product_cost, product_category, product_image_name) VALUES (%s, %s, %s, %s, %s)"
        data = (product_name, product_desc, product_cost, product_category, product_image_name.filename)

        cursor.execute(sql, data)
        connection.commit()

        return render_template('uploaddishes.html', message="Dish added successfully")
    else:
        return render_template('uploaddishes.html', error="Please add a Dish")

@app.route('/single/<product_id>')
def single(product_id):
    connection = pymysql.connect(host='localhost', user='root', password='', database='My_cafee')
    cursor = connection.cursor()
    sql = "SELECT * FROM uploads WHERE product_id = %s"
    cursor.execute(sql, (product_id,))
    product = cursor.fetchone()
    return render_template("single.html", product=product)

@app.route('/about')
def about():
    return "This is the about page."

@app.route('/register', methods=['POST', 'GET'])
def register():
    if request.method == 'POST':
        user_name = request.form.get('user_name')
        email = request.form.get('email')
        gender = request.form.get('gender')
        phone = request.form.get('phone')
        password = request.form.get('password')
        confirm_password = request.form.get('confirm_password')  # New field for password confirmation
        admin = request.form.get('admin')

        # Validate email format
        if not validate_email(email):
            return render_template('register.html', error_email="Invalid email format.")

        # Validate phone format
        if not validate_phone(phone):
            return render_template('register.html', error_phone ="Invalid phone number format.")

        # Check if the username or email is already taken
        connection = pymysql.connect(host='localhost', user='root', password='', database='My_cafee')
        cursor = connection.cursor()

        cursor.execute("SELECT * FROM users WHERE user_name = %s OR email = %s", (user_name, email))
        if cursor.fetchone():
            return render_template('register.html', error_all ="Username or email already taken.")

        # Validate password
        is_valid, validation_message = validate_password(password)
        if not is_valid:
            return render_template('register.html', error=validation_message)

        # Check if passwords match
        if password != confirm_password:
            return render_template('register.html', error="Passwords do not match.")

        # Hash the password before storing it in the database
        hashed_password = generate_password_hash(password)

        # Connect to DB and insert new user
        sql = "INSERT INTO users (user_name, email, gender, phone, password, admin) VALUES (%s, %s, %s, %s, %s, %s)"
        data = (user_name, email, gender, phone, hashed_password, admin)
        cursor.execute(sql, data)
        connection.commit()

        return render_template('register.html', message_reg="Registered successfully")
    else:
        return render_template('register.html', error_reg='Please register')

@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']  # Plain text password entered by the user
        admin = request.form['admin']

        # Connect to DB
        connection = pymysql.connect(host='localhost', user='root', password='', database='My_cafee')
        cursor = connection.cursor()

        # Check if the user exists
        sql = "SELECT * FROM users WHERE email = %s AND admin = %s"
        data = (email, admin)
        cursor.execute(sql, data)

        user = cursor.fetchone()

        # If user exists, check the password
        if user and check_password_hash(user[4], password):  # Assuming the hashed password is in the 5th column (index 4)
            session['key'] = admin # Assuming 'admin' status is in the 6th column (index 5)
            # session['is_admin'] = admin[5]
            session['is_admin'] = user[5]
            print(session)
            if user[5] == 'is_admin':  # If user is an admin, redirect to admin dashboard
                return redirect('/dashb/dashboard')
            else:  # Otherwise, redirect to the normal user homepage
                return redirect('/')
        else:
            return render_template('login.html', error="Invalid login details,Please try again")

    return render_template('login.html')

# dashboard 
@app.route('/dashb/dashboard')
def dashboard():
   return render_template('dashb/dashboard.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/disable-back-button') 


@app.route('/disable-back-button')
def disable_back_button():
    return render_template('disable_back_button.html')  # Create a simple template for this purpose.

#mpesa 
#impliment  Stk push
@app.route ('/mpesa',methods = ['POST'])
def mpesa ():
    phone = request.form["phone"]
    amount = request.form["amount"]

    #use mpesa_fuction from mpesa.py 
   #  it accepts the phone and amount as arguments 
    mpesa_payment(amount,phone) 
    return '<h1> Please complete payment in your phone </h1>'  \
    '<a href="/" class="btn btn-success btn-sm"> Go Back To Products </a>'

if __name__ == '__main__':
    app.run(debug=True, port=3000)
