
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




--
-- Database: `rent_fyp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `proName` varchar(500) NOT NULL,
  `proDesc` varchar(500) NOT NULL,
  `proImage` varchar(200) NOT NULL,
  `proPrice` double NOT NULL,
  `userid` int(11) NOT NULL,
  `proId` int(11) NOT NULL,
  `sellerId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `installmentId` int(11) NOT NULL,
  `addedOn` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_Name`) VALUES
(1, 'Electronics\r\n'),
(2, 'Mobiles'),
(3, 'bikes');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(100) NOT NULL,
  `discount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `discount`) VALUES
(1, 'test10', 10),
(2, 'test20', 20),
(10, 'check12', 12);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL,
  `feed_name` varchar(50) NOT NULL,
  `feed_email` varchar(50) NOT NULL,
  `feed_content` varchar(500) NOT NULL,
  `feed_pro_id` int(11) NOT NULL,
  `addedOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feed_id`, `feed_name`, `feed_email`, `feed_content`, `feed_pro_id`, `addedOn`) VALUES
(28, 'mani', 'mani@gmail.com', 'Good Product', 12, '2024-08-21 11:17:48'),
(29, 'mani', 'mani123@gmail.com', 'wow', 11, '2024-08-21 11:22:40'),
(30, 'mani', 'mani123@gmail.com', 'wow', 13, '2024-08-21 11:23:07'),
(31, 'maniCh', 'mani12@gmail.com', 'New Comment', 12, '2024-11-14 12:54:25'),
(32, 'maniCh', 'mani12@gmail.com', 'New Comment', 12, '2024-11-14 12:56:18'),
(33, 'Abdur Rehman', 'mani12@gmail.com', 'Great Product ! Recently Recieved It ', 13, '2024-12-09 14:48:43'),
(34, 'kljasdlkdjlk', 'lkdjaslkj', 'ljdflk', 11, '2024-01-21 07:36:06');

-- --------------------------------------------------------

--
-- Table structure for table `installmentplans`
--

