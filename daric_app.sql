-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Haz 2023, 22:40:47
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `daric_app`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins_table`
--

CREATE TABLE `admins_table` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `admins_table`
--

INSERT INTO `admins_table` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(19000140, 'AdminAlpay', 'adminalpay1@hotmail.com', '123456789');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cart_table`
--

CREATE TABLE `cart_table` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `color` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `favorite_table`
--

CREATE TABLE `favorite_table` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `items_table`
--

CREATE TABLE `items_table` (
  `item_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `rating` double NOT NULL,
  `tags` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `sizes` varchar(100) NOT NULL,
  `colors` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `serialNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `items_table`
--

INSERT INTO `items_table` (`item_id`, `name`, `rating`, `tags`, `price`, `sizes`, `colors`, `description`, `image`, `serialNo`) VALUES
(13, 'Nutuk', 4.6, '[Mustafa Kemal Atatürk]', 95.1, '[Alfa]', '[biographies]', 'The main thing is that the Turkish nation lives as a dignified and honorable nation. This basis can only be obtained by having full independence. No matter how rich and prosperous, a nation deprived of independence cannot be deemed worthy of a higher treatment than being a servant in the face of the civilized world of humanity.To accept the patronage of a foreign state is nothing but a confession of deprivation of human qualities, helplessness and indolence. Indeed, those who have not fallen into this lowness should willingly bring a foreign master over them.can never be assumed.However, the dignity, self-esteem and ability of the Turk are very high and great. Such a nation should perish rather than live in captivity, child!So, either independence or death!Mustafa Kemal Atatürk', 'https://i.imgur.com/fnomfLe.jpg', '1881'),
(14, 'The Fellowship Of The Ring', 4.8, '[ J.R.R. Tolkien]', 150, '[HarperCollins]', '[Fantasy]', 'One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them.In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell into the hands of Bilbo Baggins, as told in The Hobbit. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.', 'https://i.imgur.com/hFndT1a.jpg', '11'),
(15, 'Dune', 4.8, '[Frank Herbert]', 99.9, '[İthaki]', '[science-fiction]', '\"There is no other book to compare to this book except The Lord of the Rings.\" -Arthur C. Clarke \"Powerful, believable and ingenious.\" -Robert A. Heinlein \"One of the cornerstones of modern science fiction.\" -Chicago Tribune Hugo Award in the Best Novel category, Nebula Award in the Best Novel category and Nebula Award in the category of Best Novel by the readers as the best science fiction work of the 20th century, Dune series is in Ithaki in its 50th year with brand new covers and revised translations.', 'https://i.imgur.com/4FFlDi3.jpg', '1234');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders_table`
--

CREATE TABLE `orders_table` (
  `order_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `selectedItems` text NOT NULL,
  `deliverySystem` varchar(100) NOT NULL,
  `paymentSystem` varchar(100) NOT NULL,
  `cardName` varchar(20) NOT NULL,
  `cardNo` varchar(16) NOT NULL,
  `cardExp` varchar(5) NOT NULL,
  `cardCVV` int(3) NOT NULL,
  `note` text NOT NULL,
  `totalAmount` double NOT NULL,
  `image` text NOT NULL,
  `status` varchar(100) NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `shipmentAddress` text NOT NULL,
  `phoneNumber` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `recycle_table`
--

CREATE TABLE `recycle_table` (
  `recycle_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `serialNo` varchar(10) NOT NULL,
  `ibanNo` varchar(26) NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cargoNo` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_table`
--

CREATE TABLE `users_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users_table`
--

INSERT INTO `users_table` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'Alpay', 'alpay_turgan@hotmail.com', '25f9e794323b453885f5181f1b624d0b'),
(2, 'Altay Turgut', 'nesrinturgan07@hotmail.com', '25f9e794323b453885f5181f1b624d0b'),
(3, 'Atalay', 'dirtydudesp@hotmail.com', '870a38e4776fae107a5df42e056900e8'),
(4, 'Atalay', 'atalay@hotmail.com', '25f9e794323b453885f5181f1b624d0b'),
(5, 'Armut', 'nesnes@hotmail.com', '25f9e794323b453885f5181f1b624d0b');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins_table`
--
ALTER TABLE `admins_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Tablo için indeksler `cart_table`
--
ALTER TABLE `cart_table`
  ADD PRIMARY KEY (`cart_id`);

--
-- Tablo için indeksler `favorite_table`
--
ALTER TABLE `favorite_table`
  ADD PRIMARY KEY (`favorite_id`);

--
-- Tablo için indeksler `items_table`
--
ALTER TABLE `items_table`
  ADD PRIMARY KEY (`item_id`);

--
-- Tablo için indeksler `orders_table`
--
ALTER TABLE `orders_table`
  ADD PRIMARY KEY (`order_id`);

--
-- Tablo için indeksler `recycle_table`
--
ALTER TABLE `recycle_table`
  ADD PRIMARY KEY (`recycle_id`);

--
-- Tablo için indeksler `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`user_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins_table`
--
ALTER TABLE `admins_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19000141;

--
-- Tablo için AUTO_INCREMENT değeri `cart_table`
--
ALTER TABLE `cart_table`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Tablo için AUTO_INCREMENT değeri `favorite_table`
--
ALTER TABLE `favorite_table`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- Tablo için AUTO_INCREMENT değeri `items_table`
--
ALTER TABLE `items_table`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `orders_table`
--
ALTER TABLE `orders_table`
  MODIFY `order_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Tablo için AUTO_INCREMENT değeri `recycle_table`
--
ALTER TABLE `recycle_table`
  MODIFY `recycle_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Tablo için AUTO_INCREMENT değeri `users_table`
--
ALTER TABLE `users_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
