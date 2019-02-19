-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2019 at 10:21 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mp`
--
CREATE DATABASE IF NOT EXISTS `mp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mp`;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `m_cat_id` int(11) NOT NULL,
  `m_type_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `title`, `visible`, `m_cat_id`, `m_type_id`, `content`, `image`) VALUES
(1, 'Fruit Medley', 1, 1, 3, 'Dessert', 'Fruit_Medley.jpg'),
(3, 'Lobster Thermidor', 1, 2, 1, 'Non Vegetarian Starter', 'Lobster_Thermidor.jpg'),
(2, 'Oven Roasted ', 1, 2, 2, 'Non Vegetarian Main Course', 'oven_roasted.jpg'),
(4, 'Smoked salmon gateau', 1, 2, 1, 'Non Vegetarian Starter', 'starter.jpg'),
(5, 'Burrata bruschetta ', 1, 1, 1, 'Try a new twist on bruschetta, topped with burrata, broad beans, sugar snap peas, radish, mint and chilli. It makes a fab lunch or starter for a dinner party.', 'Burrata_bruschetta.jpg'),
(6, 'Pasta', 1, 1, 2, 'Pasta', 'veg-pasta.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `ingredient_name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `units` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `ingredient_name`, `quantity`, `units`) VALUES
(1, 'Flour', 440, 'g'),
(2, 'Raisins', 2575, 'g'),
(3, 'Rice  ', 2167, 'g'),
(4, 'Syrup ', 203, 'ml'),
(5, 'Lettuce', 500, 'g'),
(6, 'Carrots', 450, 'g'),
(7, 'Potato', 1500, 'g'),
(8, 'Apples ', 388, 'g'),
(9, 'Chicken  ', 9150, 'g'),
(10, 'Blackbeans', 1000, 'g'),
(11, 'Beef', 3900, 'g'),
(12, 'Shrimp', 1000, 'g'),
(13, 'Salmon', 1744, 'g'),
(14, 'Spaghetti', 1794, 'g'),
(15, 'Tomato  ', 2850, 'g'),
(16, 'Salt', 990, 'g'),
(17, 'Pepper', 390, 'g'),
(18, 'Garlic', 930, 'g'),
(19, 'Paprika', 1000, 'g'),
(20, 'Onions', 1800, 'g'),
(21, 'Cumin  ', 1000, 'g'),
(22, 'Cayenne pepper', 200, 'g'),
(23, 'Olive oil', 1000, 'ml'),
(24, 'Dry sherry', 500, 'g'),
(25, 'Hot sauce', 245, 'g'),
(26, 'Oregano', 350, 'g'),
(27, 'Bay leaves', 100, 'g'),
(28, 'Honey ', 1000, 'ml'),
(29, 'Avocado', 500, 'g'),
(30, 'Lime', 500, 'ml');

-- --------------------------------------------------------

--
-- Table structure for table `meal_category`
--

DROP TABLE IF EXISTS `meal_category`;
CREATE TABLE `meal_category` (
  `id` int(11) NOT NULL,
  `meal_category` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal_category`
--

INSERT INTO `meal_category` (`id`, `meal_category`) VALUES
(1, 'Starter'),
(2, 'Main Course'),
(3, 'Dessert'),
(4, 'Breakfast'),
(5, 'Refreshment');

-- --------------------------------------------------------

--
-- Table structure for table `meal_course`
--

DROP TABLE IF EXISTS `meal_course`;
CREATE TABLE `meal_course` (
  `id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `prep_date` date NOT NULL,
  `course_type` tinyint(4) NOT NULL,
  `time_to_prepare` int(11) NOT NULL,
  `course_notes` text NOT NULL,
  `course_instructions` text NOT NULL,
  `meal_cat_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal_course`
--

INSERT INTO `meal_course` (`id`, `course_name`, `prep_date`, `course_type`, `time_to_prepare`, `course_notes`, `course_instructions`, `meal_cat_id`) VALUES
(1, 'Oven Roasted Vegetable Ratatouille with Cheese ', '2011-03-26', 2, 12, 'To Serve\r\nMake a little mound of salad leaves on one side of each dinner plate, and then top with two cheese parcels. Then carefully place a mound of the roasted vegetables at the front and finally drizzle a little of the reduced balsamic vinegar around the plate.\r\n\r\nChef?s Tips\r\nRemember that phylo pastry dries out fast so try to work quickly, away from the heat if possible\r\nand wrap the sheets your not using with parchment paper and a damp tea towel.', '1. Cut the tomatoes in half lengthwise, rub with a little olive oil, season and cook in the oven on a low heat 120 C gas mark 1 (put fan on if your oven has one). Cook them in the bottom of the oven on a shallow tray so they dry out as well as cook for about 2 hours.\r\n2. Trim off the very top of the garlic, rub with olive oil and add to the tomato tray.\r\n3. Mix the mozzarella, Parmesan in a food processor and season with salt and pepper.\r\n4. Divide the cheese mix into 6 equal amounts push a pecan into the centre of each one and refrigerate.\r\n5. Fold one sheet of phylo in half lengthwise into a rectangle and brush the edges lightly with water.\r\n6. Place one ball of the cheese at one end of the phylo rectangle and fold over to create a triangle, which about 5 inches (125mm) long. Where the triangle joins the filo sheet fold the triangle again, and finally a third time.\r\n7. Trim off the excess phylo pastry and make sure the triangles are well sealed to prevent the cheese coming out during the cooking.\r\n8. Repeat the process until you have 6 triangles then brush them with melted butter and place them on a baking sheet lined with baking parchment.\r\n9. Reduce the balsamic vinegar in a nonstick saucepan until it is syrupy, cover and allow to cool.\r\n10.In a large nonstick frying-pan cook the peppers, aubergine, courgette, mushroom and red onion separately in a little olive oil allowing each to get some colour on it then transfer to a roasting pan.\r\n11. Roast the vegetables in the top of the oven just until they are tender but not mushy.\r\n12. Remove all the roasted vegetables, keep them warm and add the basil and season the vegetables.\r\n13. Turn up the oven to 190 gas mark 5 and bake the phylo parcels until they golden brown.', 2),
(2, 'test', '2011-03-30', 2, 10, 'nothing', 'nothing', 2);

-- --------------------------------------------------------

--
-- Table structure for table `meal_type`
--

DROP TABLE IF EXISTS `meal_type`;
CREATE TABLE `meal_type` (
  `id` int(11) NOT NULL,
  `meal_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal_type`
--

INSERT INTO `meal_type` (`id`, `meal_type`) VALUES
(1, 'Vegetarian'),
(2, 'Non Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

DROP TABLE IF EXISTS `nutrition`;
CREATE TABLE `nutrition` (
  `id` int(11) NOT NULL,
  `kcal` varchar(10) DEFAULT NULL,
  `fat` varchar(10) DEFAULT NULL,
  `saturates` varchar(10) DEFAULT NULL,
  `carbs` varchar(10) DEFAULT NULL,
  `sugars` varchar(10) DEFAULT NULL,
  `fibre` varchar(10) DEFAULT NULL,
  `protein` varchar(10) DEFAULT NULL,
  `salt` varchar(10) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`id`, `kcal`, `fat`, `saturates`, `carbs`, `sugars`, `fibre`, `protein`, `salt`, `course_id`) VALUES
(1, '545', '44g', '16g', '17g', '2g', '3g', '18g', '0.9g', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `order_date` date NOT NULL,
  `booking_date` date NOT NULL,
  `meal_type` varchar(20) NOT NULL,
  `course_type` varchar(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `servings` int(11) NOT NULL,
  `order_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `order_date`, `booking_date`, `meal_type`, `course_type`, `course_name`, `servings`, `order_status`) VALUES
(12, 'Loyal Customer', '2011-05-15', '2011-03-30', 'Dessert ', 'Vegetarian', 'PapDums', 18, 2),
(11, 'Loyal Customer', '2011-05-15', '2011-03-26', 'Main Course ', 'Non-Vegetarian', 'Fruit-Filled Cantaloupe Baskets', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `meal_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `qty_used` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `item_id`, `cours_id`, `qty_used`) VALUES
(1, 7, 1, 250),
(2, 17, 1, 10),
(3, 18, 1, 50),
(4, 20, 1, 100),
(5, 2, 2, 12),
(6, 18, 2, 12),
(7, 13, 2, 250),
(8, 15, 2, 50),
(9, 7, 1, 250),
(10, 17, 1, 10),
(11, 18, 1, 50),
(12, 20, 1, 100),
(13, 2, 2, 12),
(14, 18, 2, 12),
(15, 13, 2, 250),
(16, 15, 2, 50),
(17, 1, 3, 22),
(18, 1, 3, 22),
(19, 1, 3, 2),
(20, 1, 3, 2),
(21, 1, 4, 22),
(22, 1, 4, 22),
(23, 1, 4, 22),
(24, 1, 4, 22);

-- --------------------------------------------------------

--
-- Table structure for table `review_rating`
--

DROP TABLE IF EXISTS `review_rating`;
CREATE TABLE `review_rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cont_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `cont_title` varchar(100) NOT NULL,
  `review` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_rating`
--

INSERT INTO `review_rating` (`id`, `user_id`, `cont_id`, `rating`, `cont_title`, `review`, `date`) VALUES
(1, 28, 2, 5, 'This is a test review to check that wether it is working or not', 'this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content', '2011-03-27 13:19:09'),
(2, 28, 2, 2, 'content 4', 'this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content', '2011-03-29 23:23:51'),
(3, 28, 6, 5, 'This is another  test review to  see how it looks like when it is in it\'s place ', 'this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content', '2011-03-29 23:24:46'),
(4, 28, 7, 5, 'This is so delious', 'this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content this is 3rd content', '2011-03-29 23:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `servings`
--

DROP TABLE IF EXISTS `servings`;
CREATE TABLE `servings` (
  `id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `cou_id` int(11) NOT NULL,
  `ord_id` int(11) NOT NULL,
  `no_of_servings` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servings`
--

INSERT INTO `servings` (`id`, `cus_id`, `cou_id`, `ord_id`, `no_of_servings`) VALUES
(1, 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `hashed_password` varchar(40) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `email`, `hashed_password`, `status`) VALUES
(2, 'John Desoza', 'desoza', 'desoza@yahoo.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(1, 'Loyal Customer', 'cust', 'cust@cust', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2),
(3, 'shamry', 'shamry', 'shamry@menuplanning.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_category`
--
ALTER TABLE `meal_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_course`
--
ALTER TABLE `meal_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_type`
--
ALTER TABLE `meal_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_rating`
--
ALTER TABLE `review_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servings`
--
ALTER TABLE `servings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `meal_category`
--
ALTER TABLE `meal_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meal_course`
--
ALTER TABLE `meal_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meal_type`
--
ALTER TABLE `meal_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `review_rating`
--
ALTER TABLE `review_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `servings`
--
ALTER TABLE `servings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