CREATE TABLE `installmentplans` (
  `installmentId` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `downpayment` int(11) NOT NULL,
  `installmentpermonth` int(11) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `installmentplans`
--

INSERT INTO `installmentplans` (`installmentId`, `title`, `downpayment`, `installmentpermonth`, `duration`) VALUES
(1, '12 Months Instalment', 12, 8, 12),
(3, '6 Month Installment', 20, 16, 6),
(4, '3 Month Installment', 40, 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orderditem`
--

CREATE TABLE `orderditem` (
  `orderId` int(11) NOT NULL,
  `proId` int(11) NOT NULL,
  `installmentId` int(11) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `amtRecieved` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderditem`
--

INSERT INTO `orderditem` (`orderId`, `proId`, `installmentId`, `itemPrice`, `amtRecieved`, `quantity`) VALUES
(11, 12, 3, 150000, 4800, 1),
(12, 18, 4, 12000, 0, 1),
(13, 12, 4, 150000, 0, 1),
(14, 14, 1, 20000, 0, 1),
(15, 19, 4, 40000, 0, 1),
(16, 20, 4, 235000, 0, 1),
(17, 19, 1, 40000, 0, 1),
(18, 21, 4, 11500, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `cName` varchar(200) NOT NULL,
  `cAddress` varchar(200) NOT NULL,
  `cOptionalAddress` varchar(400) NOT NULL,
  `cEmail` varchar(100) NOT NULL,
  `cPhone` varchar(30) NOT NULL,
  `cOrderNotes` varchar(1000) NOT NULL,
  `userId` int(11) NOT NULL,
  `sellerId` int(11) NOT NULL,
  `installmentId` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

-- INSERT INTO `orders` (`orderId`, `cName`, `cAddress`, `cOptionalAddress`, `cEmail`, `cPhone`, `cOrderNotes`, `userId`, `sellerId`, `installmentId`, `total`, `orderDate`, `status`) VALUES
-- (11, ';ldsfk', 'k;akds;k', ';k;ladsk;ld', 'e@gmail.com', '03342099201', 'kjflak alkjlk adlkajsldjalsdjals ', 4, 6, 3, 30000, '2024-01-25 19:00:00', 'deliverd'),
-- (12, 'umar', 'sfd', 'fsdvs', 'mani@gmail.com', '03484034311', 'fdgg', 4, 9, 4, 4800, '2024-02-02 19:00:00', 'deliverd'),
-- (13, 'umar', 'bangalore', '12', 'mani@gmail.com', '03484034311', 'i want ', 4, 6, 4, 60000, '2024-02-03 19:00:00', 'deliverd'),
-- (14, 'mANI', 'ASKDKAJN ASJDKAJDN ASDASJD ', 'ASKJDLKAJD ASKSJDASL DKAJDSANDLK ', 'abc@gmail.com', '03484034311', 'sadkjls ajdaksm,ndajjdlask am', 7, 7, 1, 2400, '2024-02-05 19:00:00', 'pending'),
-- (15, 'mani', 'th', '', 'umar00@g', '03484034311', 'nnnn', 12, 6, 4, 16000, '2024-02-14 19:00:00', 'pending'),
-- (16, 'mani', 'bangalore', '', 'mani1@gmail.com', '03484034311', 'bbjgh', 8, 9, 4, 94000, '2024-02-14 19:00:00', 'shipped'),
-- (17, 'mani', 'bangalore', '', 'mani344@gmail.com', '03484034311', 'plz nknkj', 16, 6, 1, 4800, '2024-02-15 19:00:00', 'deliverd'),
-- (18, ',anoj', 'kjsalkjdl', 'kjaslsdjalkj', 'mani1@gmail.com', '03480444597', 'sjkdlkasjd asdkja lskjdaksl d', 8, 6, 4, 4600, '2024-03-09 19:00:00', 'shipped');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pId` int(11) NOT NULL,
  `pName` varchar(500) NOT NULL,
  `pDesc` varchar(2000) NOT NULL,
  `pPrice` int(11) NOT NULL,
  `pImage` varchar(200) NOT NULL,
  `inStock` varchar(10) NOT NULL,
  `sellerId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pId`, `pName`, `pDesc`, `pPrice`, `pImage`, `inStock`, `sellerId`, `quantity`, `created_at`, `updated_at`) VALUES
(12, 'NEw Laptop', 'this is the new Laptop', 150000, 'laptopnew.jpg', 'yes', 6, 100, '2024-11-08', '2024-11-08'),
(14, 'Testing', 'Addadddasndjasldkhlsdkfjfasdfsa', 20000, 'pexels-erick-mufasa-1350789.jpg', 'yes', 6, 100, '2024-02-02', '2024-02-02'),
(18, 'New Product', 'excellent product', 12000, 'samsung-tab.jpg', 'yes', 9, 100, '2024-02-03', '2024-02-03'),
(19, 'Samsung A 02', '3/32 gb\r\ncamera (front) 15 mp\r\ncamera(back) 64mp', 40000, 'sam-a32.jpg', 'yes', 6, 100, '2024-02-06', '2024-02-06'),
(20, 'heavy Bike', 'very smooth bike', 235000, 'gallerynew-bg-6.jpg', 'yes', 9, 100, '2024-02-15', '2024-02-15'),
(21, 'New Product ', 'klasjdlakj askldjl asjdl', 11500, 'camera.png', 'yes', 6, 7, '2024-03-10', '2024-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE `products_categories` (
  `id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_categories`
--

INSERT INTO `products_categories` (`id`, `p_id`, `cat_id`) VALUES
(4, 10, 1),
(5, 11, 2),
(6, 12, 1),
(7, 13, 2),
(8, 14, 2),
(13, 18, 2),
(14, 19, 2),
(15, 20, 3),
(16, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `riderorder`
--

CREATE TABLE `riderorder` (
  `rOid` int(11) NOT NULL,
  `riderId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `delieveryStatus` varchar(200) NOT NULL DEFAULT 'Left Ware House',
  `amountToRecieve` int(11) NOT NULL DEFAULT 0,
  `amountRecieved` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riderorder`
--

INSERT INTO `riderorder` (`rOid`, `riderId`, `orderId`, `delieveryStatus`, `amountToRecieve`, `amountRecieved`) VALUES
(6, 10, 11, 'deliverd', 30000, 30000),
(7, 10, 12, 'shipped', 4800, 0),
(8, 7, 13, 'deliverd', 60000, 60000),
(9, 7, 16, 'deliverd', 94000, 94000),
(10, 7, 17, 'deliverd', 4800, 4800),
(11, 10, 16, 'shipped', 94000, 0),
(12, 7, 18, 'shipped', 4600, 0),
(13, 10, 18, 'shipped', 4600, 0),
(14, 10, 18, 'shipped', 4600, 0),
(15, 10, 18, 'shipped', 4600, 0),
(16, 10, 18, 'shipped', 4600, 0),
(17, 10, 18, 'shipped', 4600, 0),
(18, 10, 18, 'shipped', 4600, 0),
(19, 10, 18, 'shipped', 4600, 0),
(20, 10, 18, 'shipped', 4600, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `fName` varchar(300) NOT NULL,
  `lName` varchar(300) NOT NULL,
  `adhaar` varchar(18) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `email` varchar(200) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `gstno` int(200) NOT NULL,
  `address` varchar(300) NOT NULL,
  `adhaarFront` varchar(200) NOT NULL,
  `adhaarBack` varchar(200) NOT NULL,
  `accountType` varchar(30) NOT NULL,
  `accStatus` varchar(200) NOT NULL DEFAULT 'unblock',
  `signUpas` varchar(200) NOT NULL,
  `shopName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `fName`, `lName`, `adhaar`, `mobile`, `email`, `occupation`, `gstno`, `address`, `adhaarFront`, `adhaarBack`, `accountType`, `accStatus`, `signUpas`, `shopName`, `password`) VALUES
(3, 'mohammed', 'Ibrahim', '121212121212', '9876543210', 'f.md.ibrahim25@gmail.com', 'student', 0,'kjasdkl', 'sam-a32.jpg', 'samsung-tab.jpg', 'admin', 'unblock', 'admin', '', '12345678'),
(4, 'mohammed', 'tabrez', '121212121212', '9876543210', 'tabrez@mail.com', 'student', 0,'jalalpur sobatian', 'camera.png', 'Capture.PNG', 'rider', 'unblock', 'rider', '', '12345678'),
(6, 'norman', 'emmanuel', '121212121212', '9876543210', 'norman@gmail.com', 'student', 23456789, 'man', 'module_table_bottom.png', 'module_table_top.png', 'seller', 'unblock', 'seller', 'Binnance Electronics', '12345678'),
(7, 'mohammed', 'mujeeb', '121212121212', '9876543210', 'mujeeb@gmail.com', 'student', 0 ,'3', '0.png', '001.jpg', 'rider', 'unblock', 'rider', '', '12345678'),
(8, 'navneeth', 'v', '121212121212', '9876543210', 'navneeth@gmail.com', 'student', 0 , 'No address yet', 'pc.png', 'pclaptop.png', 'user', 'unblock', 'user', '', '12345678'),
(9, 'mohammed', 'yameen', '121212121212', '9876543210', 'yameen@gmail.com', 'student', 23456789, 'mankasnd', 'Untitled (1024 × 620 px).png', 'Untitled (1024 × 620 px).png', 'seller', 'unblock', 'seller', 'One Dollar Shop', '12345678'),
(10, 'swaroop', 'I', '121212121212', '9876543210', 'swaroop@gmail.com', 'student', 23456789, 'aslksjlk', 'WhatsApp Image 2024-05-29 at 1.59.21 AM.jpeg', 'WhatsApp Image 2024-05-29 at 1.59.21 AM.jpeg', 'rider', 'unblock', 'rider', '', '12345678'),
(16, 'mani', 'l', '121212121212', '9876543210', 'mani@gmail.com', 'student', 0, 'askj', 'a.jpeg', 'a.jpeg', 'user', 'unblock', 'user', '', '12345678'),
(17, 'ali', 'butt', '121212121212', '9876543210', 'ali@gmail.com', 'student', 0, 'daska', 'b.jpeg', 'b.jpeg', 'seller', 'unblock', 'seller', 'BMZ', '12345678'),
(18, 'omkar', 'om', '121212121212', '9876543210', 'omkar@gmail.com', 'student', 0, 'gujrat', 'h.jpeg', 'h.jpeg', 'newuser', 'unblock', 'seller', 'hafiz shop', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `installmentplans`
--
ALTER TABLE `installmentplans`
  ADD PRIMARY KEY (`installmentId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riderorder`
--
ALTER TABLE `riderorder`
  ADD PRIMARY KEY (`rOid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `installmentplans`
--
ALTER TABLE `installmentplans`
  MODIFY `installmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `riderorder`
--
ALTER TABLE `riderorder`
  MODIFY `rOid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

