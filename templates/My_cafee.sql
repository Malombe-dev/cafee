-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 18, 2024 at 08:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `My_cafee`
--

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_desc` varchar(500) NOT NULL,
  `product_cost` int(50) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_image_name` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`product_id`, `product_name`, `product_desc`, `product_cost`, `product_category`, `product_image_name`) VALUES
(1, ' Classic Pancakes', ' Fluffy pancakes served with maple syrup, fresh berries, and a dollop of whipped cream.', 1500, 'breakfast', 'b1.jpg'),
(2, 'Avocado Toast', 'Toasted sourdough bread topped with smashed avocado, cherry tomatoes, and a sprinkle of chili flakes.', 1200, 'breakfast', 'b2.jpg'),
(4, 'Breakfast Burrito', 'A soft tortilla filled with scrambled eggs, cheese, avocado, black beans, and salsa.', 1299, 'breakfast', 'b3.jpg'),
(5, ' French Toast', 'Thick slices of brioche dipped in egg batter, cooked to golden perfection, and served with syrup and powdered sugar.', 1199, 'breakfast', 'b4.jpg'),
(6, ' Omelette', 'A fluffy three-egg omelette with your choice of fillings: cheese, ham, mushrooms, spinach, and tomatoes.', 1099, 'breakfast', 'b5.jpg'),
(7, 'Greek Yogurt Parfait', ' Creamy Greek yogurt layered with granola, honey, and fresh seasonal fruits.', 1199, 'breakfast', 'b6.jpg'),
(8, 'Smoked Salmon Bagel', 'A toasted bagel topped with smoked salmon, cream cheese, capers, and red onions.', 1299, 'breakfast', 'b7.jpg'),
(9, ' Eggs Benedict', ': Poached eggs and ham on an English muffin, topped with rich hollandaise sauce.', 1399, 'breakfast', 'b8.jpg'),
(10, ' Breakfast Smoothie Bowl', 'A smoothie made with mixed berries and banana, topped with granola, chia seeds, and coconut flakes.', 1219, 'breakfast', 'b9.jpg'),
(11, 'English Breakfast', 'A hearty meal with eggs, bacon, sausages, baked beans, grilled tomatoes, and toast.', 1299, 'breakfast', 'b10.jpg'),
(12, 'Grilled Chicken Salad ', 'A hearty, nutrient-packed lunch featuring tender grilled chicken breast, crisp mixed greens, cherry tomatoes, cucumbers, red onions, and a sprinkle of shredded carrots. Tossed with a light lemon vinaigrette, it’s a perfect balance of flavors and textures that provides a healthy, satisfying meal packed with protein and fiber.', 1500, 'lunch', 'l1.jpg'),
(13, 'Spaghetti Bolognese ', 'A classic Italian favorite made with al dente spaghetti noodles smothered in a rich, slow-cooked Bolognese sauce. The sauce is a savory blend of ground beef, tomatoes, garlic, and herbs, simmered to perfection. Topped with a sprinkle of Parmesan cheese, this hearty meal delivers comfort and satisfaction in every bite', 1699, 'lunch', 'l2.jpg'),
(14, 'Chicken Caesar Wrap', 'uicy grilled chicken is wrapped with fresh romaine lettuce, crunchy croutons, shaved Parmesan cheese, and creamy Caesar dressing in a soft tortilla. This wrap is a portable twist on the classic Caesar salad, offering a perfect mix of flavors and textures for a filling lunch on the go.', 1699, 'lunch', 'l3.jpg'),
(15, 'Beef Burrito Bowl ', 'A flavorful bowl packed with seasoned ground beef, cilantro-lime rice, black beans, sweet corn, and fresh pico de gallo. Topped with shredded cheese, avocado, and a drizzle of sour cream, this burrito bowl is a fiesta of flavors that’s as satisfying as it is delicious.', 1399, 'lunch', 'l4.jpg'),
(16, 'Teriyaki Salmon Bowl ', 'Succulent, pan-seared salmon glazed with a sweet and savory teriyaki sauce, served over a bed of fluffy white rice. Accompanied by steamed broccoli, carrots, and edamame, this balanced meal offers a fusion of flavors and textures, delivering protein and essential nutrients in every bite.', 1899, 'lunch', 'l5.jpg'),
(17, 'Veggie Hummus Wrap ', ' A light yet filling option for vegetarians, featuring a soft tortilla filled with creamy hummus, crunchy cucumbers, fresh spinach, shredded carrots, and roasted red peppers. Topped with a sprinkle of feta cheese, this wrap is a refreshing and healthy choice that’s perfect for a quick, flavorful lunch.', 1498, 'lunch', 'l6.jpg'),
(18, 'Pulled Pork Sandwich ', 'Tender, slow-cooked pulled pork drenched in tangy BBQ sauce and served on a toasted brioche bun. Topped with creamy coleslaw, this sandwich is a mouthwatering mix of smoky, sweet, and savory flavors that will leave you feeling full and satisfied.', 1467, 'lunch', 'l7.jpg'),
(19, 'Pesto Chicken Pasta ', 'This dish features tender penne pasta tossed with grilled chicken breast and a vibrant basil pesto sauce. Sun-dried tomatoes and Parmesan cheese add bursts of flavor, while a sprinkle of pine nuts provides a satisfying crunch. It’s a filling, flavorful pasta dish perfect for a lunch break.', 1234, 'lunch', 'l8.jpg'),
(20, 'Vegetarian Quinoa Bowl ', 'A nutritious and colorful bowl loaded with quinoa, roasted sweet potatoes, avocado, black beans, and fresh spinach. Topped with a light tahini dressing, this protein-packed meal is full of fiber, antioxidants, and heart-healthy fats, making it a great choice for a wholesome lunch.\r\n\r\n', 1245, 'lunch', 'l9.jpg'),
(21, 'Turkey and Avocado Sandwich ', 'Thinly sliced roasted turkey breast, creamy avocado, crisp lettuce, and juicy tomato slices are layered between two slices of whole-grain bread. This sandwich is both filling and light, offering a balance of protein, healthy fats, and whole grains for a nourishing lunch.', 1236, 'lunch', 'l10.jpg'),
(22, 'Herb-Crusted Lamb Chops', 'Succulent lamb chops coated with a flavorful blend of rosemary, thyme, garlic, and breadcrumbs, seared to perfection. These tender chops are served alongside a creamy mashed potato bed and a side of roasted root vegetables. The dish’s balance of rich, savory flavors with fresh herbs makes it an ideal choice for a hearty, gourmet dinner.', 2000, 'dinner', 'd1.jpg'),
(23, 'Seafood Paella', 'A traditional Spanish dish featuring a vibrant saffron-infused rice base, loaded with a variety of seafood like prawns, mussels, clams, and squid. Cooked in a single pan with onions, bell peppers, and peas, this colorful paella brings a medley of flavors and textures to the table, offering a satisfying meal full of fresh seafood goodness.', 1999, 'dinner', 'd2.jpg'),
(24, 'Beef Stroganoff', 'Tender strips of beef sautéed with onions and mushrooms in a creamy sour cream sauce, served over egg noodles. This comforting Russian dish combines savory flavors with a hint of tanginess, making it an indulgent yet comforting meal perfect for dinner, especially on cooler evenings.\r\n\r\n', 1899, 'dinner', 'd3.jpg'),
(25, 'Chicken Alfredo Pasta ', 'A creamy, indulgent pasta dish featuring tender fettuccine noodles tossed with grilled chicken in a rich Alfredo sauce made from butter, cream, and Parmesan cheese. The addition of garlic and fresh parsley enhances the flavors, offering a smooth, flavorful dish perfect for satisfying a craving for comfort food.', 1799, 'dinner', 'd4.jpg'),
(26, 'Vegetarian Lasagna ', ' Layers of tender lasagna noodles alternate with a hearty mix of spinach, zucchini, mushrooms, and ricotta cheese, topped with marinara sauce and mozzarella. This vegetarian version of the classic Italian dish offers all the rich, cheesy goodness of traditional lasagna but with the added benefit of fresh vegetables for a balanced, filling dinner.\r\n\r\n', 1999, 'dinner', 'd5.jpg'),
(27, 'Grilled Salmon with Asparagus', ' A light and healthy option for dinner, this dish features a perfectly grilled salmon fillet with a crispy skin and a tender, flaky interior. Paired with roasted asparagus spears and a drizzle of lemon butter sauce, it’s a simple yet flavorful meal packed with omega-3 fatty acids and nutrients', 1799, 'dinner', 'd6.jpg'),
(28, 'Butter Chicken ', 'A popular Indian dish featuring tender pieces of chicken cooked in a rich and creamy tomato-based sauce. Flavored with a blend of aromatic spices like garam masala, turmeric, and cumin, this dish is served with fluffy basmati rice or warm naan bread for a satisfying, spice-infused dinner that’s comforting and flavorful.', 1599, 'dinner', 'd7.jpg'),
(29, 'Shrimp Scampi ', 'Juicy shrimp sautéed in a garlic butter sauce, served over a bed of linguine pasta. The dish is seasoned with a squeeze of fresh lemon juice, white wine, and a sprinkle of parsley for a bright and refreshing flavor profile. It’s a light yet filling dinner that combines the richness of butter with the freshness of seafood.', 1234, 'dinner', 'd8.jpg'),
(30, 'Stuffed Bell Peppers', ' Bell peppers filled with a flavorful mix of ground beef, rice, onions, and tomatoes, then baked until tender. Topped with melted cheese and a sprinkle of fresh herbs, these stuffed peppers are a well-rounded meal offering protein, vegetables, and grains in one dish, making it a healthy and satisfying dinner option.', 1699, 'dinner', 'd9.jpg'),
(31, 'Braised Short Ribs S', 'Slow-cooked beef short ribs braised in a rich red wine sauce, served over a bed of creamy polenta or mashed potatoes. The tender, fall-off-the-bone meat absorbs the deep flavors of the sauce, which is infused with garlic, rosemary, and thyme, creating a luxurious, comforting dinner perfect for a special evening meal.\r\n', 1677, 'dinner', 'd10.jpg'),
(32, 'Mango Lassi ', 'A refreshing Indian drink made with ripe mangoes, creamy yogurt, and a hint of cardamom. Blended to a smooth consistency, this sweet and tangy beverage is perfect for cooling down on a hot day. It’s not only delicious but also packed with probiotics, making it a healthy choice to complement spicy meals.', 1799, 'drinks', '1.jpg'),
(33, 'Iced Matcha Latte ', 'A vibrant green drink made with finely ground matcha powder, milk (or a dairy alternative), and sweetener. Served over ice, this latte offers a smooth, creamy texture and a rich, earthy flavor. High in antioxidants and with a gentle caffeine kick, it\'s an energizing and refreshing drink that’s perfect for warm afternoons.', 1567, 'drinks', '2.jpg'),
(34, 'Classic Mojito', ' A refreshing cocktail featuring muddled mint leaves, fresh lime juice, sugar, and white rum, topped with soda water. The combination of mint and lime creates a revitalizing drink, perfect for sipping on a summer evening. Garnished with a sprig of mint and a lime wedge, this cocktail is both vibrant and thirst-quenching.', 1567, 'drinks', '3.jpg'),
(35, 'Berry Smoothie', 'A delicious and nutritious blend of mixed berries (such as strawberries, blueberries, and raspberries), yogurt, and a splash of honey. This smoothie is creamy, fruity, and packed with vitamins and antioxidants, making it a perfect breakfast option or a midday snack. The natural sweetness of the berries adds a delightful flavor to this refreshing drink.', 1000, 'drinks', '4.jpg'),
(36, 'Spiced Chai Latte', ' A warm and aromatic drink made with black tea, a blend of spices (like cinnamon, cardamom, and ginger), and steamed milk. This creamy beverage offers a comforting flavor and a hint of sweetness, perfect for cozy evenings or chilly mornings. The spices not only enhance the taste but also provide numerous health benefits.', 999, 'drinks', '5.jpg'),
(37, 'Pineapple Coconut Agua Fresca', 'A light and refreshing Mexican drink made with blended pineapple, coconut water, and lime juice. This thirst-quenching beverage is perfect for hot summer days, offering a tropical flavor that transports you to the beach. Served over ice and garnished with fresh pineapple slices, it’s a hydrating and delightful drink.', 899, 'drinks', '6.jpg'),
(38, 'Lavender Lemonade ', 'A unique twist on traditional lemonade, this drink combines freshly squeezed lemon juice, lavender syrup, and water. The floral notes of lavender paired with the tartness of lemon create a refreshing and aromatic beverage, perfect for spring and summer gatherings. Served over ice and garnished with lavender sprigs, it’s as beautiful as it is delicious.', 799, 'drinks', '7.jpg'),
(39, 'Chocolate Mint Iced Coffee', 'A decadent iced coffee drink made with cold brew coffee, chocolate syrup, and a hint of mint flavor. Topped with whipped cream and chocolate shavings, this drink is a delightful treat for coffee lovers who enjoy a touch of sweetness. It’s perfect for satisfying your caffeine craving while indulging in a chocolatey delight.', 677, 'drinks', '8.jpg'),
(40, 'Cucumber Basil Sparkler', 'A refreshing mocktail made with muddled cucumber, fresh basil, lime juice, and sparkling water. This light and invigorating drink is perfect for hot days or casual gatherings. The combination of cool cucumber and aromatic basil creates a unique flavor profile, making it a sophisticated option for a non-alcoholic beverage.', 1234, 'drinks', '9.jpg'),
(41, 'Honey Ginger Turmeric Tea ', ' A soothing herbal tea made with fresh ginger, turmeric, honey, and lemon. Known for its anti-inflammatory properties, this warm drink offers a comforting flavor with a hint of spice. It’s perfect for relaxing evenings or as a health boost during cold months, providing a delicious and wholesome way to unwind.', 880, 'drinks', '10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` text NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` varchar(50) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_name`, `email`, `gender`, `phone`, `password`, `admin`) VALUES
('vmutinda', 'test@gmail.com', 'male', '+254712345678', 'scrypt:32768:8:1$DAQEsfuRJCbo8FU2$640d097c427726ac8085de1658055c265442e1bf6a83a8e1d36e56f2f972b9d43c7203ffb61be385e7aa8cb833cd21e80b702feb24f7eb1b79b42b1e583d5c8d', 'is_admin'),
('malombe', 'vincentmutinda560@gmail.com', 'male', '+254712345677', 'scrypt:32768:8:1$quM9LwflnuUobsJE$82fccd321053813b47f986d66d861437a7e6e4e6195893b1603139629fc01b4331cc2f742ea7df23ed23302275de64c6754121134bf0f1b8b45ae488c1dc242e', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
