-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost:3306
-- 產生時間： 2022 年 04 月 29 日 23:58
-- 伺服器版本： 8.0.28-0ubuntu0.20.04.3
-- PHP 版本： 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ABC`
--
CREATE DATABASE IF NOT EXISTS `ABC` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ABC`;

-- --------------------------------------------------------

--
-- 資料表結構 `AllUnits`
--

CREATE TABLE `AllUnits` (
  `ID` int NOT NULL,
  `Unit` varchar(256) NOT NULL,
  `Floor` varchar(255) DEFAULT NULL,
  `Un` varchar(255) DEFAULT NULL,
  `Amount` int NOT NULL,
  `ChineseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnglishName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `AllUnits`
--

INSERT INTO `AllUnits` (`ID`, `Unit`, `Floor`, `Un`, `Amount`, `ChineseName`, `EnglishName`) VALUES
(1, 'ABC101', '1', '01', 400, '', ''),
(2, 'ABC102', '1', '02', 600, '', ''),
(3, 'ABC103', '1', '03', 500, '', ''),
(4, 'ABC104', '1', '04', 600, '', ''),
(5, 'ABC105', '1', '05', 600, '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `Cal`
--

CREATE TABLE `Cal` (
  `ID` int NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `ManageFee` int DEFAULT NULL,
  `AmountPaid` int DEFAULT NULL,
  `Remain` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Cancel`
--

CREATE TABLE `Cancel` (
  `ID` int NOT NULL,
  `Editor` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL,
  `Comment` varchar(535) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Delete_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Cancel`
--

INSERT INTO `Cancel` (`ID`, `Editor`, `Unit`, `ManageFeeDate`, `DCode`, `Amount`, `Method`, `BCQ`, `Paid`, `RCode`, `DemandDate`, `ReceivedDate`, `BankInDate`, `Comment`, `Delete_at`) VALUES
(1, 'admin', 'ABC105', '2021-08', 'ABC1052021-08', 600, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL, NULL, '2021-08-25 15:29:58'),
(2, 'admin', 'ABC105', '2021-08', 'ABC1052021-08', 600, 'cash', '', '600', '5', '2021-08-01', '2021-08-25', NULL, NULL, '2021-08-25 15:41:39');

-- --------------------------------------------------------

--
-- 資料表結構 `Receipt`
--

CREATE TABLE `Receipt` (
  `ID` int NOT NULL,
  `RCode` int DEFAULT NULL,
  `DCode` varchar(255) NOT NULL,
  `Paid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Receipt`
--

INSERT INTO `Receipt` (`ID`, `RCode`, `DCode`, `Paid`) VALUES
(3, 1, 'ABC1032021-08', 500),
(4, 2, 'ABC1042021-08', 600),
(6, 4, 'ABC1042021-07', 600),
(7, 5, 'ABC1052021-08', 600),
(8, 6, 'ABC1052021-08', 600),
(9, 7, 'ABC1012021-08', 400);

-- --------------------------------------------------------

--
-- 資料表結構 `Total`
--

CREATE TABLE `Total` (
  `ID` int NOT NULL,
  `Unit` varchar(255) NOT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int NOT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` int DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Total`
--

INSERT INTO `Total` (`ID`, `Unit`, `ManageFeeDate`, `DCode`, `Amount`, `Method`, `BCQ`, `Paid`, `RCode`, `DemandDate`, `ReceivedDate`, `BankInDate`) VALUES
(4, 'ABC104', '2021-08', 'ABC1042021-08', 600, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(12, 'ABC103', '2021-08', 'ABC1032021-08', 500, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(17, 'ABC104', '2021-07', 'ABC1042021-07', 600, 'cash', '', '600', 4, '2021-07-01', '2021-08-25', NULL),
(19, 'ABC105', '2021-08', 'ABC1052021-08', 600, 'cash', '', '600', 6, '2021-08-01', '2021-08-12', NULL),
(20, 'ABC101', '2021-08', 'ABC1012021-08', 400, 'cash', '', '400', 7, '2021-08-01', '2021-08-30', NULL),
(21, 'ABC102', '2021-08', 'ABC1022021-08', 400, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(27, 'ABC102', '2021-08-apart', 'ABC1022021-08-apart', 200, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(28, 'ABC102', 'deposit-2021-08', 'ABC102deposit-2021-08', 600, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Users`
--

INSERT INTO `Users` (`id`, `username`, `role`) VALUES
(1, 'admin', 's');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `AllUnits`
--
ALTER TABLE `AllUnits`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Unit` (`Unit`);

--
-- 資料表索引 `Cal`
--
ALTER TABLE `Cal`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Cancel`
--
ALTER TABLE `Cancel`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Receipt`
--
ALTER TABLE `Receipt`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Total`
--
ALTER TABLE `Total`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `DCode` (`DCode`);

--
-- 資料表索引 `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `AllUnits`
--
ALTER TABLE `AllUnits`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Cal`
--
ALTER TABLE `Cal`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Cancel`
--
ALTER TABLE `Cancel`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Receipt`
--
ALTER TABLE `Receipt`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Total`
--
ALTER TABLE `Total`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 資料庫： `BGX`
--
CREATE DATABASE IF NOT EXISTS `BGX` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `BGX`;

-- --------------------------------------------------------

--
-- 資料表結構 `AllUnits`
--

CREATE TABLE `AllUnits` (
  `ID` int NOT NULL,
  `Unit` varchar(256) NOT NULL,
  `Floor` varchar(255) DEFAULT NULL,
  `Un` varchar(255) DEFAULT NULL,
  `Amount` int NOT NULL,
  `ChineseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnglishName` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `AllUnits`
--

INSERT INTO `AllUnits` (`ID`, `Unit`, `Floor`, `Un`, `Amount`, `ChineseName`, `EnglishName`) VALUES
(1, 'BGX101', '1', '01', 400, '', ''),
(2, 'BGX102', '1', '02', 600, '', ''),
(3, 'BGX103', '1', '03', 500, '', ''),
(4, 'BGX104', '1', '04', 600, '', ''),
(5, 'BGX105', '1', '05', 600, '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `Cal`
--

CREATE TABLE `Cal` (
  `ID` int NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `ManageFee` int DEFAULT NULL,
  `AmountPaid` int DEFAULT NULL,
  `Remain` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `Cancel`
--

CREATE TABLE `Cancel` (
  `ID` int NOT NULL,
  `Editor` varchar(256) DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL,
  `Comment` varchar(535) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Delete_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `Receipt`
--

CREATE TABLE `Receipt` (
  `ID` int NOT NULL,
  `RCode` int DEFAULT NULL,
  `DCode` varchar(255) NOT NULL,
  `Paid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `Receipt`
--

INSERT INTO `Receipt` (`ID`, `RCode`, `DCode`, `Paid`) VALUES
(1, 1, 'BGX1012021-07', 700),
(2, 2, 'BGX1022021-06', 600);

-- --------------------------------------------------------

--
-- 資料表結構 `Total`
--

CREATE TABLE `Total` (
  `ID` int NOT NULL,
  `Unit` varchar(255) NOT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int NOT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` int DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `Total`
--

INSERT INTO `Total` (`ID`, `Unit`, `ManageFeeDate`, `DCode`, `Amount`, `Method`, `BCQ`, `Paid`, `RCode`, `DemandDate`, `ReceivedDate`, `BankInDate`) VALUES
(1, 'BGX101', '2021-07', 'BGX1012021-07', 700, 'cash', '', '700', 1, '2021-07-01', '2021-07-02', '2021-07-25'),
(2, 'BGX102', '2021-07', 'BGX1022021-07', 200, NULL, NULL, NULL, NULL, '2021-07-01', NULL, NULL),
(3, 'BGX103', '2021-07', 'BGX1032021-07', 500, NULL, NULL, NULL, NULL, '2021-07-01', NULL, NULL),
(4, 'BGX104', '2021-07', 'BGX1042021-07', 600, NULL, NULL, NULL, NULL, '2021-07-01', NULL, NULL),
(5, 'BGX105', '2021-07', 'BGX1052021-07', 600, NULL, NULL, NULL, NULL, '2021-07-01', NULL, NULL),
(6, 'BGX102', '2021-06', 'BGX1022021-06', 600, 'cash', '', '600', 2, '2021-06-01', '2021-07-02', '2021-07-25'),
(7, 'BGX102', '2021-07-apart', 'BGX1022021-07-apart', 400, NULL, NULL, NULL, NULL, '2021-07-01', NULL, NULL),
(9, 'BGX101', '2021-06', 'BGX1012021-06', 400, NULL, NULL, NULL, NULL, '2021-06-01', NULL, NULL),
(11, 'BGX103', '2021-06', 'BGX1032021-06', 500, NULL, NULL, NULL, NULL, '2021-06-01', NULL, NULL),
(12, 'BGX104', '2021-06', 'BGX1042021-06', 600, NULL, NULL, NULL, NULL, '2021-06-01', NULL, NULL),
(13, 'BGX105', '2021-06', 'BGX1052021-06', 600, NULL, NULL, NULL, NULL, '2021-06-01', NULL, NULL),
(16, 'BGX101', '2021-08', 'BGX1012021-08', 400, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(17, 'BGX102', '2021-08', 'BGX1022021-08', 600, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(18, 'BGX103', '2021-08', 'BGX1032021-08', 500, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(19, 'BGX104', '2021-08', 'BGX1042021-08', 600, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(20, 'BGX105', '2021-08', 'BGX1052021-08', 600, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Users`
--

INSERT INTO `Users` (`id`, `username`, `role`) VALUES
(1, 'puser', 's'),
(2, 'puser', 'p');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `AllUnits`
--
ALTER TABLE `AllUnits`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Unit` (`Unit`);

--
-- 資料表索引 `Cal`
--
ALTER TABLE `Cal`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Cancel`
--
ALTER TABLE `Cancel`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Receipt`
--
ALTER TABLE `Receipt`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Total`
--
ALTER TABLE `Total`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `DCode` (`DCode`);

--
-- 資料表索引 `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `AllUnits`
--
ALTER TABLE `AllUnits`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Cal`
--
ALTER TABLE `Cal`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Cancel`
--
ALTER TABLE `Cancel`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Receipt`
--
ALTER TABLE `Receipt`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Total`
--
ALTER TABLE `Total`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 資料庫： `Estate`
--
CREATE DATABASE IF NOT EXISTS `Estate` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `Estate`;

-- --------------------------------------------------------

--
-- 資料表結構 `List`
--

CREATE TABLE `List` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `chname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ps` varchar(10) DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `puser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nuser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `List`
--

INSERT INTO `List` (`id`, `code`, `chname`, `enname`, `ps`, `status`, `puser`, `nuser`) VALUES
(1, 'BGX', '翠海花園', 'Barlon Garden', '2', 'Under', 'admin', 'puser'),
(21, 'ABC', '甲乙丙', 'ABC', '1', 'Under', 'admin', 'admin'),
(23, 'YFG', '怡豐閣', 'Yee Fung Court', '2', 'Under', 'admin', 'admin'),
(28, 'KSM', '國城大廈', 'Kaisers Mansion', '2', 'Under', 'admin', 'puser');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(256) NOT NULL,
  `role` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `username`, `role`) VALUES
(1, 'admin', 's'),
(2, 'puser', 'p'),
(3, 'nuser', 'n');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `List`
--
ALTER TABLE `List`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `List`
--
ALTER TABLE `List`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 資料庫： `KSM`
--
CREATE DATABASE IF NOT EXISTS `KSM` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `KSM`;

-- --------------------------------------------------------

--
-- 資料表結構 `AllUnits`
--

CREATE TABLE `AllUnits` (
  `ID` int NOT NULL,
  `Unit` varchar(256) NOT NULL,
  `Floor` varchar(255) DEFAULT NULL,
  `Un` varchar(255) DEFAULT NULL,
  `Amount` int NOT NULL,
  `ChineseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnglishName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Cal`
--

CREATE TABLE `Cal` (
  `ID` int NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `ManageFee` int DEFAULT NULL,
  `AmountPaid` int DEFAULT NULL,
  `Remain` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Cancel`
--

CREATE TABLE `Cancel` (
  `ID` int NOT NULL,
  `Editor` varchar(255) DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL,
  `Comment` varchar(535) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Delete_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Receipt`
--

CREATE TABLE `Receipt` (
  `ID` int NOT NULL,
  `RCode` int DEFAULT NULL,
  `DCode` varchar(255) NOT NULL,
  `Paid` int DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Total`
--

CREATE TABLE `Total` (
  `ID` int NOT NULL,
  `Unit` varchar(255) NOT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int NOT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` int DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Users`
--

INSERT INTO `Users` (`id`, `username`, `role`) VALUES
(1, 'admin', 's'),
(2, 'puser', 's');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `AllUnits`
--
ALTER TABLE `AllUnits`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Unit` (`Unit`);

--
-- 資料表索引 `Cal`
--
ALTER TABLE `Cal`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Cancel`
--
ALTER TABLE `Cancel`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Receipt`
--
ALTER TABLE `Receipt`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Total`
--
ALTER TABLE `Total`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `DCode` (`DCode`);

--
-- 資料表索引 `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `AllUnits`
--
ALTER TABLE `AllUnits`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Cal`
--
ALTER TABLE `Cal`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Cancel`
--
ALTER TABLE `Cancel`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Receipt`
--
ALTER TABLE `Receipt`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Total`
--
ALTER TABLE `Total`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 資料庫： `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- 資料表結構 `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- 傾印資料表的資料 `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', '1', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"ABC\",\"BBB\",\"BGX\",\"Estate\",\"phpmyadmin\",\"User\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"@TABLE@ 資料表結構\",\"latex_structure_continued_caption\":\"@TABLE@ 資料表結構 (續)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"@TABLE@ 表的內容\",\"latex_data_continued_caption\":\"@TABLE@ 表的內容 (續)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- 資料表結構 `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- 傾印資料表的資料 `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"YFG\",\"table\":\"Total\"},{\"db\":\"YFG\",\"table\":\"AllUnits\"},{\"db\":\"YFG\",\"table\":\"Cancel\"},{\"db\":\"Estate\",\"table\":\"List\"},{\"db\":\"KSM\",\"table\":\"AllUnits\"},{\"db\":\"KSM\",\"table\":\"Users\"},{\"db\":\"KSM\",\"table\":\"Total\"},{\"db\":\"KSM\",\"table\":\"Receipt\"},{\"db\":\"KSM\",\"table\":\"Cancel\"},{\"db\":\"KSM\",\"table\":\"Cal\"}]');

-- --------------------------------------------------------

--
-- 資料表結構 `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- 傾印資料表的資料 `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`) VALUES
('root', 'Estate', 'List', '{\"sorted_col\":\"`List`.`id`  ASC\"}'),
('root', 'YFG', 'Total', '{\"sorted_col\":\"`Total`.`Paid` ASC\"}');

-- --------------------------------------------------------

--
-- 資料表結構 `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- 傾印資料表的資料 `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `config_data`) VALUES
('root', '{\"lang\":\"zh_TW\",\"Console\\/Mode\":\"collapse\",\"ThemeDefault\":\"pmahomme\"}');

-- --------------------------------------------------------

--
-- 資料表結構 `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- 資料表結構 `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- 資料表索引 `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- 資料表索引 `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- 資料表索引 `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- 資料表索引 `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- 資料表索引 `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- 資料表索引 `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- 資料表索引 `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- 資料表索引 `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- 資料表索引 `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- 資料表索引 `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- 資料表索引 `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- 資料表索引 `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- 資料表索引 `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- 資料表索引 `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- 資料表索引 `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- 資料表索引 `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- 資料表索引 `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 資料庫： `User`
--
CREATE DATABASE IF NOT EXISTS `User` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `User`;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$wdFxa4.TxS4.GHUKta5lC.j5bnjgzFiVYbMfkiJHPlwJ2LZULmmy6', '2021-07-01 14:30:40'),
(2, 'puser', '$2y$10$gjAJ3oQXClGEGpWcnCg9J.oGskj8Pziw0YhHmmd6sNn4Jsh9Y.xYu', '2021-07-03 14:18:02'),
(3, 'nuser', '$2y$10$lQv/uvG39BVplQgdaemYS.I/hcxwfLI1WsjVHrYu2Ca5SN5PJ32ZW', '2021-07-03 14:18:16');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 資料庫： `YFG`
--
CREATE DATABASE IF NOT EXISTS `YFG` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `YFG`;

-- --------------------------------------------------------

--
-- 資料表結構 `AllUnits`
--

CREATE TABLE `AllUnits` (
  `ID` int NOT NULL,
  `Unit` varchar(256) NOT NULL,
  `Floor` varchar(255) DEFAULT NULL,
  `Un` varchar(255) DEFAULT NULL,
  `Amount` int NOT NULL,
  `ChineseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnglishName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `AllUnits`
--

INSERT INTO `AllUnits` (`ID`, `Unit`, `Floor`, `Un`, `Amount`, `ChineseName`, `EnglishName`) VALUES
(1, '01A', '', '', 979, '', ''),
(2, '01B', '', '', 780, '', ''),
(3, '01C', '', '', 780, '', ''),
(4, '01D', '', '', 979, '', ''),
(5, '01E', '', '', 979, '', ''),
(6, '01F', '', '', 780, '', ''),
(7, '01G', '', '', 780, '', ''),
(8, '01H', '', '', 979, '', ''),
(9, '02A', '', '', 979, '', ''),
(10, '02B', '', '', 780, '', ''),
(11, '02C', '', '', 780, '', ''),
(12, '02D', '', '', 979, '', ''),
(13, '02E', '', '', 979, '', ''),
(14, '02F', '', '', 780, '', ''),
(15, '02G', '', '', 780, '', ''),
(16, '02H', '', '', 979, '', ''),
(17, '03A', '', '', 979, '', ''),
(18, '03B', '', '', 780, '', ''),
(19, '03C', '', '', 780, '', ''),
(20, '03D', '', '', 979, '', ''),
(21, '03E', '', '', 979, '', ''),
(22, '03F', '', '', 780, '', ''),
(23, '03G', '', '', 780, '', ''),
(24, '03H', '', '', 979, '', ''),
(25, '04A', '', '', 979, '', ''),
(26, '04B', '', '', 780, '', ''),
(27, '04C', '', '', 780, '', ''),
(28, '04D', '', '', 979, '', ''),
(29, '04E', '', '', 979, '', ''),
(30, '04F', '', '', 780, '', ''),
(31, '04G', '', '', 780, '', ''),
(32, '04H', '', '', 979, '', ''),
(33, '05A', '', '', 979, '', ''),
(34, '05B', '', '', 780, '', ''),
(35, '05C', '', '', 780, '', ''),
(36, '05D', '', '', 979, '', ''),
(37, '05E', '', '', 979, '', ''),
(38, '05F', '', '', 780, '', ''),
(39, '05G', '', '', 780, '', ''),
(40, '05H', '', '', 979, '', ''),
(41, '06A', '', '', 979, '', ''),
(42, '06B', '', '', 780, '', ''),
(43, '06C', '', '', 780, '', ''),
(44, '06D', '', '', 979, '', ''),
(45, '06E', '', '', 979, '', ''),
(46, '06F', '', '', 780, '', ''),
(47, '06G', '', '', 780, '', ''),
(48, '06H', '', '', 979, '', ''),
(49, '07A', '', '', 979, '', ''),
(50, '07B', '', '', 780, '', ''),
(51, '07C', '', '', 780, '', ''),
(52, '07D', '', '', 979, '', ''),
(53, '07E', '', '', 979, '', ''),
(54, '07F', '', '', 780, '', ''),
(55, '07G', '', '', 780, '', ''),
(56, '07H', '', '', 979, '', ''),
(57, '08A', '', '', 979, '', ''),
(58, '08B', '', '', 780, '', ''),
(59, '08C', '', '', 780, '', ''),
(60, '08D', '', '', 979, '', ''),
(61, '08E', '', '', 979, '', ''),
(62, '08F', '', '', 780, '', ''),
(63, '08G', '', '', 780, '', ''),
(64, '08H', '', '', 979, '', ''),
(65, '09A', '', '', 979, '', ''),
(66, '09B', '', '', 780, '', ''),
(67, '09C', '', '', 780, '', ''),
(68, '09D', '', '', 979, '', ''),
(69, '09E', '', '', 979, '', ''),
(70, '09F', '', '', 780, '', ''),
(71, '09G', '', '', 780, '', ''),
(72, '09H', '', '', 979, '', ''),
(73, '10A', '', '', 979, '', ''),
(74, '10B', '', '', 780, '', ''),
(75, '10C', '', '', 780, '', ''),
(76, '10D', '', '', 979, '', ''),
(77, '10E', '', '', 979, '', ''),
(78, '10F', '', '', 780, '', ''),
(79, '10G', '', '', 780, '', ''),
(80, '10H', '', '', 979, '', ''),
(81, '11A', '', '', 979, '', ''),
(82, '11B', '', '', 780, '', ''),
(83, '11C', '', '', 780, '', ''),
(84, '11D', '', '', 979, '', ''),
(85, '11E', '', '', 979, '', ''),
(86, '11F', '', '', 780, '', ''),
(87, '11G', '', '', 780, '', ''),
(88, '11H', '', '', 979, '', ''),
(89, '12A', '', '', 979, '', ''),
(90, '12B', '', '', 780, '', ''),
(91, '12C', '', '', 780, '', ''),
(92, '12D', '', '', 979, '', ''),
(93, '12E', '', '', 979, '', ''),
(94, '12F', '', '', 780, '', ''),
(95, '12G', '', '', 780, '', ''),
(96, '12H', '', '', 979, '', ''),
(97, '13A', '', '', 979, '', ''),
(98, '13B', '', '', 780, '', ''),
(99, '13C', '', '', 780, '', ''),
(100, '13D', '', '', 979, '', ''),
(101, '13E', '', '', 979, '', ''),
(102, '13F', '', '', 780, '', ''),
(103, '13G', '', '', 780, '', ''),
(104, '13H', '', '', 979, '', ''),
(105, '14A', '', '', 979, '', ''),
(106, '14B', '', '', 780, '', ''),
(107, '14C', '', '', 780, '', ''),
(108, '14D', '', '', 979, '', ''),
(109, '14E', '', '', 979, '', ''),
(110, '14F', '', '', 780, '', ''),
(111, '14G', '', '', 780, '', ''),
(112, '14H', '', '', 979, '', ''),
(113, '15A', '', '', 979, '', ''),
(114, '15B', '', '', 780, '', ''),
(115, '15C', '', '', 780, '', ''),
(116, '15D', '', '', 979, '', ''),
(117, '15E', '', '', 979, '', ''),
(118, '15F', '', '', 780, '', ''),
(119, '15G', '', '', 780, '', ''),
(120, '15H', '', '', 979, '', ''),
(121, '16A', '', '', 979, '', ''),
(122, '16B', '', '', 780, '', ''),
(123, '16C', '', '', 780, '', ''),
(124, '16D', '', '', 979, '', ''),
(125, '16E', '', '', 979, '', ''),
(126, '16F', '', '', 780, '', ''),
(127, '16G', '', '', 780, '', ''),
(128, '16H', '', '', 979, '', ''),
(129, '17A', '', '', 979, '', ''),
(130, '17B', '', '', 780, '', ''),
(131, '17C', '', '', 780, '', ''),
(132, '17D', '', '', 979, '', ''),
(133, '17E', '', '', 979, '', ''),
(134, '17F', '', '', 780, '', ''),
(135, '17G', '', '', 780, '', ''),
(136, '17H', '', '', 979, '', ''),
(137, '18A', '', '', 979, '', ''),
(138, '18B', '', '', 780, '', ''),
(139, '18C', '', '', 780, '', ''),
(140, '18D', '', '', 979, '', ''),
(141, '18E', '', '', 979, '', ''),
(142, '18F', '', '', 780, '', ''),
(143, '18G', '', '', 780, '', ''),
(144, '18H', '', '', 979, '', ''),
(145, '19A', '', '', 979, '', ''),
(146, '19B', '', '', 780, '', ''),
(147, '19C', '', '', 780, '', ''),
(148, '19D', '', '', 979, '', ''),
(149, '19E', '', '', 979, '', ''),
(150, '19F', '', '', 780, '', ''),
(151, '19G', '', '', 780, '', ''),
(152, '19H', '', '', 979, '', ''),
(153, '20A', '', '', 979, '', ''),
(154, '20B', '', '', 780, '', ''),
(155, '20C', '', '', 780, '', ''),
(156, '20D', '', '', 979, '', ''),
(157, '20E', '', '', 979, '', ''),
(158, '20F', '', '', 780, '', ''),
(159, '20G', '', '', 780, '', ''),
(160, '20H', '', '', 979, '', ''),
(161, '21A', '', '', 979, '', ''),
(162, '21B', '', '', 780, '', ''),
(163, '21C', '', '', 780, '', ''),
(164, '21D', '', '', 979, '', ''),
(165, '21E', '', '', 979, '', ''),
(166, '21F', '', '', 780, '', ''),
(167, '21G', '', '', 780, '', ''),
(168, '21H', '', '', 979, '', ''),
(169, '22A', '', '', 979, '', ''),
(170, '22B', '', '', 780, '', ''),
(171, '22C', '', '', 780, '', ''),
(172, '22D', '', '', 979, '', ''),
(173, '22E', '', '', 979, '', ''),
(174, '22F', '', '', 780, '', ''),
(175, '22G', '', '', 780, '', ''),
(176, '22H', '', '', 979, '', ''),
(177, '23A', '', '', 979, '', ''),
(178, '23B', '', '', 780, '', ''),
(179, '23C', '', '', 780, '', ''),
(180, '23D', '', '', 979, '', ''),
(181, '23E', '', '', 979, '', ''),
(182, '23F', '', '', 780, '', ''),
(183, '23G', '', '', 780, '', ''),
(184, '23H', '', '', 979, '', ''),
(185, '24A', '', '', 979, '', ''),
(186, '24B', '', '', 780, '', ''),
(187, '24C', '', '', 780, '', ''),
(188, '24D', '', '', 979, '', ''),
(189, '24E', '', '', 979, '', ''),
(190, '24F', '', '', 780, '', ''),
(191, '24G', '', '', 780, '', ''),
(192, '24H', '', '', 979, '', ''),
(193, '25A', '', '', 979, '', ''),
(194, '25B', '', '', 780, '', ''),
(195, '25C', '', '', 780, '', ''),
(196, '25D', '', '', 979, '', ''),
(197, '25E', '', '', 979, '', ''),
(198, '25F', '', '', 780, '', ''),
(199, '25G', '', '', 780, '', ''),
(200, '25H', '', '', 979, '', ''),
(201, 'SHOP01', '', '', 813, '', ''),
(202, 'SHOP02', '', '', 747, '', ''),
(203, 'SHOP03', '', '', 664, '', ''),
(204, 'SHOP04', '', '', 713, '', ''),
(205, 'SHOP05', '', '', 813, '', ''),
(206, 'SHOP06', '', '', 465, '', ''),
(207, 'SHOP07', '', '', 398, '', ''),
(208, 'SHOP08', '', '', 465, '', ''),
(210, 'SHOP10', '', '', 896, '', ''),
(211, 'SHOP11', '', '', 1061, '', ''),
(212, 'SHOP12', '', '', 878, '', ''),
(213, 'SHOP13', '', '', 730, '', ''),
(214, 'SHOP09', '', '', 530, '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `Cal`
--

CREATE TABLE `Cal` (
  `ID` int NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `ManageFee` int DEFAULT NULL,
  `AmountPaid` int DEFAULT NULL,
  `Remain` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Cancel`
--

CREATE TABLE `Cancel` (
  `ID` int NOT NULL,
  `Editor` varchar(256) DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL,
  `Comment` varchar(535) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Delete_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `Cancel`
--

INSERT INTO `Cancel` (`ID`, `Editor`, `Unit`, `ManageFeeDate`, `DCode`, `Amount`, `Method`, `BCQ`, `Paid`, `RCode`, `DemandDate`, `ReceivedDate`, `BankInDate`, `Comment`, `Delete_at`) VALUES
(1, 'admin', '13H', '2021-05', '13H2021-05', 932, 'cash', '', '932', '110', '2021-05-01', '2021-05-07', NULL, NULL, '2021-09-16 10:44:07'),
(2, 'admin', 'SHOP02', '2021-05', 'SHOP022021-05', 771, 'auto', '', '771', '212', '2021-05-01', '2021-05-24', NULL, NULL, '2021-09-16 16:49:41'),
(3, 'admin', 'SHOP02', '2021-05', 'SHOP022021-05', 771, NULL, NULL, NULL, NULL, '2021-05-01', NULL, NULL, NULL, '2021-09-16 16:49:56'),
(4, 'admin', '21D', '2021-06', '21D2021-06', 932, 'cheque', '', '932', '402', '2021-06-01', '2021-07-06', NULL, NULL, '2021-10-06 15:35:52'),
(5, 'admin', '19C', 'deposit-2021-10', '19Cdeposit-2021-10', 743, NULL, NULL, NULL, NULL, '2021-10-01', NULL, NULL, NULL, '2021-10-06 16:27:15'),
(6, 'admin', '13A', '2021-10', '13A2021-10', 932, NULL, NULL, NULL, NULL, '2021-10-01', NULL, NULL, NULL, '2021-10-06 16:49:10'),
(7, 'admin', '11B', '2021-07', '11B2021-07', 743, 'cheque', '', '743', '475', '2021-07-01', '2021-07-06', NULL, NULL, '2021-10-06 17:05:31'),
(8, 'admin', '24A', '2021-07', '24A2021-07', 932, 'cheque', '', '932', '549', '2021-07-01', '2021-07-27', NULL, NULL, '2021-10-07 14:37:21'),
(9, 'admin', '25B', '2021-09', '25B2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL, NULL, '2021-12-09 09:20:25'),
(10, 'admin', '09B', '2021-08', '09B2021-08', 780, 'auto', '', '780', '778', '2021-08-01', '2021-08-13', NULL, NULL, '2021-12-09 12:30:37'),
(11, 'admin', '18A', '2022-09', '18A2022-09', 979, NULL, NULL, NULL, NULL, '2022-09-01', NULL, NULL, NULL, '2022-01-06 21:18:56'),
(12, 'admin', '10H', '2022-09', '10H2022-09', 979, NULL, NULL, NULL, NULL, '2022-09-01', NULL, NULL, NULL, '2022-01-06 22:07:04'),
(13, 'admin', '23G', '2012-10', '23G2012-10', 780, NULL, NULL, NULL, NULL, '2012-10-01', NULL, NULL, NULL, '2022-01-06 22:19:58'),
(14, 'admin', '02G', '2021-09', '02G2021-09', 780, 'auto', '', '780', '970', '2021-09-01', '2021-09-14', NULL, NULL, '2022-01-07 00:02:30'),
(15, 'admin', '05G', '2021-09', '05G2021-09', 780, 'auto', '', '780', '937', '2021-09-01', '2021-09-14', NULL, NULL, '2022-01-07 00:19:32'),
(16, 'admin', '20A', '2021-09', '20A2021-09', 979, 'auto', '', '979', '938', '2021-09-01', '2021-09-14', NULL, NULL, '2022-01-07 00:19:47'),
(17, 'admin', '06E', '2021-09', '06E2021-09', 979, 'auto', '', '979', '941', '2021-09-01', '2021-09-14', NULL, NULL, '2022-01-07 00:20:02'),
(18, 'admin', '24H', '2021-09', '24H2021-09', 979, 'auto', '', '979', '947', '2021-09-01', '2021-09-14', NULL, NULL, '2022-01-07 00:20:12');

-- --------------------------------------------------------

--
-- 資料表結構 `Receipt`
--

CREATE TABLE `Receipt` (
  `ID` int NOT NULL,
  `RCode` int DEFAULT NULL,
  `DCode` varchar(255) NOT NULL,
  `Paid` int DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Receipt`
--

INSERT INTO `Receipt` (`ID`, `RCode`, `DCode`, `Paid`, `Date`) VALUES
(1, 1, '18F2021-05', 743, NULL),
(2, 1, '18F2021-06', 743, NULL),
(3, 1, '18F2021-07', 743, NULL),
(4, 1, '18F2021-08', 743, NULL),
(5, 1, '18F2021-09', 743, NULL),
(6, 1, '18F2021-10', 743, NULL),
(7, 1, '18F2021-11', 743, NULL),
(8, 1, '18F2021-12', 743, NULL),
(9, 2, 'SHOP032021-05', 632, NULL),
(10, 2, 'SHOP032021-06', 632, NULL),
(11, 3, '25B2021-05', 743, NULL),
(12, 3, '25B2021-06', 743, NULL),
(13, 4, '04G2021-05', 743, NULL),
(14, 4, '04G2021-06', 743, NULL),
(15, 5, '07B2021-05', 743, NULL),
(16, 5, '07B2021-06', 743, NULL),
(17, 5, '07B2021-07', 743, NULL),
(18, 5, '07B2021-08', 743, NULL),
(19, 5, '07B2021-09', 743, NULL),
(20, 5, '07B2021-10', 743, NULL),
(21, 5, '07B2021-11', 743, NULL),
(22, 5, '07B2021-12', 743, NULL),
(23, 6, '16B2021-05', 743, NULL),
(24, 6, '16B2021-06', 743, NULL),
(25, 7, '02H2021-05', 932, NULL),
(26, 7, '02H2021-06', 932, NULL),
(27, 8, '18A2021-05', 932, NULL),
(28, 8, '18A2021-06', 932, NULL),
(29, 9, '10H2021-05', 932, NULL),
(30, 10, '08A2021-05', 932, NULL),
(31, 11, '23H2021-05', 932, NULL),
(32, 11, '23H2021-06', 932, NULL),
(33, 12, '11B2021-05', 743, NULL),
(34, 12, '11B2021-06', 743, NULL),
(35, 13, '13A2021-05', 932, NULL),
(36, 13, '13A2021-06', 932, NULL),
(37, 14, '13F2021-04', 743, NULL),
(38, 15, '24C2021-02', 743, NULL),
(39, 15, '24C2021-03', 743, NULL),
(40, 15, '24C2021-04', 743, NULL),
(41, 16, '22E2021-04', 932, NULL),
(42, 17, '23D2021-04', 932, NULL),
(43, 18, '20H2021-04', 932, NULL),
(44, 19, '13D2021-04', 932, NULL),
(45, 20, '21F2021-04', 743, NULL),
(46, 21, 'SHOP072021-04', 379, NULL),
(47, 22, '11F2021-04', 743, NULL),
(48, 23, '11G2021-02', 743, NULL),
(49, 23, '11G2021-03', 743, NULL),
(50, 23, '11G2021-04', 743, NULL),
(51, 24, '12E2021-04', 932, NULL),
(52, 25, '23A2021-04', 932, NULL),
(53, 26, '22F2021-04', 743, NULL),
(54, 27, '15F2021-04', 743, NULL),
(55, 28, '17B2021-03', 743, NULL),
(56, 28, '17B2021-04', 743, NULL),
(57, 29, '09D2021-04', 932, NULL),
(58, 30, '04A2021-04', 932, NULL),
(59, 31, '14H2021-04', 932, NULL),
(60, 32, '02A2021-05', 932, NULL),
(61, 33, '02C2021-05', 743, NULL),
(62, 34, '03C2021-05', 743, NULL),
(63, 35, 'SHOP052021-05', 774, NULL),
(64, 36, '10G2021-04', 743, NULL),
(65, 37, '19C2021-05', 743, NULL),
(66, 38, '11A2021-05', 932, NULL),
(67, 39, '01B2021-05', 743, NULL),
(68, 40, '02D2021-05', 932, NULL),
(69, 41, '21A2021-05', 932, NULL),
(70, 42, '10B2021-05', 743, NULL),
(71, 43, '19D2021-05', 932, NULL),
(72, 44, '20B2021-05', 743, NULL),
(73, 45, '06D2021-05', 932, NULL),
(74, 46, '19B2021-05', 743, NULL),
(75, 47, '11D2021-05', 932, NULL),
(76, 48, '11C2021-05', 743, NULL),
(77, 49, '06C2021-05', 743, NULL),
(78, 50, '08E2021-05', 932, NULL),
(79, 51, '01D2021-05', 932, NULL),
(80, 52, '09E2021-05', 932, NULL),
(81, 53, 'SHOP012021-04', 774, NULL),
(82, 54, 'SHOP062021-05', 443, NULL),
(83, 55, '23B2021-05', 743, NULL),
(84, 56, '25H2021-05', 932, NULL),
(85, 57, '01C2021-05', 743, NULL),
(86, 58, '10D2021-05', 932, NULL),
(87, 59, '15D2021-05', 932, NULL),
(88, 60, '14A2021-05', 932, NULL),
(89, 61, '06F2021-05', 743, NULL),
(90, 62, '17E2021-05', 932, NULL),
(91, 63, '05C2021-05', 743, NULL),
(92, 64, '04C2021-05', 743, NULL),
(93, 65, '09G2021-05', 743, NULL),
(94, 66, '19F2021-05', 743, NULL),
(95, 67, '16G2021-05', 743, NULL),
(96, 68, '07C2021-05', 743, NULL),
(97, 69, '10E2021-05', 932, NULL),
(98, 70, '06A2021-05', 932, NULL),
(99, 71, '06B2021-05', 743, NULL),
(100, 72, '15B2021-05', 743, NULL),
(101, 73, '04F2021-05', 743, NULL),
(102, 74, '21E2021-05', 932, NULL),
(103, 75, '06H2021-05', 932, NULL),
(104, 76, '04H2021-03', 932, NULL),
(105, 76, '04H2021-04', 932, NULL),
(106, 76, '04H2021-05', 932, NULL),
(107, 76, '04H2021-06', 932, NULL),
(108, 76, '04H2021-07', 932, NULL),
(109, 76, '04H2021-08', 932, NULL),
(110, 77, '04D2021-05', 932, NULL),
(111, 78, '21C2021-05', 743, NULL),
(112, 79, '25E2021-05', 932, NULL),
(113, 80, '09C2021-05', 743, NULL),
(114, 81, '20E2021-05', 932, NULL),
(115, 82, '13E2021-03', 932, NULL),
(116, 82, '13E2021-04', 932, NULL),
(117, 83, '04E2021-05', 932, NULL),
(118, 84, '10A2021-05', 932, NULL),
(119, 85, '01E2021-05', 932, NULL),
(120, 86, '22B2021-05', 743, NULL),
(121, 87, '14D2021-05', 932, NULL),
(122, 88, '25G2021-05', 743, NULL),
(123, 89, '22D2021-05', 932, NULL),
(124, 90, '20D2021-05', 932, NULL),
(125, 91, '02F2021-05', 743, NULL),
(126, 92, '17H2021-05', 932, NULL),
(127, 93, '19A2021-05', 932, NULL),
(128, 94, '15E2021-05', 932, NULL),
(129, 95, '21G2021-05', 743, NULL),
(130, 96, 'SHOP072021-05', 379, NULL),
(131, 97, '23C2021-05', 743, NULL),
(132, 98, '06G2021-05', 743, NULL),
(133, 99, '07G2021-05', 743, NULL),
(134, 100, '12A2021-05', 932, NULL),
(135, 101, '12G2021-05', 743, NULL),
(136, 102, '19E2021-05', 932, NULL),
(137, 103, '02E2021-05', 932, NULL),
(138, 104, '14E2021-05', 932, NULL),
(139, 105, '07E2021-05', 932, NULL),
(140, 106, '17D2021-05', 932, NULL),
(141, 107, '25C2021-05', 743, NULL),
(142, 108, 'SHOP132021-04', 695, NULL),
(143, 108, 'SHOP132021-05', 695, NULL),
(144, 109, '05H2021-05', 932, NULL),
(145, 110, '13H2021-05', 932, NULL),
(146, 111, '13C2021-05', 743, NULL),
(147, 112, '24G2021-05', 743, NULL),
(148, 113, '11F2021-05', 743, NULL),
(149, 114, '05E2021-05', 932, NULL),
(150, 115, '15C2021-05', 743, NULL),
(151, 116, '17G2021-05', 743, NULL),
(152, 117, 'SHOP112021-05', 1010, NULL),
(153, 118, '05A2021-05', 932, NULL),
(154, 119, '08C2021-05', 743, NULL),
(155, 120, '15A2021-05', 932, NULL),
(156, 121, '17A2021-05', 932, NULL),
(157, 122, '09H2021-05', 932, NULL),
(158, 123, '22H2021-05', 932, NULL),
(159, 124, '17C2021-05', 743, NULL),
(160, 125, '14B2021-05', 743, NULL),
(161, 126, '22A2021-04', 932, NULL),
(162, 126, '22A2021-05', 932, NULL),
(163, 127, '04A2021-05', 932, NULL),
(164, 128, '21F2021-05', 743, NULL),
(165, 129, '20H2021-05', 932, NULL),
(166, 130, '24A2021-05', 932, NULL),
(167, 131, '20F2021-05', 743, NULL),
(168, 132, '18D2021-05', 932, NULL),
(169, 133, '14C2021-05', 743, NULL),
(170, 134, '20C2021-05', 743, NULL),
(171, 135, '10G2021-03', 743, NULL),
(172, 136, '18E2021-04', 932, NULL),
(173, 136, '18E2021-05', 932, NULL),
(174, 137, '13D2021-05', 932, NULL),
(175, 138, '04B2021-05', 743, NULL),
(176, 139, '10F2021-05', 743, NULL),
(177, 140, '18B2021-05', 743, NULL),
(178, 141, '07A2021-05', 932, NULL),
(179, 142, '02B2021-05', 743, NULL),
(180, 143, '02B2021-06', 743, NULL),
(181, 144, '23G2021-05', 743, NULL),
(182, 145, '23G2021-06', 743, NULL),
(183, 146, '05B2021-05', 743, NULL),
(184, 147, '18C2021-05', 743, NULL),
(185, 148, '19H2021-05', 932, NULL),
(186, 149, '20G2021-05', 743, NULL),
(187, 150, '24B2021-05', 743, NULL),
(188, 151, '08G2021-05', 743, NULL),
(189, 152, '08H2021-05', 932, NULL),
(190, 153, '22F2021-05', 743, NULL),
(191, 154, '12E2021-05', 932, NULL),
(192, 155, '15F2021-05', 743, NULL),
(193, 156, '03F2021-05', 743, NULL),
(194, 157, '22E2021-05', 932, NULL),
(195, 158, '23D2021-05', 932, NULL),
(196, 159, '05D2021-04', 932, NULL),
(197, 159, '05D2021-05', 932, NULL),
(198, 160, '09D2021-05', 932, NULL),
(199, 161, '23A2021-05', 932, NULL),
(200, 162, '21D2021-05', 932, NULL),
(201, 163, '23F2021-05', 743, NULL),
(202, 164, '01A2021-05', 932, NULL),
(203, 165, '01F2021-05', 743, NULL),
(204, 166, '01G2021-05', 743, NULL),
(205, 167, '01H2021-05', 932, NULL),
(206, 168, '02G2021-05', 743, NULL),
(207, 169, '03A2021-05', 932, NULL),
(208, 170, '03D2021-05', 932, NULL),
(209, 171, '03E2021-05', 932, NULL),
(210, 172, '03H2021-05', 932, NULL),
(211, 173, '05F2021-05', 743, NULL),
(212, 174, '05G2021-05', 743, NULL),
(213, 175, '06E2021-05', 932, NULL),
(214, 176, '07D2021-05', 932, NULL),
(215, 177, '07F2021-05', 743, NULL),
(216, 178, '08B2021-05', 743, NULL),
(217, 179, '09B2021-05', 743, NULL),
(218, 180, '09F2021-05', 743, NULL),
(219, 181, '10C2021-05', 743, NULL),
(220, 182, '11E2021-05', 932, NULL),
(221, 183, '11H2021-05', 932, NULL),
(222, 184, '12B2021-05', 743, NULL),
(223, 185, '12F2021-05', 743, NULL),
(224, 186, '12H2021-05', 932, NULL),
(225, 187, '13B2021-05', 743, NULL),
(226, 188, '14F2021-05', 743, NULL),
(227, 189, '14G2021-05', 743, NULL),
(228, 190, '15G2021-05', 743, NULL),
(229, 191, '15H2021-05', 932, NULL),
(230, 192, '16C2021-05', 743, NULL),
(231, 193, '16D2021-05', 932, NULL),
(232, 194, '16E2021-05', 932, NULL),
(233, 195, '16F2021-05', 743, NULL),
(234, 196, '17F2021-05', 743, NULL),
(235, 197, '18G2021-05', 743, NULL),
(236, 198, '19G2021-05', 743, NULL),
(237, 199, '20A2021-05', 932, NULL),
(238, 200, '21B2021-05', 743, NULL),
(239, 201, '21H2021-05', 932, NULL),
(240, 202, '22C2021-05', 743, NULL),
(241, 203, '22G2021-05', 743, NULL),
(242, 204, '23E2021-05', 932, NULL),
(243, 205, '24D2021-05', 932, NULL),
(244, 206, '24E2021-05', 932, NULL),
(245, 207, '24H2021-05', 932, NULL),
(246, 208, '25A2021-05', 932, NULL),
(247, 209, '25D2021-05', 932, NULL),
(248, 210, '25F2021-05', 743, NULL),
(249, 211, '10F2021-06', 743, NULL),
(251, 213, '12B2021-06', 743, NULL),
(252, 214, '08D2021-05', 932, NULL),
(253, 215, '12D2021-05', 932, NULL),
(254, 216, '02G2021-06', 743, NULL),
(255, 217, 'SHOP022021-05', 711, NULL),
(256, 218, 'SHOP082021-04', 443, NULL),
(257, 218, 'SHOP082021-05', 443, NULL),
(258, 219, 'SHOP092021-04', 505, NULL),
(259, 219, 'SHOP092021-05', 505, NULL),
(260, 220, '02C2021-06', 743, NULL),
(261, 221, '14H2021-05', 932, NULL),
(262, 222, '08F2021-04', 743, NULL),
(263, 222, '08F2021-05', 743, NULL),
(264, 223, '24F2021-04', 743, NULL),
(265, 223, '24F2021-05', 743, NULL),
(266, 224, '24G2021-06', 743, NULL),
(267, 225, '06C2021-06', 743, NULL),
(268, 226, '02D2021-06', 932, NULL),
(269, 227, '21A2021-06', 932, NULL),
(270, 228, '11A2021-06', 932, NULL),
(271, 229, '11C2021-06', 743, NULL),
(272, 230, '10B2021-06', 743, NULL),
(273, 231, '04E2021-06', 932, NULL),
(274, 232, '06F2021-06', 743, NULL),
(275, 233, '22D2021-06', 932, NULL),
(276, 234, 'SHOP052021-06', 774, NULL),
(277, 235, '10D2021-06', 932, NULL),
(278, 236, '09G2021-06', 743, NULL),
(279, 237, '16G2021-06', 743, NULL),
(280, 238, '04B2021-06', 743, NULL),
(281, 239, '08E2021-06', 932, NULL),
(282, 240, '09C2021-06', 743, NULL),
(283, 241, '25H2021-06', 932, NULL),
(284, 242, '05C2021-06', 743, NULL),
(285, 243, '19B2021-06', 743, NULL),
(286, 244, '07C2021-06', 743, NULL),
(287, 245, '19C2021-06', 743, NULL),
(288, 246, '15D2021-06', 932, NULL),
(289, 247, '20D2021-06', 932, NULL),
(290, 248, '02F2021-06', 743, NULL),
(291, 249, '04D2021-06', 932, NULL),
(292, 250, '19D2021-06', 932, NULL),
(293, 251, '20B2021-06', 743, NULL),
(294, 252, '06H2021-06', 932, NULL),
(295, 253, 'SHOP042021-04', 679, NULL),
(296, 253, 'SHOP042021-05', 679, NULL),
(297, 253, 'SHOP042021-06', 679, NULL),
(298, 254, 'SHOP012021-05', 774, NULL),
(299, 255, '25E2021-06', 932, NULL),
(300, 256, '06A2021-06', 932, NULL),
(301, 257, '01D2021-06', 932, NULL),
(302, 258, 'SHOP062021-06', 443, NULL),
(303, 259, '02A2021-06', 932, NULL),
(304, 260, 'SHOP102021-05', 853, NULL),
(305, 260, 'SHOP102021-06', 853, NULL),
(306, 261, '06D2021-06', 932, NULL),
(307, 262, '04F2021-06', 743, NULL),
(308, 263, '17E2021-06', 932, NULL),
(309, 264, '01B2021-06', 743, NULL),
(310, 265, '11D2021-06', 932, NULL),
(311, 266, '19F2021-06', 743, NULL),
(312, 267, '21C2021-06', 743, NULL),
(313, 268, '15B2021-06', 743, NULL),
(314, 269, '21E2021-06', 932, NULL),
(315, 270, '22B2021-06', 743, NULL),
(316, 271, '07E2021-06', 932, NULL),
(317, 272, '14A2021-06', 932, NULL),
(318, 273, '19A2021-06', 932, NULL),
(319, 274, '17D2021-06', 932, NULL),
(320, 275, '19E2021-06', 932, NULL),
(321, 276, '03C2021-06', 743, NULL),
(322, 277, '12A2021-06', 932, NULL),
(323, 278, '13F2021-05', 743, NULL),
(324, 278, '13F2021-06', 743, NULL),
(325, 279, '10E2021-06', 932, NULL),
(326, 280, '20E2021-06', 932, NULL),
(327, 281, 'SHOP112021-06', 1010, NULL),
(328, 282, '10A2021-06', 932, NULL),
(329, 283, '20H2021-06', 932, NULL),
(330, 284, '15A2021-06', 932, NULL),
(331, 285, '15E2021-06', 932, NULL),
(332, 286, '04C2021-06', 743, NULL),
(333, 287, '25G2021-06', 743, NULL),
(334, 288, '01C2021-06', 743, NULL),
(335, 289, '01E2021-06', 932, NULL),
(336, 290, '03B2021-05', 743, NULL),
(337, 290, '03B2021-06', 743, NULL),
(338, 291, '17A2021-06', 932, NULL),
(339, 292, '17H2021-06', 932, NULL),
(340, 293, '22H2021-06', 932, NULL),
(341, 294, '23B2021-06', 743, NULL),
(342, 295, '23C2021-06', 743, NULL),
(343, 296, '02E2021-06', 932, NULL),
(344, 297, '12G2021-06', 743, NULL),
(345, 298, '13H2021-05', 932, NULL),
(346, 298, '13H2021-06', 932, NULL),
(347, 299, '05H2021-06', 932, NULL),
(348, 300, '21G2021-06', 743, NULL),
(349, 301, '18C2021-06', 743, NULL),
(350, 302, '18B2021-06', 743, NULL),
(351, 303, '06G2021-06', 743, NULL),
(352, 304, '13D2021-06', 932, NULL),
(353, 305, '15C2021-06', 743, NULL),
(354, 306, '17G2021-06', 743, NULL),
(355, 307, 'SHOP122021-05', 836, NULL),
(356, 307, 'SHOP122021-06', 836, NULL),
(357, 308, '05E2021-06', 932, NULL),
(358, 309, '17C2021-06', 743, NULL),
(359, 310, '22A2021-06', 932, NULL),
(360, 311, '08C2021-06', 743, NULL),
(361, 312, '14D2021-06', 932, NULL),
(362, 313, '20C2021-06', 743, NULL),
(363, 314, '24B2021-06', 743, NULL),
(364, 315, 'SHOP072021-06', 379, NULL),
(365, 316, '04A2021-06', 932, NULL),
(366, 317, '17B2021-05', 743, NULL),
(367, 317, '17B2021-06', 743, NULL),
(368, 318, '06B2021-06', 743, NULL),
(369, 319, '07G2021-06', 743, NULL),
(370, 320, '09H2021-06', 932, NULL),
(371, 321, '14B2021-06', 743, NULL),
(372, 322, '14E2021-06', 932, NULL),
(373, 323, '07A2021-06', 932, NULL),
(374, 324, '09E2021-06', 932, NULL),
(375, 325, '23F2021-06', 743, NULL),
(376, 326, '25C2021-06', 743, NULL),
(377, 327, '05B2021-06', 743, NULL),
(378, 328, '22E2021-06', 932, NULL),
(379, 329, '23D2021-06', 932, NULL),
(380, 330, '20G2021-06', 743, NULL),
(381, 331, '13C2021-06', 743, NULL),
(382, 332, '18D2021-06', 932, NULL),
(383, 333, '08G2021-06', 743, NULL),
(384, 334, '19H2021-06', 932, NULL),
(385, 335, '21F2021-06', 743, NULL),
(386, 336, '05A2021-06', 932, NULL),
(387, 337, '14C2021-06', 743, NULL),
(388, 338, '03G2021-05', 743, NULL),
(389, 338, '03G2021-06', 743, NULL),
(390, 339, '08H2021-06', 932, NULL),
(391, 340, '08F2021-06', 743, NULL),
(392, 341, '24F2021-06', 743, NULL),
(393, 342, '16H2021-05', 932, NULL),
(394, 342, '16H2021-06', 932, NULL),
(395, 342, '16H2021-07', 932, NULL),
(396, 343, '03F2021-06', 743, NULL),
(397, 344, '23A2021-06', 932, NULL),
(398, 345, '15F2021-06', 743, NULL),
(399, 346, '12C2021-03', 743, NULL),
(400, 347, '12C2021-04', 743, NULL),
(401, 348, '12C2021-05', 743, NULL),
(402, 349, '09D2021-06', 932, NULL),
(403, 350, '12E2021-06', 932, NULL),
(404, 351, '24A2021-06', 932, NULL),
(405, 352, '14H2021-06', 932, NULL),
(406, 353, '01A2021-06', 932, NULL),
(407, 354, '01F2021-06', 743, NULL),
(408, 355, '01G2021-06', 743, NULL),
(409, 356, '01H2021-06', 932, NULL),
(410, 357, '03A2021-06', 932, NULL),
(411, 358, '03D2021-06', 932, NULL),
(412, 359, '03E2021-06', 932, NULL),
(413, 360, '03H2021-06', 932, NULL),
(414, 361, '05F2021-06', 743, NULL),
(415, 362, '05G2021-06', 743, NULL),
(416, 363, '06E2021-06', 932, NULL),
(417, 364, '07D2021-06', 932, NULL),
(418, 365, '07F2021-06', 743, NULL),
(419, 366, '08B2021-06', 743, NULL),
(420, 367, '08D2021-06', 932, NULL),
(421, 368, '09B2021-06', 743, NULL),
(422, 369, '09F2021-06', 743, NULL),
(423, 370, '10C2021-06', 743, NULL),
(424, 371, '11E2021-06', 932, NULL),
(425, 372, '11H2021-06', 932, NULL),
(426, 373, '12D2021-06', 932, NULL),
(427, 374, '12F2021-06', 743, NULL),
(428, 375, '12H2021-06', 932, NULL),
(429, 376, '13B2021-06', 743, NULL),
(430, 377, '14F2021-06', 743, NULL),
(431, 378, '14G2021-06', 743, NULL),
(432, 379, '15G2021-06', 743, NULL),
(433, 380, '15H2021-06', 932, NULL),
(434, 381, '16C2021-06', 743, NULL),
(435, 382, '16D2021-06', 932, NULL),
(436, 383, '16E2021-06', 932, NULL),
(437, 384, '16F2021-06', 743, NULL),
(438, 385, '17F2021-06', 743, NULL),
(439, 386, '18G2021-06', 743, NULL),
(440, 387, '19G2021-06', 743, NULL),
(441, 388, '20A2021-06', 932, NULL),
(442, 389, '21B2021-06', 743, NULL),
(443, 390, '21H2021-06', 932, NULL),
(444, 391, '22C2021-06', 743, NULL),
(445, 392, '22G2021-06', 743, NULL),
(446, 393, '23E2021-06', 932, NULL),
(447, 394, '24D2021-06', 932, NULL),
(448, 395, '24E2021-06', 932, NULL),
(449, 396, '24H2021-06', 932, NULL),
(450, 397, '25A2021-06', 932, NULL),
(451, 398, '25D2021-06', 932, NULL),
(452, 399, '25F2021-06', 743, NULL),
(453, 400, '02G2021-07', 743, NULL),
(454, 401, 'SHOP022021-06', 711, NULL),
(455, 402, '21D2021-06', 932, '2021-07-06'),
(456, 403, '21D2021-06', 932, '2021-07-06'),
(457, 404, '05D2021-06', 932, '2021-07-06'),
(458, 405, '10A2021-07', 932, '2021-07-06'),
(459, 406, 'SHOP012021-06', 774, '2021-07-06'),
(460, 407, '20F2021-06', 743, '2021-07-06'),
(461, 408, '13E2021-05', 932, '2021-07-06'),
(462, 408, '13E2021-06', 932, '2021-07-06'),
(463, 409, '04F2021-07', 743, '2021-07-06'),
(464, 410, '10B2021-07', 743, '2021-07-06'),
(465, 411, '01D2021-07', 932, '2021-07-06'),
(466, 412, '19C2021-07', 743, '2021-07-06'),
(467, 413, '21A2021-07', 932, '2021-07-06'),
(468, 414, 'SHOP042021-07', 679, '2021-07-06'),
(469, 414, 'SHOP042021-08', 679, '2021-07-06'),
(470, 415, '02C2021-07', 743, '2021-07-06'),
(471, 416, '02D2021-07', 932, '2021-07-06'),
(472, 417, '02H2021-07', 932, '2021-07-06'),
(473, 417, '02H2021-08', 932, '2021-07-06'),
(474, 417, '02H2021-09', 932, '2021-07-06'),
(475, 417, '02H2021-10', 932, '2021-07-06'),
(476, 417, '02H2021-11', 932, '2021-07-06'),
(477, 417, '02H2021-12', 932, '2021-07-06'),
(478, 418, '23C2021-07', 743, '2021-07-06'),
(479, 419, 'SHOP052021-07', 774, '2021-07-06'),
(480, 420, '19D2021-07', 932, '2021-07-06'),
(481, 421, '20B2021-07', 743, '2021-07-06'),
(482, 422, '15D2021-07', 932, '2021-07-06'),
(483, 423, '07C2021-07', 743, '2021-07-06'),
(484, 424, '11A2021-07', 932, '2021-07-06'),
(485, 425, 'SHOP062021-07', 443, '2021-07-06'),
(486, 426, '06C2021-07', 743, '2021-07-06'),
(487, 427, '09C2021-07', 743, '2021-07-06'),
(488, 428, '13H2021-07', 932, '2021-07-06'),
(489, 429, '06D2021-07', 932, '2021-07-06'),
(490, 430, '10D2021-07', 932, '2021-07-06'),
(491, 431, '06H2021-07', 932, '2021-07-06'),
(492, 432, '15B2021-07', 743, '2021-07-06'),
(493, 433, '02F2021-07', 743, '2021-07-06'),
(494, 434, '06F2021-07', 743, '2021-07-06'),
(495, 435, '21E2021-07', 932, '2021-07-06'),
(496, 436, '09G2021-07', 743, '2021-07-06'),
(497, 437, '11C2021-07', 743, '2021-07-06'),
(498, 438, '04D2021-07', 932, '2021-07-06'),
(499, 439, '05C2021-07', 743, '2021-07-06'),
(500, 440, '04C2021-07', 743, '2021-07-06'),
(501, 441, '08E2021-07', 932, '2021-07-06'),
(502, 442, '22D2021-07', 932, '2021-07-06'),
(503, 443, '25H2021-07', 932, '2021-07-06'),
(504, 444, '04E2021-07', 932, '2021-07-06'),
(505, 445, '13A2021-07', 932, '2021-07-06'),
(506, 445, '13A2021-08', 932, '2021-07-06'),
(507, 445, '13A2021-09', 932, '2021-07-06'),
(508, 446, '12A2021-07', 932, '2021-07-06'),
(509, 447, '10E2021-07', 932, '2021-07-06'),
(510, 448, '06A2021-07', 932, '2021-07-06'),
(511, 449, '11D2021-07', 932, '2021-07-06'),
(512, 450, '14A2021-07', 932, '2021-07-06'),
(513, 451, '20H2021-07', 932, '2021-07-06'),
(514, 452, '07G2021-07', 743, '2021-07-06'),
(515, 453, '09A2021-05', 932, '2021-07-06'),
(516, 453, '09A2021-06', 932, '2021-07-06'),
(517, 453, '09A2021-07', 932, '2021-07-06'),
(518, 454, '24G2021-07', 743, '2021-07-06'),
(519, 455, '03C2021-07', 743, '2021-07-06'),
(520, 456, '07E2021-07', 932, '2021-07-06'),
(521, 457, '25E2021-07', 932, '2021-07-06'),
(522, 458, '16G2021-07', 743, '2021-07-06'),
(523, 459, '01B2021-07', 743, '2021-07-06'),
(524, 460, '01E2021-07', 932, '2021-07-06'),
(525, 461, '20D2021-07', 932, '2021-07-06'),
(526, 462, '04B2021-07', 743, '2021-07-06'),
(527, 463, '14B2021-07', 743, '2021-07-06'),
(528, 464, '17A2021-07', 932, '2021-07-06'),
(529, 465, '21G2021-07', 743, '2021-07-06'),
(530, 466, '19F2021-07', 743, '2021-07-06'),
(531, 467, '11F2021-06', 743, '2021-07-06'),
(532, 467, '11F2021-07', 743, '2021-07-06'),
(533, 468, '15E2021-07', 932, '2021-07-06'),
(534, 469, '06G2021-07', 743, '2021-07-06'),
(535, 470, '11G2021-05', 743, '2021-07-06'),
(536, 470, '11G2021-06', 743, '2021-07-06'),
(537, 470, '11G2021-07', 743, '2021-07-06'),
(538, 471, '22B2021-07', 743, '2021-07-06'),
(539, 472, 'SHOP112021-07', 1010, '2021-07-06'),
(540, 473, '01C2021-07', 743, '2021-07-06'),
(541, 474, '09E2021-07', 932, '2021-07-06'),
(542, 475, '11B2021-07', 743, '2021-07-06'),
(543, 476, '11B2021-07', 743, '2021-07-06'),
(544, 476, '11B2021-08', 743, '2021-07-06'),
(545, 476, '11B2021-09', 743, '2021-07-06'),
(546, 477, '20E2021-07', 932, '2021-07-06'),
(547, 478, 'SHOP132021-06', 695, '2021-07-06'),
(548, 478, 'SHOP132021-07', 695, '2021-07-06'),
(549, 479, '02E2021-07', 932, '2021-07-06'),
(550, 480, '07H2021-05', 932, '2021-07-06'),
(551, 480, '07H2021-06', 932, '2021-07-06'),
(552, 480, '07H2021-07', 932, '2021-07-06'),
(553, 481, '17H2021-07', 932, '2021-07-06'),
(554, 482, '18B2021-07', 743, '2021-07-06'),
(555, 483, '18E2021-06', 932, '2021-07-06'),
(556, 483, '18E2021-07', 932, '2021-07-06'),
(557, 484, '19A2021-07', 932, '2021-07-06'),
(558, 485, '19E2021-07', 932, '2021-07-06'),
(559, 486, '20C2021-07', 743, '2021-07-06'),
(560, 487, '21C2021-07', 743, '2021-07-06'),
(561, 488, '22H2021-07', 932, '2021-07-06'),
(562, 489, '23B2021-07', 743, '2021-07-06'),
(563, 490, '23H2021-07', 932, '2021-07-06'),
(564, 490, '23H2021-08', 932, '2021-07-06'),
(565, 490, '23H2021-09', 932, '2021-07-06'),
(566, 491, '25C2021-07', 743, '2021-07-06'),
(567, 492, '25G2021-07', 743, '2021-07-06'),
(568, 493, '02A2021-07', 932, '2021-07-06'),
(569, 494, '23F2021-07', 743, '2021-07-06'),
(570, 495, '22F2021-06', 743, '2021-07-06'),
(571, 495, '22F2021-07', 743, '2021-07-06'),
(572, 496, '05H2021-07', 932, '2021-07-06'),
(573, 497, '08C2021-07', 743, '2021-07-06'),
(574, 498, '17C2021-07', 743, '2021-07-06'),
(575, 499, '15A2021-07', 932, '2021-07-06'),
(576, 500, '13C2021-07', 743, '2021-07-06'),
(577, 501, '17E2021-07', 932, '2021-07-06'),
(578, 502, '12G2021-07', 743, '2021-07-06'),
(579, 503, '19B2021-07', 743, '2021-07-06'),
(580, 504, '06B2021-07', 743, '2021-07-06'),
(581, 505, '05E2021-07', 932, '2021-07-06'),
(582, 506, '14E2021-07', 932, '2021-07-06'),
(583, 507, '18H2021-05', 932, '2021-07-06'),
(584, 507, '18H2021-06', 932, '2021-07-06'),
(585, 508, '14D2021-07', 932, '2021-07-06'),
(586, 509, '10G2021-05', 743, '2021-07-19'),
(587, 509, '10G2021-06', 743, '2021-07-19'),
(588, 510, '22A2021-07', 932, '2021-07-19'),
(589, 511, '21D2021-07', 932, '2021-07-19'),
(590, 512, '04G2021-07', 743, '2021-07-19'),
(591, 513, 'SHOP072021-07', 379, '2021-07-19'),
(592, 514, '21F2021-07', 743, '2021-07-19'),
(593, 515, '13F2021-07', 743, '2021-07-19'),
(594, 516, '13G2021-04', 743, '2021-07-19'),
(595, 516, '13G2021-05', 743, '2021-07-19'),
(596, 516, '13G2021-06', 743, '2021-07-19'),
(597, 517, '16A2021-04', 932, '2021-07-19'),
(598, 517, '16A2021-05', 932, '2021-07-19'),
(599, 517, '16A2021-06', 932, '2021-07-19'),
(600, 518, '13G2021-07', 743, '2021-07-19'),
(601, 518, '13G2021-08', 743, '2021-07-19'),
(602, 518, '13G2021-09', 743, '2021-07-19'),
(603, 519, '16A2021-07', 932, '2021-07-19'),
(604, 519, '16A2021-08', 932, '2021-07-19'),
(605, 519, '16A2021-09', 932, '2021-07-19'),
(606, 520, '18A2021-07', 932, '2021-07-19'),
(607, 520, '18A2021-08', 932, '2021-07-19'),
(608, 520, '18A2021-09', 932, '2021-07-19'),
(609, 520, '18A2021-10', 932, '2021-07-19'),
(610, 520, '18A2021-11', 932, '2021-07-19'),
(611, 520, '18A2021-12', 932, '2021-07-19'),
(612, 521, '19H2021-07', 932, '2021-07-19'),
(613, 522, '05B2021-07', 743, '2021-07-19'),
(614, 523, '04A2021-07', 932, '2021-07-19'),
(615, 524, '14C2021-07', 743, '2021-07-21'),
(616, 525, '18D2021-07', 932, '2021-07-21'),
(617, 526, '10H2021-06', 932, '2021-07-21'),
(618, 526, '10H2021-07', 932, '2021-07-21'),
(619, 526, '10H2021-08', 932, '2021-07-21'),
(620, 527, '20G2021-07', 743, '2021-07-21'),
(621, 528, '24C2021-05', 743, '2021-07-21'),
(622, 528, '24C2021-06', 743, '2021-07-21'),
(623, 528, '24C2021-07', 743, '2021-07-21'),
(624, 529, '07A2021-07', 932, '2021-07-21'),
(625, 530, '17D2021-07', 932, '2021-07-21'),
(626, 531, '09H2021-07', 932, '2021-07-21'),
(627, 532, '17G2021-07', 743, '2021-07-21'),
(628, 533, '15C2021-07', 743, '2021-07-21'),
(629, 534, '03F2021-07', 743, '2021-07-21'),
(630, 535, '22E2021-07', 932, '2021-07-21'),
(631, 536, '23D2021-07', 932, '2021-07-21'),
(632, 537, '08H2021-07', 932, '2021-07-21'),
(633, 538, '13D2021-07', 932, '2021-07-21'),
(634, 539, 'SHOP032021-07', 632, '2021-07-21'),
(635, 540, '05A2021-07', 932, '2021-07-21'),
(636, 541, '15F2021-07', 743, '2021-07-21'),
(637, 542, '08G2021-07', 743, '2021-07-26'),
(638, 543, '09D2021-07', 932, '2021-07-27'),
(639, 544, '12E2021-07', 932, '2021-07-27'),
(640, 545, '20F2021-07', 743, '2021-07-27'),
(641, 546, '25B2021-07', 743, '2021-07-27'),
(642, 546, '25B2021-08', 743, '2021-07-27'),
(643, 547, '14H2021-07', 932, '2021-07-27'),
(644, 548, '23A2021-07', 932, '2021-07-27'),
(645, 549, '24A2021-07', 932, '2021-07-27'),
(646, 550, '01A2021-07', 932, '2021-07-16'),
(647, 551, '01F2021-07', 743, '2021-07-16'),
(648, 552, '01G2021-07', 743, '2021-07-16'),
(649, 553, '01H2021-07', 932, '2021-07-16'),
(650, 554, '03A2021-07', 932, '2021-07-16'),
(651, 555, '03D2021-07', 932, '2021-07-16'),
(652, 556, '03E2021-07', 932, '2021-07-16'),
(653, 557, '03H2021-07', 932, '2021-07-16'),
(654, 558, '05F2021-07', 743, '2021-07-16'),
(655, 559, '05G2021-07', 743, '2021-07-16'),
(656, 560, '06E2021-07', 932, '2021-07-16'),
(657, 561, '07D2021-07', 932, '2021-07-16'),
(658, 562, '07F2021-07', 743, '2021-07-16'),
(659, 563, '08B2021-07', 743, '2021-07-16'),
(660, 564, '08D2021-07', 932, '2021-07-16'),
(661, 565, '09B2021-07', 743, '2021-07-16'),
(662, 566, '09F2021-07', 743, '2021-07-16'),
(663, 567, '10C2021-07', 743, '2021-07-16'),
(664, 568, '10F2021-07', 743, '2021-07-16'),
(665, 569, '11E2021-07', 932, '2021-07-16'),
(666, 570, '11H2021-07', 932, '2021-07-16'),
(667, 571, '12B2021-07', 743, '2021-07-16'),
(668, 572, '12D2021-07', 932, '2021-07-16'),
(669, 573, '12F2021-07', 743, '2021-07-16'),
(670, 574, '12H2021-07', 932, '2021-07-16'),
(671, 575, '13B2021-07', 743, '2021-07-16'),
(672, 576, '14F2021-07', 743, '2021-07-16'),
(673, 577, '14G2021-07', 743, '2021-07-16'),
(674, 578, '15G2021-07', 743, '2021-07-16'),
(675, 579, '15H2021-07', 932, '2021-07-16'),
(676, 580, '16C2021-07', 743, '2021-07-16'),
(677, 581, '16D2021-07', 932, '2021-07-16'),
(678, 582, '16E2021-07', 932, '2021-07-16'),
(679, 583, '16F2021-07', 743, '2021-07-16'),
(680, 584, '17F2021-07', 743, '2021-07-16'),
(681, 585, '18G2021-07', 743, '2021-07-16'),
(682, 586, '19G2021-07', 743, '2021-07-16'),
(683, 587, '20A2021-07', 932, '2021-07-16'),
(684, 588, '21B2021-07', 743, '2021-07-16'),
(685, 589, '21H2021-07', 932, '2021-07-16'),
(686, 590, '22C2021-07', 743, '2021-07-16'),
(687, 591, '22G2021-07', 743, '2021-07-16'),
(688, 592, '23E2021-07', 932, '2021-07-16'),
(689, 593, '24D2021-07', 932, '2021-07-16'),
(690, 594, '24E2021-07', 932, '2021-07-16'),
(691, 595, '24H2021-07', 932, '2021-07-16'),
(692, 596, '25A2021-07', 932, '2021-07-16'),
(693, 597, '25D2021-07', 932, '2021-07-16'),
(694, 598, '25F2021-07', 743, '2021-07-16'),
(695, 599, '24A2021-08', 932, '2021-07-27'),
(696, 600, 'SHOP082021-06', 443, '2021-06-01'),
(697, 601, 'SHOP092021-06', 505, '2021-06-01'),
(698, 602, 'SHOP082021-07', 443, '2021-07-19'),
(699, 603, 'SHOP092021-07', 505, '2021-07-19'),
(700, 604, '06C2021-08', 780, '2021-08-02'),
(701, 605, '21A2021-08', 979, '2021-08-02'),
(702, 606, '11A2021-08', 979, '2021-08-02'),
(703, 607, '17B2021-07', 743, '2021-08-02'),
(704, 607, '17B2021-08', 780, '2021-08-02'),
(705, 608, '06F2021-08', 780, '2021-08-02'),
(706, 609, '14B2021-08', 780, '2021-08-02'),
(707, 610, '10B2021-08', 743, '2021-08-02'),
(708, 611, '10b2021-08-apart', 37, '2021-08-02'),
(709, 612, '02E2021-08', 979, '2021-08-02'),
(710, 613, '07C2021-08', 780, '2021-08-02'),
(711, 614, '05C2021-08', 780, '2021-08-02'),
(712, 615, '08E2021-08', 979, '2021-08-02'),
(713, 616, '16G2021-08', 780, '2021-08-02'),
(714, 617, 'SHOP112021-08', 1061, '2021-08-02'),
(715, 618, '04E2021-08', 979, '2021-08-02'),
(716, 619, '06A2021-08', 979, '2021-08-02'),
(717, 620, '10A2021-08', 979, '2021-08-02'),
(718, 621, '18C2021-07', 743, '2021-08-02'),
(719, 621, '18C2021-08', 780, '2021-08-02'),
(720, 622, '10D2021-08', 979, '2021-08-02'),
(721, 623, '18B2021-08', 780, '2021-08-02'),
(722, 624, '15B2021-08', 780, '2021-08-02'),
(723, 625, '13G2021-08-adv', 37, '2021-08-02'),
(724, 625, '13G2021-09-adv', 37, '2021-08-02'),
(725, 626, '06H2021-08', 979, '2021-08-02'),
(726, 627, '04C2021-08', 780, '2021-08-02'),
(727, 628, '22D2021-08', 979, '2021-08-02'),
(728, 629, 'SHOP062021-08', 465, '2021-08-02'),
(729, 630, 'SHOP052021-08-apart', 774, '2021-08-02'),
(730, 631, '19A2021-08', 979, '2021-08-02'),
(731, 632, '02A2021-08', 979, '2021-08-02'),
(732, 633, '19C2021-08', 780, '2021-08-02'),
(733, 634, '17E2021-08', 979, '2021-08-02'),
(734, 635, '19D2021-08', 979, '2021-08-02'),
(735, 636, '20B2021-08', 780, '2021-08-02'),
(736, 637, '02C2021-08', 780, '2021-08-02'),
(737, 638, '02D2021-08', 979, '2021-08-02'),
(738, 639, '04D2021-08', 979, '2021-08-02'),
(739, 640, '09E2021-08', 979, '2021-08-02'),
(740, 641, '16A2021-08-adv', 47, '2021-08-02'),
(741, 641, '16A2021-09-adv', 47, '2021-08-02'),
(742, 642, '06D2021-08', 979, '2021-08-02'),
(743, 643, '11C2021-08', 780, '2021-08-02'),
(744, 644, '25H2021-08', 979, '2021-08-02'),
(745, 645, '25E2021-08', 979, '2021-08-02'),
(746, 646, '03C2021-08', 780, '2021-08-03'),
(747, 647, '07H2021-08', 979, '2021-08-03'),
(748, 648, '09C2021-08', 780, '2021-08-03'),
(749, 649, '19F2021-08', 780, '2021-08-03'),
(750, 650, '13H2021-08', 979, '2021-08-03'),
(751, 651, '01B2021-08', 780, '2021-08-03'),
(752, 652, '10E2021-08', 979, '2021-08-03'),
(753, 653, '11D2021-08', 979, '2021-08-03'),
(754, 654, '15D2021-08', 979, '2021-08-03'),
(755, 655, '15E2021-08', 979, '2021-08-03'),
(756, 656, '25G2021-08', 780, '2021-08-03'),
(757, 657, '02F2021-08', 780, '2021-08-03'),
(758, 658, '09G2021-08', 780, '2021-08-03'),
(759, 659, '20H2021-08', 979, '2021-08-03'),
(760, 660, 'SHOP102021-07', 853, '2021-08-03'),
(761, 660, 'SHOP102021-08', 896, '2021-08-03'),
(762, 661, '04F2021-08', 780, '2021-08-03'),
(763, 662, '12A2021-08', 979, '2021-08-03'),
(764, 663, '01D2021-08', 979, '2021-08-03'),
(765, 664, '21C2021-08', 780, '2021-08-06'),
(766, 665, '01E2021-08', 979, '2021-08-06'),
(767, 666, '24G2021-08', 780, '2021-08-06'),
(768, 667, '01C2021-08', 780, '2021-08-06'),
(769, 668, '19B2021-08', 780, '2021-08-06'),
(770, 669, '07E2021-08', 979, '2021-08-06'),
(771, 670, '22B2021-08', 780, '2021-08-06'),
(772, 671, '14A2021-08', 979, '2021-08-06'),
(773, 672, '13F2021-08', 780, '2021-08-06'),
(774, 673, '17D2021-08', 979, '2021-08-06'),
(775, 674, '17H2021-08', 979, '2021-08-06'),
(776, 675, '19E2021-08', 979, '2021-08-06'),
(777, 676, '20C2021-08', 780, '2021-08-06'),
(778, 677, '20D2021-08', 979, '2021-08-06'),
(779, 678, '21E2021-08', 979, '2021-08-06'),
(780, 679, '08G2021-08', 780, '2021-08-06'),
(781, 680, '23C2021-08', 780, '2021-08-06'),
(782, 681, 'SHOP072021-08-apart', 379, '2021-08-06'),
(783, 682, '12G2021-08', 780, '2021-08-06'),
(784, 683, '03G2021-07', 743, '2021-08-06'),
(785, 683, '03G2021-08', 780, '2021-08-06'),
(786, 684, '07G2021-08', 780, '2021-08-06'),
(787, 685, '09H2021-08', 979, '2021-08-09'),
(788, 686, '17A2021-08', 979, '2021-08-09'),
(789, 687, '23F2021-08', 780, '2021-08-09'),
(790, 688, '04A2021-08', 979, '2021-08-09'),
(791, 689, '14E2021-08', 979, '2021-08-09'),
(792, 690, '23A2021-08', 979, '2021-08-09'),
(793, 691, 'SHOP032021-08', 664, '2021-08-09'),
(794, 692, 'SHOP012021-07', 774, '2021-08-09'),
(795, 693, '05H2021-08', 979, '2021-08-09'),
(796, 694, '16B2021-07', 743, '2021-08-10'),
(797, 694, '16B2021-08', 780, '2021-08-10'),
(798, 694, '16B2021-09', 780, '2021-08-10'),
(799, 694, '16B2021-10', 780, '2021-08-10'),
(800, 694, '16B2021-11', 780, '2021-08-10'),
(801, 694, '16B2021-12', 780, '2021-08-10'),
(802, 695, '04B2021-08', 780, '2021-08-10'),
(803, 696, '06G2021-08', 780, '2021-08-10'),
(804, 697, '06B2021-08', 780, '2021-08-10'),
(805, 698, '15A2021-08', 979, '2021-08-10'),
(806, 699, '20E2021-08', 979, '2021-08-10'),
(807, 700, 'SHOP122021-07', 836, '2021-08-10'),
(808, 700, 'SHOP122021-08', 878, '2021-08-10'),
(809, 701, '05E2021-08', 979, '2021-08-13'),
(810, 702, '03B2021-07', 743, '2021-08-13'),
(811, 703, '03B2021-08', 780, '2021-08-13'),
(812, 704, '24F2021-07', 743, '2021-08-13'),
(813, 704, '24F2021-08', 780, '2021-08-13'),
(814, 705, '08F2021-07', 743, '2021-08-13'),
(815, 705, '08F2021-08', 780, '2021-08-13'),
(816, 706, '18G2021-08', 780, '2021-08-13'),
(817, 707, '25C2021-08', 780, '2021-08-13'),
(818, 708, '14C2021-08', 780, '2021-08-13'),
(819, 709, '07A2021-08', 979, '2021-08-13'),
(820, 710, '17C2021-08', 780, '2021-08-13'),
(821, 711, '21G2021-08', 780, '2021-08-16'),
(822, 712, '05D2021-07', 932, '2021-08-16'),
(823, 712, '05D2021-08', 979, '2021-08-16'),
(824, 713, '15C2021-08', 780, '2021-08-16'),
(825, 714, '17G2021-08', 780, '2021-08-16'),
(826, 715, '14D2021-08', 979, '2021-08-16'),
(827, 716, '20G2021-08', 780, '2021-08-16'),
(828, 717, '24B2021-08', 780, '2021-08-16'),
(829, 718, '11F2021-08', 780, '2021-08-16'),
(830, 719, '05B2021-08', 780, '2021-08-16'),
(831, 720, '23D2021-08', 979, '2021-08-16'),
(832, 721, '08H2021-08', 979, '2021-08-16'),
(833, 722, '19H2021-08', 979, '2021-08-16'),
(834, 723, '18D2021-08', 979, '2021-08-16'),
(835, 724, '24B2021-07', 743, '2021-08-16'),
(836, 725, '08C2021-08', 780, '2021-08-16'),
(837, 726, '22E2021-08', 979, '2021-08-16'),
(838, 727, '03F2021-08', 780, '2021-08-20'),
(839, 728, '05A2021-08', 979, '2021-08-20'),
(840, 729, '13C2021-08', 780, '2021-08-20'),
(841, 730, '22H2021-08', 979, '2021-08-20'),
(842, 731, '15F2021-08', 780, '2021-08-20'),
(843, 732, '09A2021-08', 979, '2021-08-20'),
(844, 733, '18H2021-07', 932, '2021-08-20'),
(845, 733, '18H2021-08', 979, '2021-08-20'),
(846, 734, '21F2021-08', 780, '2021-08-24'),
(847, 735, '24C2021-08', 780, '2021-08-24'),
(848, 736, '22F2021-08', 780, '2021-08-24'),
(849, 737, '12E2021-08', 979, '2021-08-24'),
(850, 738, '04G2021-08', 780, '2021-08-24'),
(851, 739, '21D2021-08', 979, '2021-08-24'),
(852, 740, '05G2021-08', 780, '2021-08-13'),
(853, 741, '02G2021-08', 780, '2021-08-13'),
(854, 742, '11H2021-08', 979, '2021-08-13'),
(855, 743, '12B2021-08', 780, '2021-08-13'),
(856, 744, '12D2021-08', 979, '2021-08-13'),
(857, 745, '12F2021-08', 780, '2021-08-13'),
(858, 746, '12H2021-08', 979, '2021-08-13'),
(859, 747, '13B2021-08', 780, '2021-08-13'),
(860, 748, '14G2021-08', 780, '2021-08-13'),
(861, 749, '15G2021-08', 780, '2021-08-13'),
(862, 750, '10F2021-08', 780, '2021-08-13'),
(863, 751, '15H2021-08', 979, '2021-08-13'),
(864, 752, '16C2021-08', 780, '2021-08-13'),
(865, 753, '16D2021-08', 979, '2021-08-13'),
(866, 754, '16F2021-08', 780, '2021-08-13'),
(867, 755, '25F2021-08', 780, '2021-08-13'),
(868, 756, '17F2021-08', 780, '2021-08-13'),
(869, 757, '19G2021-08', 780, '2021-08-13'),
(870, 758, '01F2021-08', 780, '2021-08-13'),
(871, 759, '20A2021-08', 979, '2021-08-13'),
(872, 760, '21B2021-08', 780, '2021-08-13'),
(873, 761, '21H2021-08', 979, '2021-08-13'),
(874, 762, '22C2021-08', 780, '2021-08-13'),
(875, 763, '22G2021-08', 780, '2021-08-13'),
(876, 764, '23E2021-08', 979, '2021-08-13'),
(877, 765, '24D2021-08', 979, '2021-08-13'),
(878, 766, '24E2021-08', 979, '2021-08-13'),
(879, 767, '24H2021-08', 979, '2021-08-13'),
(880, 768, '25A2021-08', 979, '2021-08-13'),
(881, 769, '10C2021-08', 780, '2021-08-13'),
(882, 770, '03A2021-08', 979, '2021-08-13'),
(883, 771, '11E2021-08', 979, '2021-08-13'),
(884, 772, '08D2021-08', 979, '2021-08-13'),
(885, 773, '03H2021-08', 979, '2021-08-13'),
(886, 774, '05F2021-08', 780, '2021-08-13'),
(887, 775, '06E2021-08', 979, '2021-08-13'),
(888, 776, '07D2021-08', 979, '2021-08-13'),
(889, 777, '07F2021-08', 780, '2021-08-13'),
(890, 778, '09B2021-08', 780, '2021-08-13'),
(891, 779, '09F2021-08', 780, '2021-08-13'),
(892, 780, '09B2021-08-apart', 743, '2021-08-13'),
(893, 781, 'SHOP022021-08', 747, '2021-08-13'),
(894, 782, '18G2021-09', 780, '2021-08-13'),
(895, 783, '16E2021-08', 979, '2021-08-13'),
(896, 784, '25D2021-08', 979, '2021-08-13'),
(897, 785, '01A2021-08', 979, '2021-08-13'),
(898, 786, '08B2021-08', 780, '2021-08-13'),
(899, 787, '01G2021-08', 780, '2021-08-13'),
(900, 788, '01H2021-08', 979, '2021-08-13'),
(901, 789, '03D2021-08', 979, '2021-08-13'),
(902, 790, '09D2021-08', 979, '2021-08-30'),
(903, 791, '01D2021-09', 979, '2021-08-30'),
(904, 792, '13D2021-08', 979, '2021-08-30'),
(905, 793, '20F2021-08', 780, '2021-08-30'),
(906, 794, '14H2021-08', 979, '2021-08-30'),
(907, 795, '22A2021-08', 979, '2021-08-30'),
(908, 796, '14F2021-08', 780, '2021-08-13'),
(909, 797, 'SHOP022021-07', 711, '2021-07-16'),
(910, 798, '16H2021-08', 979, '2021-09-01'),
(911, 798, '16H2021-09', 979, '2021-09-01'),
(912, 799, '24A2021-09', 979, '2021-09-01'),
(913, 800, '11C2021-09', 780, '2021-09-01'),
(914, 801, '10A2021-09', 979, '2021-09-01'),
(915, 802, '19C2021-09', 780, '2021-09-01'),
(916, 803, '11A2021-09', 979, '2021-09-01'),
(917, 804, '11D2021-09', 979, '2021-09-01'),
(918, 805, '17E2021-09', 979, '2021-09-01'),
(919, 806, '21A2021-09', 979, '2021-09-01'),
(920, 807, '06H2021-09', 979, '2021-09-01'),
(921, 808, '06F2021-09', 780, '2021-09-01'),
(922, 809, '09E2021-09', 979, '2021-09-01'),
(923, 810, '25H2021-09', 979, '2021-09-01'),
(924, 811, '19D2021-09', 979, '2021-09-01'),
(925, 812, '20B2021-09', 780, '2021-09-01'),
(926, 813, '04E2021-09', 979, '2021-09-01'),
(927, 814, 'SHOP052021-08', 39, '2021-09-01'),
(928, 814, 'SHOP052021-09', 813, '2021-09-01'),
(929, 815, '13E2021-07', 932, '2021-09-01'),
(930, 815, '13E2021-08', 979, '2021-09-01'),
(931, 816, '06C2021-09', 780, '2021-09-01'),
(932, 817, '09G2021-09', 780, '2021-09-02'),
(933, 818, 'SHOP042021-08-adv', 34, '2021-09-02'),
(934, 818, 'SHOP042021-09', 713, '2021-09-02'),
(935, 819, 'SHOP012021-08', 813, '2021-09-02'),
(936, 820, '22B2021-09', 780, '2021-09-02'),
(937, 821, '06D2021-09', 979, '2021-09-02'),
(938, 822, '10D2021-09', 979, '2021-09-02'),
(939, 823, '01C2021-09', 780, '2021-09-02'),
(940, 824, 'SHOP062021-09', 465, '2021-09-02'),
(941, 825, '04C2021-09', 780, '2021-09-02'),
(942, 826, '02C2021-09', 780, '2021-09-02'),
(943, 827, '02D2021-09', 979, '2021-09-02'),
(944, 828, '08A2021-06', 932, '2021-09-02'),
(945, 828, '08A2021-07', 932, '2021-09-02'),
(946, 828, '08A2021-08', 979, '2021-09-02'),
(947, 829, '04F2021-09', 780, '2021-09-02'),
(948, 830, '09C2021-09', 780, '2021-09-02'),
(949, 831, '10B2021-09', 780, '2021-09-02'),
(950, 832, '15B2021-09', 780, '2021-09-02'),
(951, 833, '08E2021-09', 979, '2021-09-02'),
(952, 834, '04D2021-09', 979, '2021-09-02'),
(953, 835, '15D2021-09', 979, '2021-09-02'),
(954, 836, '22D2021-09', 979, '2021-09-02'),
(955, 837, '02A2021-09', 979, '2021-09-02'),
(956, 838, '06A2021-09', 979, '2021-09-02'),
(957, 839, '07G2021-09', 780, '2021-09-02'),
(958, 840, '13A2021-08-adv', 47, '2021-09-02'),
(959, 840, '13A2021-09-adv', 47, '2021-09-02'),
(960, 841, '10E2021-09', 979, '2021-09-02'),
(961, 842, '16G2021-09', 780, '2021-09-02'),
(962, 843, '12A2021-09', 979, '2021-09-02'),
(963, 844, '01E2021-09', 979, '2021-09-02'),
(964, 845, '02F2021-09', 780, '2021-09-02'),
(965, 846, '03C2021-09', 780, '2021-09-02'),
(966, 847, '04B2021-09', 780, '2021-09-02'),
(967, 848, '14B2021-09', 780, '2021-09-02'),
(968, 849, '17H2021-09', 979, '2021-09-02'),
(969, 850, '20C2021-09', 780, '2021-09-02'),
(970, 851, '20E2021-09', 979, '2021-09-02'),
(971, 852, '21C2021-09', 780, '2021-09-02'),
(972, 853, '21F2021-09', 780, '2021-09-02'),
(973, 854, '08C2021-09', 780, '2021-09-02'),
(974, 855, '19E2021-09', 979, '2021-09-02'),
(975, 856, '21E2021-09', 979, '2021-09-02'),
(976, 857, '13H2021-09', 979, '2021-09-02'),
(977, 858, '23C2021-09', 780, '2021-09-07'),
(978, 859, '07C2021-09', 780, '2021-09-07'),
(979, 860, '17C2021-09', 780, '2021-09-07'),
(980, 861, '14A2021-09', 979, '2021-09-07'),
(981, 862, '18C2021-09', 780, '2021-09-07'),
(982, 863, '25E2021-09', 979, '2021-09-07'),
(983, 864, '20D2021-09', 979, '2021-09-07'),
(984, 865, '18B2021-09', 780, '2021-09-07'),
(985, 866, 'SHOP072021-08', 19, '2021-09-07'),
(986, 866, 'SHOP072021-09', 398, '2021-09-07'),
(987, 867, '06G2021-09', 780, '2021-09-07'),
(988, 868, '14E2021-09', 979, '2021-09-07'),
(989, 869, '13C2021-09', 780, '2021-09-07'),
(990, 870, '12G2021-09', 780, '2021-09-07'),
(991, 871, '24G2021-09', 780, '2021-09-07'),
(992, 872, '02E2021-09', 979, '2021-09-07'),
(993, 873, '05C2021-09', 780, '2021-09-07'),
(994, 874, '06B2021-09', 780, '2021-09-07'),
(995, 875, '07E2021-09', 979, '2021-09-07'),
(996, 876, '11G2021-08', 780, '2021-09-09'),
(997, 876, '11G2021-09', 780, '2021-09-09'),
(998, 877, '20G2021-09', 780, '2021-09-09'),
(999, 878, 'SHOP132021-08', 730, '2021-09-09'),
(1000, 878, 'SHOP132021-09', 730, '2021-09-09'),
(1001, 879, 'SHOP032021-09', 664, '2021-09-09'),
(1002, 880, '05H2021-09', 979, '2021-09-09'),
(1003, 881, '01B2021-09', 780, '2021-09-09'),
(1004, 882, '04A2021-09', 979, '2021-09-09'),
(1005, 883, '15E2021-09', 979, '2021-09-09'),
(1006, 884, '17D2021-09', 979, '2021-09-09'),
(1007, 885, '18E2021-08', 979, '2021-09-09'),
(1008, 885, '18E2021-09', 979, '2021-09-09'),
(1009, 886, '20H2021-09', 979, '2021-09-09'),
(1010, 887, '25C2021-09', 780, '2021-09-09'),
(1011, 888, '19B2021-09', 780, '2021-09-09'),
(1012, 889, '25G2021-09', 780, '2021-09-09'),
(1013, 890, '19H2021-09', 979, '2021-09-09'),
(1014, 891, '14D2021-09', 979, '2021-09-09'),
(1015, 892, '18A2021-08-adv', 47, '2021-09-09'),
(1016, 892, '18A2021-09-adv', 47, '2021-09-09'),
(1017, 892, '18A2021-10-adv', 47, '2021-09-09'),
(1018, 892, '18A2021-11-adv', 47, '2021-09-09'),
(1019, 892, '18A2021-12-adv', 47, '2021-09-09'),
(1020, 893, '19A2021-09', 979, '2021-09-09'),
(1021, 894, '18D2021-09', 979, '2021-09-09'),
(1022, 895, '10G2021-07', 743, '2021-09-09'),
(1023, 895, '10G2021-08', 780, '2021-09-09'),
(1024, 896, '23F2021-09', 780, '2021-09-13'),
(1025, 897, '25B2021-09', 780, '2021-09-13'),
(1026, 898, '21G2021-09', 780, '2021-09-13'),
(1027, 899, '17A2021-09', 979, '2021-09-13'),
(1028, 900, '05B2021-09', 780, '2021-09-13'),
(1029, 901, '08G2021-09', 780, '2021-09-13'),
(1030, 902, '15C2021-09', 780, '2021-09-13'),
(1031, 903, '17G2021-09', 780, '2021-09-13'),
(1032, 904, '08H2021-09', 979, '2021-09-13'),
(1033, 905, '12C2021-06', 743, '2021-09-13'),
(1034, 905, '12C2021-07', 743, '2021-09-13'),
(1035, 905, '12C2021-08', 780, '2021-09-13'),
(1036, 906, '05E2021-09', 979, '2021-09-13'),
(1037, 907, '19F2021-09', 780, '2021-09-13'),
(1038, 908, '07A2021-09', 979, '2021-09-13'),
(1039, 909, '24B2021-09', 780, '2021-09-13'),
(1040, 910, '15A2021-09', 979, '2021-09-13'),
(1041, 911, 'SHOP112021-09', 1061, '2021-09-13'),
(1042, 912, '21D2021-09', 979, '2021-09-13'),
(1043, 913, '22E2021-09', 979, '2021-09-13'),
(1044, 914, '23D2021-09', 979, '2021-09-20'),
(1045, 915, '10H2021-08-adv', 47, '2021-09-20'),
(1046, 915, '10H2021-09', 979, '2021-09-20'),
(1047, 915, '10H2021-10', 979, '2021-09-20'),
(1048, 915, '10H2021-12', 979, '2021-09-20'),
(1049, 916, '04H2021-08-adv', 47, '2021-09-20'),
(1050, 916, '04H2021-09', 979, '2021-09-20'),
(1051, 916, '04H2021-10', 979, '2021-09-20'),
(1052, 916, '04H2021-11', 979, '2021-09-20'),
(1053, 916, '04H2021-12', 979, '2021-09-20'),
(1054, 916, '04H2022-01', 979, '2021-09-20'),
(1055, 916, '04H2022-02', 979, '2021-09-20'),
(1056, 917, '15F2021-09', 780, '2021-09-20'),
(1057, 918, '03F2021-09', 780, '2021-09-20'),
(1058, 919, '13D2021-09', 979, '2021-09-27'),
(1059, 920, '12E2021-09', 979, '2021-09-27'),
(1060, 921, '13F2021-09', 780, '2021-09-27'),
(1061, 922, '09D2021-09', 979, '2021-09-27'),
(1062, 923, '14C2021-09', 780, '2021-09-27'),
(1063, 924, '20F2021-09', 780, '2021-09-27'),
(1064, 925, '22F2021-09', 780, '2021-09-27'),
(1065, 926, '22H2021-09', 979, '2021-09-27'),
(1066, 927, 'SHOP102021-09', 896, '2021-09-27'),
(1067, 928, '23G2021-09', 780, '2021-09-27'),
(1068, 928, '23G2021-10', 780, '2021-09-27'),
(1069, 929, '02B2021-09', 780, '2021-09-27'),
(1070, 929, '02B2022-10', 780, '2021-09-27'),
(1071, 930, '11F2021-09', 780, '2021-09-27'),
(1072, 931, '09H2021-09', 979, '2021-09-27'),
(1073, 932, '10F2021-09', 780, '2021-09-27'),
(1074, 933, '23A2021-09', 979, '2021-09-27'),
(1075, 934, '14H2021-09', 979, '2021-09-27'),
(1076, 935, '02B2021-07', 743, '2021-09-27'),
(1077, 935, '02B2021-08', 780, '2021-09-27'),
(1078, 936, '23G2021-07', 743, '2021-09-27'),
(1079, 936, '23G2021-08', 780, '2021-09-27'),
(1080, 937, '05G2021-09', 780, '2021-09-14'),
(1081, 938, '20A2021-09', 979, '2021-09-14'),
(1082, 939, '15H2021-09', 979, '2021-09-14'),
(1083, 940, '03E2021-09', 979, '2021-09-14'),
(1084, 941, '06E2021-09', 979, '2021-09-14'),
(1085, 942, '22C2021-09', 780, '2021-09-14'),
(1086, 943, '24D2021-09', 979, '2021-09-14'),
(1087, 944, '25F2021-09', 780, '2021-09-14'),
(1088, 945, '03A2021-09', 979, '2021-09-14'),
(1089, 946, '07F2021-09', 780, '2021-09-14'),
(1090, 947, '24H2021-09', 979, '2021-09-14'),
(1091, 948, '14F2021-09', 780, '2021-09-14'),
(1092, 949, '21H2021-09', 979, '2021-09-14'),
(1093, 950, '09F2021-09', 780, '2021-09-14'),
(1094, 951, '05F2021-09', 780, '2021-09-14'),
(1095, 952, '11H2021-09', 979, '2021-09-14'),
(1096, 953, '25A2021-09', 979, '2021-09-14'),
(1097, 954, '12D2021-09', 979, '2021-09-14'),
(1098, 955, '24E2021-09', 979, '2021-09-14'),
(1099, 956, '18G2021-10', 780, '2021-09-14'),
(1100, 957, '16C2021-09', 780, '2021-09-14'),
(1101, 958, '21B2021-09', 780, '2021-09-14'),
(1102, 959, '16E2021-09', 979, '2021-09-14'),
(1103, 960, '25D2021-09', 979, '2021-09-14'),
(1104, 961, '12F2021-09', 780, '2021-09-14'),
(1105, 962, '23E2021-09', 979, '2021-09-14'),
(1106, 963, '13B2021-09', 780, '2021-09-14'),
(1107, 964, '01A2021-09', 979, '2021-09-14'),
(1108, 965, '10C2021-09', 780, '2021-09-14'),
(1109, 966, '07D2021-09', 979, '2021-09-14'),
(1110, 967, '22G2021-09', 780, '2021-09-14'),
(1111, 968, '12B2021-09', 780, '2021-09-14'),
(1112, 969, '03H2021-09', 979, '2021-09-14'),
(1113, 970, '02G2021-09', 780, '2021-09-14'),
(1114, 971, 'SHOP022021-09', 747, '2021-09-14'),
(1115, 972, '01F2021-09', 780, '2021-09-14'),
(1116, 973, '08B2021-09', 780, '2021-09-14'),
(1117, 974, '16D2021-09', 979, '2021-09-14'),
(1118, 975, '14G2021-09', 780, '2021-09-14'),
(1119, 976, '19G2021-09', 780, '2021-09-14'),
(1120, 977, '08D2021-09', 979, '2021-09-14'),
(1121, 978, '17F2021-09', 780, '2021-09-14'),
(1122, 979, '15G2021-09', 780, '2021-09-14'),
(1123, 980, '16F2021-09', 780, '2021-09-14'),
(1124, 981, '01G2021-09', 780, '2021-09-14'),
(1125, 982, '01H2021-09', 979, '2021-09-14'),
(1126, 983, '11E2021-09', 979, '2021-09-14'),
(1127, 984, '09B2021-09', 780, '2021-09-14'),
(1128, 985, '12H2021-09', 979, '2021-09-14'),
(1129, 986, '03D2021-09', 979, '2021-09-14');

-- --------------------------------------------------------

--
-- 資料表結構 `Total`
--

CREATE TABLE `Total` (
  `ID` int NOT NULL,
  `Unit` varchar(255) NOT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int NOT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` int DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Total`
--

INSERT INTO `Total` (`ID`, `Unit`, `ManageFeeDate`, `DCode`, `Amount`, `Method`, `BCQ`, `Paid`, `RCode`, `DemandDate`, `ReceivedDate`, `BankInDate`) VALUES
(1, 'SHOP01', '2021-04', 'SHOP012021-04', 774, 'cheque', '', '774', 53, '2021-04-01', '2021-05-07', NULL),
(2, 'SHOP04', '2021-04', 'SHOP042021-04', 679, 'cash', '', '679', 253, '2021-04-01', '2021-06-05', NULL),
(3, 'SHOP07', '2021-04', 'SHOP072021-04', 379, 'cheque', '906594', '379', 21, '2021-04-01', '2021-04-26', NULL),
(4, 'SHOP08', '2021-04', 'SHOP082021-04', 443, 'auto', '', '443', 218, '2021-04-01', '2021-05-04', NULL),
(5, 'SHOP09', '2021-04', 'SHOP092021-04', 505, 'auto', '', '505', 219, '2021-04-01', '2021-05-04', NULL),
(6, 'SHOP13', '2021-04', 'SHOP132021-04', 695, 'cheque', '', '695', 108, '2021-04-01', '2021-05-11', NULL),
(7, '04A', '2021-04', '04A2021-04', 932, 'cash', '', '932', 30, '2021-04-01', '2021-05-03', NULL),
(8, '04H', '2021-04', '04H2021-04', 932, 'cheque', '', '932', 76, '2021-04-01', '2021-05-07', NULL),
(9, '04H', '2021-03', '04H2021-03', 932, 'cheque', '', '932', 76, '2021-03-01', '2021-05-07', NULL),
(10, '05D', '2021-04', '05D2021-04', 932, 'cheque', '', '932', 159, '2021-04-01', '2021-05-28', NULL),
(11, '08F', '2021-04', '08F2021-04', 743, 'cheque', '', '743', 222, '2021-04-01', '2021-06-03', NULL),
(12, '09D', '2021-04', '09D2021-04', 932, 'cash', '', '932', 29, '2021-04-01', '2021-05-03', NULL),
(13, '10G', '2021-04', '10G2021-04', 743, 'cash', '', '743', 36, '2021-04-01', '2021-05-07', NULL),
(14, '10G', '2021-03', '10G2021-03', 743, 'cash', '', '743', 135, '2021-03-01', '2021-05-20', NULL),
(15, '11F', '2021-04', '11F2021-04', 743, 'cheque', '469508', '743', 22, '2021-04-01', '2021-04-26', NULL),
(16, '11G', '2021-02', '11G2021-02', 743, 'cheque', '360126', '743', 23, '2021-02-01', '2021-04-26', NULL),
(17, '11G', '2021-03', '11G2021-03', 743, 'cheque', '360126', '743', 23, '2021-03-01', '2021-04-26', NULL),
(18, '11G', '2021-04', '11G2021-04', 743, 'cheque', '360126', '743', 23, '2021-04-01', '2021-04-26', NULL),
(19, '12C', '2021-03', '12C2021-03', 743, 'cheque', '', '743', 346, '2021-03-01', '2021-06-30', NULL),
(20, '12C', '2021-04', '12C2021-04', 743, 'cash', '', '743', 347, '2021-04-01', '2021-06-30', NULL),
(21, '12E', '2021-04', '12E2021-04', 932, 'cheque', '000258', '932', 24, '2021-04-01', '2021-04-26', NULL),
(22, '13D', '2021-04', '13D2021-04', 932, 'cash', '735743', '932', 19, '2021-04-01', '2021-04-26', NULL),
(23, '13E', '2021-03', '13E2021-03', 932, 'cheque', '', '932', 82, '2021-03-01', '2021-05-07', NULL),
(24, '13E', '2021-04', '13E2021-04', 932, 'cheque', '', '932', 82, '2021-04-01', '2021-05-07', NULL),
(25, '13F', '2021-04', '13F2021-04', 743, 'cheque', '217148', '743', 14, '2021-04-01', '2021-04-26', NULL),
(26, '13G', '2021-04', '13G2021-04', 743, 'cheque', '', '743', 516, '2021-04-01', '2021-07-19', NULL),
(27, '14H', '2021-04', '14H2021-04', 932, 'cheque', '', '932', 31, '2021-04-01', '2021-05-03', NULL),
(28, '15F', '2021-04', '15F2021-04', 743, 'cheque', '499353', '743', 27, '2021-04-01', '2021-04-26', NULL),
(29, '16A', '2021-04', '16A2021-04', 932, 'cheque', '', '932', 517, '2021-04-01', '2021-07-19', NULL),
(30, '17B', '2021-04', '17B2021-04', 743, 'cash', '', '743', 28, '2021-04-01', '2021-05-03', NULL),
(31, '18E', '2021-04', '18E2021-04', 932, 'cheque', '', '932', 136, '2021-04-01', '2021-05-20', NULL),
(32, '20H', '2021-04', '20H2021-04', 932, 'cheque', '995820', '932', 18, '2021-04-01', '2021-04-26', NULL),
(33, '21F', '2021-04', '21F2021-04', 743, 'cheque', '275014', '743', 20, '2021-04-01', '2021-04-26', NULL),
(34, '22A', '2021-04', '22A2021-04', 932, 'cheque', '', '932', 126, '2021-04-01', '2021-05-11', NULL),
(35, '22E', '2021-04', '22E2021-04', 932, 'cheque', '000776', '932', 16, '2021-04-01', '2021-04-26', NULL),
(36, '22F', '2021-04', '22F2021-04', 743, 'cheque', '100027', '743', 26, '2021-04-01', '2021-04-26', NULL),
(37, '23A', '2021-04', '23A2021-04', 932, 'cheque', '320412', '932', 25, '2021-04-01', '2021-04-26', NULL),
(38, '23D', '2021-04', '23D2021-04', 932, 'cheque', '000777', '932', 17, '2021-04-01', '2021-04-26', NULL),
(39, '24C', '2021-04', '24C2021-04', 743, 'cheque', '930554', '743', 15, '2021-04-01', '2021-04-26', NULL),
(40, '24F', '2021-04', '24F2021-04', 743, 'cheque', '', '743', 223, '2021-04-01', '2021-06-03', NULL),
(41, '24C', '2021-02', '24C2021-02', 743, 'cheque', '930554', '743', 15, '2021-02-01', '2021-04-26', NULL),
(42, '24C', '2021-03', '24C2021-03', 743, 'cheque', '930554', '743', 15, '2021-03-01', '2021-04-26', NULL),
(43, '17B', '2021-03', '17B2021-03', 743, 'cash', '', '743', 28, '2021-03-01', '2021-05-03', NULL),
(44, '18F', '2021-05', '18F2021-05', 743, 'cash', '', '743', 1, '2021-05-01', '2020-12-31', NULL),
(45, '18F', '2021-06', '18F2021-06', 743, 'cash', '', '743', 1, '2021-06-01', '2020-12-31', NULL),
(46, '18F', '2021-07', '18F2021-07', 743, 'cash', '', '743', 1, '2021-07-01', '2020-12-31', NULL),
(47, '18F', '2021-08', '18F2021-08', 743, 'cash', '', '743', 1, '2021-08-01', '2020-12-31', NULL),
(48, '18F', '2021-09', '18F2021-09', 743, 'cash', '', '743', 1, '2021-09-01', '2020-12-31', NULL),
(49, '18F', '2021-10', '18F2021-10', 743, 'cash', '', '743', 1, '2021-10-01', '2020-12-31', NULL),
(50, '18F', '2021-11', '18F2021-11', 743, 'cash', '', '743', 1, '2021-11-01', '2020-12-31', NULL),
(51, '18F', '2021-12', '18F2021-12', 743, 'cash', '', '743', 1, '2021-12-01', '2020-12-31', NULL),
(52, 'SHOP03', '2021-05', 'SHOP032021-05', 632, 'cash', '', '632', 2, '2021-05-01', '2021-01-12', NULL),
(53, 'SHOP03', '2021-06', 'SHOP032021-06', 632, 'cash', '', '632', 2, '2021-06-01', '2021-01-12', NULL),
(54, '25B', '2021-05', '25B2021-05', 743, 'cash', '', '743', 3, '2021-05-01', '2021-01-20', NULL),
(55, '25B', '2021-06', '25B2021-06', 743, 'cash', '', '743', 3, '2021-06-01', '2021-01-20', NULL),
(56, '04G', '2021-05', '04G2021-05', 743, 'cash', '', '743', 4, '2021-05-01', '2021-01-20', NULL),
(57, '04G', '2021-06', '04G2021-06', 743, 'cash', '', '743', 4, '2021-06-01', '2021-01-20', NULL),
(58, '07B', '2021-05', '07B2021-05', 743, 'cash', '', '743', 5, '2021-05-01', '2021-02-09', NULL),
(59, '07B', '2021-06', '07B2021-06', 743, 'cash', '', '743', 5, '2021-06-01', '2021-02-09', NULL),
(60, '07B', '2021-07', '07B2021-07', 743, 'cash', '', '743', 5, '2021-07-01', '2021-02-09', NULL),
(61, '07B', '2021-08', '07B2021-08', 743, 'cash', '', '743', 5, '2021-08-01', '2021-02-09', NULL),
(62, '07B', '2021-09', '07B2021-09', 743, 'cash', '', '743', 5, '2021-09-01', '2021-02-09', NULL),
(63, '07B', '2021-10', '07B2021-10', 743, 'cash', '', '743', 5, '2021-10-01', '2021-02-09', NULL),
(64, '07B', '2021-11', '07B2021-11', 743, 'cash', '', '743', 5, '2021-11-01', '2021-02-09', NULL),
(65, '07B', '2021-12', '07B2021-12', 743, 'cash', '', '743', 5, '2021-12-01', '2021-02-09', NULL),
(66, '16B', '2021-05', '16B2021-05', 743, 'cash', '', '743', 6, '2021-05-01', '2021-02-22', NULL),
(67, '16B', '2021-06', '16B2021-06', 743, 'cash', '', '743', 6, '2021-06-01', '2021-02-22', NULL),
(68, '02H', '2021-05', '02H2021-05', 932, 'cash', '', '932', 7, '2021-05-01', '2021-02-22', NULL),
(69, '02H', '2021-06', '02H2021-06', 932, 'cash', '', '932', 7, '2021-06-01', '2021-02-22', NULL),
(70, '18A', '2021-05', '18A2021-05', 932, 'cash', '', '932', 8, '2021-05-01', '2021-03-15', NULL),
(71, '18A', '2021-06', '18A2021-06', 932, 'cash', '', '932', 8, '2021-06-01', '2021-03-15', NULL),
(72, '10H', '2021-05', '10H2021-05', 932, 'cash', '', '932', 9, '2021-05-01', '2021-03-15', NULL),
(73, '08A', '2021-05', '08A2021-05', 932, 'cash', '', '932', 10, '2021-05-01', '2021-04-07', NULL),
(74, '23H', '2021-05', '23H2021-05', 932, 'cash', '', '932', 11, '2021-05-01', '2021-04-07', NULL),
(75, '23H', '2021-06', '23H2021-06', 932, 'cash', '', '932', 11, '2021-06-01', '2021-04-07', NULL),
(76, '11B', '2021-05', '11B2021-05', 743, 'cash', '', '743', 12, '2021-05-01', '2021-04-16', NULL),
(77, '11B', '2021-06', '11B2021-06', 743, 'cash', '', '743', 12, '2021-06-01', '2021-04-16', NULL),
(78, '13A', '2021-05', '13A2021-05', 932, 'cash', '', '932', 13, '2021-05-01', '2021-04-16', NULL),
(79, '13A', '2021-06', '13A2021-06', 932, 'cash', '', '932', 13, '2021-06-01', '2021-04-16', NULL),
(80, '01A', '2021-05', '01A2021-05', 932, 'auto', '', '932', 164, '2021-05-01', '2021-05-24', NULL),
(81, '01B', '2021-05', '01B2021-05', 743, 'cash', '', '743', 39, '2021-05-01', '2021-05-07', NULL),
(82, '01C', '2021-05', '01C2021-05', 743, 'cheque', '', '743', 57, '2021-05-01', '2021-05-07', NULL),
(83, '01D', '2021-05', '01D2021-05', 932, 'cheque', '', '932', 51, '2021-05-01', '2021-05-07', NULL),
(84, '01E', '2021-05', '01E2021-05', 932, 'cheque', '', '932', 85, '2021-05-01', '2021-05-07', NULL),
(85, '01F', '2021-05', '01F2021-05', 743, 'auto', '', '743', 165, '2021-05-01', '2021-05-24', NULL),
(86, '01G', '2021-05', '01G2021-05', 743, 'auto', '', '743', 166, '2021-05-01', '2021-05-24', NULL),
(87, '01H', '2021-05', '01H2021-05', 932, 'auto', '', '932', 167, '2021-05-01', '2021-05-24', NULL),
(88, '02A', '2021-05', '02A2021-05', 932, 'cash', '', '932', 32, '2021-05-01', '2021-05-03', NULL),
(89, '02B', '2021-05', '02B2021-05', 743, 'cheque', '', '743', 142, '2021-05-01', '2021-05-20', NULL),
(90, '02C', '2021-05', '02C2021-05', 743, 'cash', '', '743', 33, '2021-05-01', '2021-05-03', NULL),
(91, '02D', '2021-05', '02D2021-05', 932, 'cash', '', '932', 40, '2021-05-01', '2021-05-07', NULL),
(92, '02E', '2021-05', '02E2021-05', 932, 'cheque', '', '932', 103, '2021-05-01', '2021-05-11', NULL),
(93, '02F', '2021-05', '02F2021-05', 743, 'cheque', '', '743', 91, '2021-05-01', '2021-05-07', NULL),
(94, '02G', '2021-05', '02G2021-05', 743, 'cheque', '', '743', 168, '2021-05-01', '2021-01-19', NULL),
(96, '03A', '2021-05', '03A2021-05', 932, 'auto', '', '932', 169, '2021-05-01', '2021-05-24', NULL),
(97, '03B', '2021-05', '03B2021-05', 743, 'cheque', '', '743', 290, '2021-05-01', '2021-06-15', NULL),
(98, '03C', '2021-05', '03C2021-05', 743, 'cash', '', '743', 34, '2021-05-01', '2021-05-03', NULL),
(99, '03D', '2021-05', '03D2021-05', 932, 'auto', '', '932', 170, '2021-05-01', '2021-05-24', NULL),
(100, '03E', '2021-05', '03E2021-05', 932, 'auto', '', '932', 171, '2021-05-01', '2021-05-24', NULL),
(101, '03F', '2021-05', '03F2021-05', 743, 'cheque', '', '743', 156, '2021-05-01', '2021-05-28', NULL),
(102, '03G', '2021-05', '03G2021-05', 743, 'cheque', '', '743', 338, '2021-05-01', '2021-06-22', NULL),
(103, '03H', '2021-05', '03H2021-05', 932, 'auto', '', '932', 172, '2021-05-01', '2021-05-24', NULL),
(104, '04A', '2021-05', '04A2021-05', 932, 'cheque', '', '932', 127, '2021-05-01', '2021-05-11', NULL),
(105, '04B', '2021-05', '04B2021-05', 743, 'cheque', '', '743', 138, '2021-05-01', '2021-05-20', NULL),
(106, '04C', '2021-05', '04C2021-05', 743, 'cheque', '', '743', 64, '2021-05-01', '2021-05-07', NULL),
(107, '04D', '2021-05', '04D2021-05', 932, 'cheque', '', '932', 77, '2021-05-01', '2021-05-07', NULL),
(108, '04E', '2021-05', '04E2021-05', 932, 'cheque', '', '932', 83, '2021-05-01', '2021-05-07', NULL),
(109, '04F', '2021-05', '04F2021-05', 743, 'cheque', '', '743', 73, '2021-05-01', '2021-05-07', NULL),
(111, '04H', '2021-05', '04H2021-05', 932, 'cheque', '', '932', 76, '2021-05-01', '2021-05-07', NULL),
(112, '05A', '2021-05', '05A2021-05', 932, 'cash', '', '932', 118, '2021-05-01', '2021-05-11', NULL),
(113, '05B', '2021-05', '05B2021-05', 743, 'cheque', '', '743', 146, '2021-05-01', '2021-05-20', NULL),
(114, '05C', '2021-05', '05C2021-05', 743, 'cheque', '', '743', 63, '2021-05-01', '2021-05-07', NULL),
(115, '05D', '2021-05', '05D2021-05', 932, 'cheque', '', '932', 159, '2021-05-01', '2021-05-28', NULL),
(116, '05E', '2021-05', '05E2021-05', 932, 'cheque', '', '932', 114, '2021-05-01', '2021-05-11', NULL),
(117, '05F', '2021-05', '05F2021-05', 743, 'auto', '', '743', 173, '2021-05-01', '2021-05-24', NULL),
(118, '05G', '2021-05', '05G2021-05', 743, 'auto', '', '743', 174, '2021-05-01', '2021-05-24', NULL),
(119, '05H', '2021-05', '05H2021-05', 932, 'cheque', '', '932', 109, '2021-05-01', '2021-05-11', NULL),
(120, '06A', '2021-05', '06A2021-05', 932, 'cheque', '', '932', 70, '2021-05-01', '2021-05-07', NULL),
(121, '06B', '2021-05', '06B2021-05', 743, 'cheque', '', '743', 71, '2021-05-01', '2021-05-07', NULL),
(122, '06C', '2021-05', '06C2021-05', 743, 'cheque', '', '743', 49, '2021-05-01', '2021-05-07', NULL),
(123, '06D', '2021-05', '06D2021-05', 932, 'cheque', '', '932', 45, '2021-05-01', '2021-05-07', NULL),
(124, '06E', '2021-05', '06E2021-05', 932, 'auto', '', '932', 175, '2021-05-01', '2021-05-24', NULL),
(125, '06F', '2021-05', '06F2021-05', 743, 'cheque', '', '743', 61, '2021-05-01', '2021-05-07', NULL),
(126, '06G', '2021-05', '06G2021-05', 743, 'cheque', '', '743', 98, '2021-05-01', '2021-05-07', NULL),
(127, '06H', '2021-05', '06H2021-05', 932, 'cheque', '', '932', 75, '2021-05-01', '2021-05-07', NULL),
(128, '07A', '2021-05', '07A2021-05', 932, 'cheque', '', '932', 141, '2021-05-01', '2021-05-20', NULL),
(130, '07C', '2021-05', '07C2021-05', 743, 'cheque', '', '743', 68, '2021-05-01', '2021-05-07', NULL),
(131, '07D', '2021-05', '07D2021-05', 932, 'auto', '', '932', 176, '2021-05-01', '2021-05-24', NULL),
(132, '07E', '2021-05', '07E2021-05', 932, 'cheque', '', '932', 105, '2021-05-01', '2021-05-11', NULL),
(133, '07F', '2021-05', '07F2021-05', 743, 'auto', '', '743', 177, '2021-05-01', '2021-05-24', NULL),
(134, '07G', '2021-05', '07G2021-05', 743, 'cheque', '', '743', 99, '2021-05-01', '2021-05-10', NULL),
(135, '07H', '2021-05', '07H2021-05', 932, 'cheque', '', '932', 480, '2021-05-01', '2021-07-12', NULL),
(137, '08B', '2021-05', '08B2021-05', 743, 'auto', '', '743', 178, '2021-05-01', '2021-05-24', NULL),
(138, '08C', '2021-05', '08C2021-05', 743, 'cheque', '', '743', 119, '2021-05-01', '2021-05-07', NULL),
(139, '08D', '2021-05', '08D2021-05', 932, 'auto', '', '932', 214, '2021-05-01', '2021-05-24', NULL),
(140, '08E', '2021-05', '08E2021-05', 932, 'cheque', '', '932', 50, '2021-05-01', '2021-05-07', NULL),
(141, '08F', '2021-05', '08F2021-05', 743, 'cheque', '', '743', 222, '2021-05-01', '2021-06-03', NULL),
(142, '08G', '2021-05', '08G2021-05', 743, 'cheque', '', '743', 151, '2021-05-01', '2021-05-20', NULL),
(143, '08H', '2021-05', '08H2021-05', 932, 'cheque', '', '932', 152, '2021-05-01', '2021-05-24', NULL),
(144, '09A', '2021-05', '09A2021-05', 932, 'cheque', '', '932', 453, '2021-05-01', '2021-07-06', NULL),
(145, '09B', '2021-05', '09B2021-05', 743, 'auto', '', '743', 179, '2021-05-01', '2021-05-24', NULL),
(146, '09C', '2021-05', '09C2021-05', 743, 'cheque', '', '743', 80, '2021-05-01', '2021-05-07', NULL),
(147, '09D', '2021-05', '09D2021-05', 932, 'cheque', '', '932', 160, '2021-05-01', '2021-05-28', NULL),
(148, '09E', '2021-05', '09E2021-05', 932, 'cheque', '', '932', 52, '2021-05-01', '2021-05-07', NULL),
(149, '09F', '2021-05', '09F2021-05', 743, 'auto', '', '743', 180, '2021-05-01', '2021-05-24', NULL),
(150, '09G', '2021-05', '09G2021-05', 743, 'cheque', '', '743', 65, '2021-05-01', '2021-05-07', NULL),
(151, '09H', '2021-05', '09H2021-05', 932, 'cheque', '', '932', 122, '2021-05-01', '2021-05-11', NULL),
(152, '10A', '2021-05', '10A2021-05', 932, 'cheque', '', '932', 84, '2021-05-01', '2021-05-07', NULL),
(153, '10B', '2021-05', '10B2021-05', 743, 'cash', '', '743', 42, '2021-05-01', '2021-05-07', NULL),
(154, '10C', '2021-05', '10C2021-05', 743, 'auto', '', '743', 181, '2021-05-01', '2021-05-24', NULL),
(155, '10D', '2021-05', '10D2021-05', 932, 'cheque', '', '932', 58, '2021-05-01', '2021-05-07', NULL),
(156, '10E', '2021-05', '10E2021-05', 932, 'cheque', '', '932', 69, '2021-05-01', '2021-05-07', NULL),
(157, '10F', '2021-05', '10F2021-05', 743, 'cheque', '', '743', 139, '2021-05-01', '2021-05-20', NULL),
(158, '10G', '2021-05', '10G2021-05', 743, 'cash', '', '743', 509, '2021-05-01', '2021-07-19', NULL),
(160, '11A', '2021-05', '11A2021-05', 932, 'cash', '', '932', 38, '2021-05-01', '2021-05-07', NULL),
(162, '11C', '2021-05', '11C2021-05', 743, 'cheque', '', '743', 48, '2021-05-01', '2021-05-07', NULL),
(163, '11D', '2021-05', '11D2021-05', 932, 'cheque', '', '932', 47, '2021-05-01', '2021-05-07', NULL),
(164, '11E', '2021-05', '11E2021-05', 932, 'auto', '', '932', 182, '2021-05-01', '2021-05-24', NULL),
(165, '11F', '2021-05', '11F2021-05', 743, 'cheque', '', '743', 113, '2021-05-01', '2021-05-11', NULL),
(166, '11G', '2021-05', '11G2021-05', 743, 'cheque', '', '743', 470, '2021-05-01', '2021-07-06', NULL),
(167, '11H', '2021-05', '11H2021-05', 932, 'auto', '', '932', 183, '2021-05-01', '2021-05-24', NULL),
(168, '12A', '2021-05', '12A2021-05', 932, 'cheque', '', '932', 100, '2021-05-01', '2021-05-11', NULL),
(169, '12B', '2021-05', '12B2021-05', 743, 'auto', '', '743', 184, '2021-05-01', '2021-05-21', NULL),
(170, '12C', '2021-05', '12C2021-05', 743, 'cash', '', '743', 348, '2021-05-01', '2021-06-30', NULL),
(171, '12D', '2021-05', '12D2021-05', 932, 'auto', '', '932', 215, '2021-05-01', '2021-05-24', NULL),
(172, '12E', '2021-05', '12E2021-05', 932, 'cheque', '', '932', 154, '2021-05-01', '2021-05-24', NULL),
(173, '12F', '2021-05', '12F2021-05', 743, 'auto', '', '743', 185, '2021-05-01', '2021-05-24', NULL),
(174, '12G', '2021-05', '12G2021-05', 743, 'cheque', '', '743', 101, '2021-05-01', '2021-05-11', NULL),
(175, '12H', '2021-05', '12H2021-05', 932, 'auto', '', '932', 186, '2021-05-01', '2021-05-24', NULL),
(177, '13B', '2021-05', '13B2021-05', 743, 'auto', '', '743', 187, '2021-05-01', '2021-05-24', NULL),
(178, '13C', '2021-05', '13C2021-05', 743, 'cheque', '', '743', 111, '2021-05-01', '2021-05-11', NULL),
(179, '13D', '2021-05', '13D2021-05', 932, 'cheque', '', '932', 137, '2021-05-01', '2021-05-20', NULL),
(180, '13E', '2021-05', '13E2021-05', 932, 'cheque', '', '932', 408, '2021-05-01', '2021-07-06', NULL),
(181, '13F', '2021-05', '13F2021-05', 743, 'cheque', '', '743', 278, '2021-05-01', '2021-06-07', NULL),
(182, '13G', '2021-05', '13G2021-05', 743, 'cheque', '', '743', 516, '2021-05-01', '2021-07-19', NULL),
(183, '13H', '2021-05', '13H2021-05', 932, 'cheque', '', '932', 298, '2021-05-01', '2021-06-15', NULL),
(184, '14A', '2021-05', '14A2021-05', 932, 'cheque', '', '932', 60, '2021-05-01', '2021-05-07', NULL),
(185, '14B', '2021-05', '14B2021-05', 743, 'cheque', '', '743', 125, '2021-05-01', '2021-05-11', NULL),
(186, '14C', '2021-05', '14C2021-05', 743, 'cheque', '', '743', 133, '2021-05-01', '2021-05-17', NULL),
(187, '14D', '2021-05', '14D2021-05', 932, 'cheque', '', '932', 87, '2021-05-01', '2021-05-07', NULL),
(188, '14E', '2021-05', '14E2021-05', 932, 'cheque', '', '932', 104, '2021-05-01', '2021-05-11', NULL),
(189, '14F', '2021-05', '14F2021-05', 743, 'auto', '', '743', 188, '2021-05-01', '2021-05-24', NULL),
(190, '14G', '2021-05', '14G2021-05', 743, 'auto', '', '743', 189, '2021-05-01', '2021-05-24', NULL),
(191, '14H', '2021-05', '14H2021-05', 932, 'cheque', '', '932', 221, '2021-05-01', '2021-06-03', NULL),
(192, '15A', '2021-05', '15A2021-05', 932, 'cheque', '', '932', 120, '2021-05-01', '2021-05-11', NULL),
(193, '15B', '2021-05', '15B2021-05', 743, 'cheque', '', '743', 72, '2021-05-01', '2021-05-07', NULL),
(194, '15C', '2021-05', '15C2021-05', 743, 'cheque', '', '743', 115, '2021-05-01', '2021-05-11', NULL),
(195, '15D', '2021-05', '15D2021-05', 932, 'cheque', '', '932', 59, '2021-05-01', '2021-05-07', NULL),
(196, '15E', '2021-05', '15E2021-05', 932, 'cheque', '', '932', 94, '2021-05-01', '2021-05-07', NULL),
(197, '15F', '2021-05', '15F2021-05', 743, 'cheque', '', '743', 155, '2021-05-01', '2021-05-24', NULL),
(198, '15G', '2021-05', '15G2021-05', 743, 'auto', '', '743', 190, '2021-05-01', '2021-05-24', NULL),
(199, '15H', '2021-05', '15H2021-05', 932, 'auto', '', '932', 191, '2021-05-01', '2021-05-24', NULL),
(200, '16A', '2021-05', '16A2021-05', 932, 'cheque', '', '932', 517, '2021-05-01', '2021-07-19', NULL),
(202, '16C', '2021-05', '16C2021-05', 743, 'auto', '', '743', 192, '2021-05-01', '2021-05-24', NULL),
(203, '16D', '2021-05', '16D2021-05', 932, 'auto', '', '932', 193, '2021-05-01', '2021-05-24', NULL),
(204, '16E', '2021-05', '16E2021-05', 932, 'auto', '', '932', 194, '2021-05-01', '2021-05-24', NULL),
(205, '16F', '2021-05', '16F2021-05', 743, 'auto', '', '743', 195, '2021-05-01', '2021-05-24', NULL),
(206, '16G', '2021-05', '16G2021-05', 743, 'cheque', '', '743', 67, '2021-05-01', '2021-05-07', NULL),
(207, '16H', '2021-05', '16H2021-05', 932, 'cheque', '', '932', 342, '2021-05-01', '2021-06-25', NULL),
(208, '17A', '2021-05', '17A2021-05', 932, 'cheque', '', '932', 121, '2021-05-01', '2021-05-11', NULL),
(209, '17B', '2021-05', '17B2021-05', 743, 'cheque', '', '743', 317, '2021-05-01', '2021-06-15', NULL),
(210, '17C', '2021-05', '17C2021-05', 743, 'cheque', '', '743', 124, '2021-05-01', '2021-05-11', NULL),
(211, '17D', '2021-05', '17D2021-05', 932, 'cheque', '', '932', 106, '2021-05-01', '2021-05-11', NULL),
(212, '17E', '2021-05', '17E2021-05', 932, 'cheque', '', '932', 62, '2021-05-01', '2021-05-07', NULL),
(213, '17F', '2021-05', '17F2021-05', 743, 'auto', '', '743', 196, '2021-05-01', '2021-05-24', NULL),
(214, '17G', '2021-05', '17G2021-05', 743, 'cheque', '', '743', 116, '2021-05-01', '2021-05-11', NULL),
(215, '17H', '2021-05', '17H2021-05', 932, 'cheque', '', '932', 92, '2021-05-01', '2021-05-07', NULL),
(217, '18B', '2021-05', '18B2021-05', 743, 'cheque', '', '743', 140, '2021-05-01', '2021-05-20', NULL),
(218, '18C', '2021-05', '18C2021-05', 743, 'cheque', '', '743', 147, '2021-05-01', '2021-05-20', NULL),
(219, '18D', '2021-05', '18D2021-05', 932, 'cheque', '', '932', 132, '2021-05-01', '2021-05-17', NULL),
(220, '18E', '2021-05', '18E2021-05', 932, 'cheque', '', '932', 136, '2021-05-01', '2021-05-20', NULL),
(222, '18G', '2021-05', '18G2021-05', 743, 'auto', '', '743', 197, '2021-05-01', '2021-05-24', NULL),
(223, '18H', '2021-05', '18H2021-05', 932, 'cheque', '', '932', 507, '2021-05-01', '2021-07-12', NULL),
(224, '19A', '2021-05', '19A2021-05', 932, 'cheque', '', '932', 93, '2021-05-01', '2021-05-07', NULL),
(225, '19B', '2021-05', '19B2021-05', 743, 'cheque', '', '743', 46, '2021-05-01', '2021-05-07', NULL),
(226, '19C', '2021-05', '19C2021-05', 743, 'cash', '', '743', 37, '2021-05-01', '2021-05-07', NULL),
(227, '19D', '2021-05', '19D2021-05', 932, 'cash', '', '932', 43, '2021-05-01', '2021-05-07', NULL),
(228, '19E', '2021-05', '19E2021-05', 932, 'cheque', '', '932', 102, '2021-05-01', '2021-05-11', NULL),
(229, '19F', '2021-05', '19F2021-05', 743, 'cheque', '', '743', 66, '2021-05-01', '2021-05-07', NULL),
(230, '19G', '2021-05', '19G2021-05', 743, 'auto', '', '743', 198, '2021-05-01', '2021-05-24', NULL),
(231, '19H', '2021-05', '19H2021-05', 932, 'cheque', '', '932', 148, '2021-05-01', '2021-05-20', NULL),
(232, '20A', '2021-05', '20A2021-05', 932, 'auto', '', '932', 199, '2021-05-01', '2021-05-24', NULL),
(233, '20B', '2021-05', '20B2021-05', 743, 'cash', '', '743', 44, '2021-05-01', '2021-05-07', NULL),
(234, '20C', '2021-05', '20C2021-05', 743, 'cheque', '', '743', 134, '2021-05-01', '2021-05-17', NULL),
(235, '20D', '2021-05', '20D2021-05', 932, 'cheque', '', '932', 90, '2021-05-01', '2021-05-07', NULL),
(236, '20E', '2021-05', '20E2021-05', 932, 'cheque', '', '932', 81, '2021-05-01', '2021-05-07', NULL),
(237, '20F', '2021-05', '20F2021-05', 743, 'cheque', '', '743', 131, '2021-05-01', '2021-05-17', NULL),
(238, '20G', '2021-05', '20G2021-05', 743, 'cheque', '', '743', 149, '2021-05-01', '2021-05-20', NULL),
(239, '20H', '2021-05', '20H2021-05', 932, 'cheque', '', '932', 129, '2021-05-01', '2021-05-17', NULL),
(240, '21A', '2021-05', '21A2021-05', 932, 'cash', '', '932', 41, '2021-05-01', '2021-05-07', NULL),
(241, '21B', '2021-05', '21B2021-05', 743, 'auto', '', '743', 200, '2021-05-01', '2021-05-24', NULL),
(242, '21C', '2021-05', '21C2021-05', 743, 'cheque', '', '743', 78, '2021-05-01', '2021-05-07', NULL),
(243, '21D', '2021-05', '21D2021-05', 932, 'cheque', '', '932', 162, '2021-05-01', '2021-05-28', NULL),
(244, '21E', '2021-05', '21E2021-05', 932, 'cheque', '', '932', 74, '2021-05-01', '2021-05-07', NULL),
(245, '21F', '2021-05', '21F2021-05', 743, 'cheque', '', '743', 128, '2021-05-01', '2021-05-17', NULL),
(246, '21G', '2021-05', '21G2021-05', 743, 'cheque', '', '743', 95, '2021-05-01', '2021-05-07', NULL),
(247, '21H', '2021-05', '21H2021-05', 932, 'auto', '', '932', 201, '2021-05-01', '2021-05-24', NULL),
(248, '22A', '2021-05', '22A2021-05', 932, 'cheque', '', '932', 126, '2021-05-01', '2021-05-11', NULL),
(249, '22B', '2021-05', '22B2021-05', 743, 'cheque', '', '743', 86, '2021-05-01', '2021-05-07', NULL),
(250, '22C', '2021-05', '22C2021-05', 743, 'auto', '', '743', 202, '2021-05-01', '2021-05-24', NULL),
(251, '22D', '2021-05', '22D2021-05', 932, 'cheque', '', '932', 89, '2021-05-01', '2021-05-07', NULL),
(252, '22E', '2021-05', '22E2021-05', 932, 'cheque', '', '932', 157, '2021-05-01', '2021-05-28', NULL),
(253, '22F', '2021-05', '22F2021-05', 743, 'cheque', '', '743', 153, '2021-05-01', '2021-05-24', NULL),
(254, '22G', '2021-05', '22G2021-05', 743, 'auto', '', '743', 203, '2021-05-01', '2021-05-24', NULL),
(255, '22H', '2021-05', '22H2021-05', 932, 'cheque', '', '932', 123, '2021-05-01', '2021-05-11', NULL),
(256, '23A', '2021-05', '23A2021-05', 932, 'cheque', '', '932', 161, '2021-05-01', '2021-05-28', NULL),
(257, '23B', '2021-05', '23B2021-05', 743, 'cheque', '', '743', 55, '2021-05-01', '2021-05-07', NULL),
(258, '23C', '2021-05', '23C2021-05', 743, 'cheque', '', '743', 97, '2021-05-01', '2021-05-07', NULL),
(259, '23D', '2021-05', '23D2021-05', 932, 'cheque', '', '932', 158, '2021-05-01', '2021-05-28', NULL),
(260, '23E', '2021-05', '23E2021-05', 932, 'auto', '', '932', 204, '2021-05-01', '2021-05-24', NULL),
(261, '23F', '2021-05', '23F2021-05', 743, 'cheque', '', '743', 163, '2021-05-01', '2021-05-07', NULL),
(262, '23G', '2021-05', '23G2021-05', 743, 'cheque', '', '743', 144, '2021-05-01', '2021-05-20', NULL),
(264, '24A', '2021-05', '24A2021-05', 932, 'cheque', '', '932', 130, '2021-05-01', '2021-05-17', NULL),
(265, '24B', '2021-05', '24B2021-05', 743, 'cheque', '', '743', 150, '2021-05-01', '2021-05-20', NULL),
(266, '24C', '2021-05', '24C2021-05', 743, 'cheque', '', '743', 528, '2021-05-01', '2021-07-21', NULL),
(267, '24D', '2021-05', '24D2021-05', 932, 'auto', '', '932', 205, '2021-05-01', '2021-05-24', NULL),
(268, '24E', '2021-05', '24E2021-05', 932, 'auto', '', '932', 206, '2021-05-01', '2021-05-24', NULL),
(269, '24F', '2021-05', '24F2021-05', 743, 'cheque', '', '743', 223, '2021-05-01', '2021-06-03', NULL),
(270, '24G', '2021-05', '24G2021-05', 743, 'cheque', '', '743', 112, '2021-05-01', '2021-05-11', NULL),
(271, '24H', '2021-05', '24H2021-05', 932, 'auto', '', '932', 207, '2021-05-01', '2021-05-24', NULL),
(272, '25A', '2021-05', '25A2021-05', 932, 'auto', '', '932', 208, '2021-05-01', '2021-05-24', NULL),
(274, '25C', '2021-05', '25C2021-05', 743, 'cheque', '', '743', 107, '2021-05-01', '2021-05-11', NULL),
(275, '25D', '2021-05', '25D2021-05', 932, 'auto', '', '932', 209, '2021-05-01', '2021-05-24', NULL),
(276, '25E', '2021-05', '25E2021-05', 932, 'cheque', '', '932', 79, '2021-05-01', '2021-05-07', NULL),
(277, '25F', '2021-05', '25F2021-05', 743, 'auto', '', '743', 210, '2021-05-01', '2021-05-24', NULL),
(278, '25G', '2021-05', '25G2021-05', 743, 'cheque', '', '743', 88, '2021-05-01', '2021-05-07', NULL),
(279, '25H', '2021-05', '25H2021-05', 932, 'cheque', '', '932', 56, '2021-05-01', '2021-05-07', NULL),
(280, 'SHOP01', '2021-05', 'SHOP012021-05', 774, 'cheque', '', '774', 254, '2021-05-01', '2021-06-07', NULL),
(283, 'SHOP04', '2021-05', 'SHOP042021-05', 679, 'cash', '', '679', 253, '2021-05-01', '2021-06-05', NULL),
(284, 'SHOP05', '2021-05', 'SHOP052021-05', 774, 'cash', '', '774', 35, '2021-05-01', '2021-05-03', NULL),
(285, 'SHOP06', '2021-05', 'SHOP062021-05', 443, 'cheque', '', '443', 54, '2021-05-01', '2021-05-07', NULL),
(286, 'SHOP07', '2021-05', 'SHOP072021-05', 379, 'cheque', '', '379', 96, '2021-05-01', '2021-05-07', NULL),
(287, 'SHOP08', '2021-05', 'SHOP082021-05', 443, 'auto', '', '443', 218, '2021-05-01', '2021-05-04', NULL),
(288, 'SHOP09', '2021-05', 'SHOP092021-05', 505, 'auto', '', '505', 219, '2021-05-01', '2021-05-04', NULL),
(289, 'SHOP10', '2021-05', 'SHOP102021-05', 853, 'cheque', '', '853', 260, '2021-05-01', '2021-06-07', NULL),
(290, 'SHOP11', '2021-05', 'SHOP112021-05', 1010, 'cheque', '', '1010', 117, '2021-05-01', '2021-05-11', NULL),
(291, 'SHOP12', '2021-05', 'SHOP122021-05', 836, 'cheque', '', '836', 307, '2021-05-01', '2021-06-15', NULL),
(292, 'SHOP13', '2021-05', 'SHOP132021-05', 695, 'cheque', '', '695', 108, '2021-05-01', '2021-05-11', NULL),
(335, '04H', '2021-07', '04H2021-07', 932, 'cheque', '', '932', 76, '2021-07-01', '2021-05-07', NULL),
(336, '04H', '2021-08', '04H2021-08', 932, 'cheque', '', '932', 76, '2021-08-01', '2021-05-07', NULL),
(337, '04H', '2021-06', '04H2021-06', 932, 'cheque', '', '932', 76, '2021-06-01', '2021-05-07', NULL),
(338, '02B', '2021-06', '02B2021-06', 743, 'cheque', '', '743', 143, '2021-06-01', '2021-05-20', NULL),
(339, '23G', '2021-06', '23G2021-06', 743, 'cheque', '', '743', 145, '2021-06-01', '2021-05-20', NULL),
(340, '10F', '2021-06', '10F2021-06', 743, 'auto', '', '743', 211, '2021-06-01', '2021-05-24', NULL),
(341, '12B', '2021-06', '12B2021-06', 743, 'auto', '', '743', 213, '2021-06-01', '2021-05-24', NULL),
(342, '02G', '2021-06', '02G2021-06', 743, 'auto', '', '743', 216, '2021-06-01', '2021-05-24', NULL),
(343, 'SHOP02', '2021-05', 'SHOP022021-05', 711, 'auto', '', '711', 217, '2021-05-01', '2021-05-24', NULL),
(344, '01A', '2021-06', '01A2021-06', 932, 'auto', '', '932', 353, '2021-06-01', '2021-06-21', NULL),
(345, '01B', '2021-06', '01B2021-06', 743, 'cheque', '', '743', 264, '2021-06-01', '2021-06-07', NULL),
(346, '01C', '2021-06', '01C2021-06', 743, 'cheque', '', '743', 288, '2021-06-01', '2021-06-15', NULL),
(347, '01D', '2021-06', '01D2021-06', 932, 'cash', '', '932', 257, '2021-06-01', '2021-06-05', NULL),
(348, '01E', '2021-06', '01E2021-06', 932, 'cheque', '', '932', 289, '2021-06-01', '2021-06-15', NULL),
(349, '01F', '2021-06', '01F2021-06', 743, 'auto', '', '743', 354, '2021-06-01', '2021-06-21', NULL),
(350, '01G', '2021-06', '01G2021-06', 743, 'auto', '', '743', 355, '2021-06-01', '2021-06-21', NULL),
(351, '01H', '2021-06', '01H2021-06', 932, 'auto', '', '932', 356, '2021-06-01', '2021-06-21', NULL),
(352, '02A', '2021-06', '02A2021-06', 932, 'cash', '', '932', 259, '2021-06-01', '2021-06-05', NULL),
(354, '02C', '2021-06', '02C2021-06', 743, 'cheque', '', '743', 220, '2021-06-01', '2021-06-03', NULL),
(355, '02D', '2021-06', '02D2021-06', 932, 'cash', '', '932', 226, '2021-06-01', '2021-06-03', NULL),
(356, '02E', '2021-06', '02E2021-06', 932, 'cheque', '', '932', 296, '2021-06-01', '2021-06-15', NULL),
(357, '02F', '2021-06', '02F2021-06', 743, 'cheque', '', '743', 248, '2021-06-01', '2021-06-07', NULL),
(360, '03A', '2021-06', '03A2021-06', 932, 'auto', '', '932', 357, '2021-06-01', '2021-06-21', NULL),
(361, '03B', '2021-06', '03B2021-06', 743, 'cheque', '', '743', 290, '2021-06-01', '2021-06-15', NULL),
(362, '03C', '2021-06', '03C2021-06', 743, 'cheque', '', '743', 276, '2021-06-01', '2021-06-07', NULL),
(363, '03D', '2021-06', '03D2021-06', 932, 'auto', '', '932', 358, '2021-06-01', '2021-06-21', NULL),
(364, '03E', '2021-06', '03E2021-06', 932, 'auto', '', '932', 359, '2021-06-01', '2021-06-21', NULL),
(365, '03F', '2021-06', '03F2021-06', 743, 'cheque', '', '743', 343, '2021-06-01', '2021-06-25', NULL),
(366, '03G', '2021-06', '03G2021-06', 743, 'cheque', '', '743', 338, '2021-06-01', '2021-06-22', NULL),
(367, '03H', '2021-06', '03H2021-06', 932, 'auto', '', '932', 360, '2021-06-01', '2021-06-21', NULL),
(368, '04A', '2021-06', '04A2021-06', 932, 'cheque', '', '932', 316, '2021-06-01', '2021-06-15', NULL),
(369, '04B', '2021-06', '04B2021-06', 743, 'cheque', '', '743', 238, '2021-06-01', '2021-06-03', NULL),
(370, '04C', '2021-06', '04C2021-06', 743, 'cheque', '', '743', 286, '2021-06-01', '2021-06-07', NULL),
(371, '04D', '2021-06', '04D2021-06', 932, 'cash', '', '932', 249, '2021-06-01', '2021-06-05', NULL),
(372, '04E', '2021-06', '04E2021-06', 932, 'cheque', '', '932', 231, '2021-06-01', '2021-06-03', NULL),
(373, '04F', '2021-06', '04F2021-06', 743, 'cheque', '', '743', 262, '2021-06-01', '2021-06-07', NULL),
(376, '05A', '2021-06', '05A2021-06', 932, 'cheque', '', '932', 336, '2021-06-01', '2021-06-22', NULL),
(377, '05B', '2021-06', '05B2021-06', 743, 'cheque', '', '743', 327, '2021-06-01', '2021-06-22', NULL),
(378, '05C', '2021-06', '05C2021-06', 743, 'cheque', '', '743', 242, '2021-06-01', '2021-06-07', NULL),
(379, '05D', '2021-06', '05D2021-06', 932, 'cheque', '', '932', 404, '2021-06-01', '2021-07-06', NULL),
(380, '05E', '2021-06', '05E2021-06', 932, 'cheque', '', '932', 308, '2021-06-01', '2021-06-15', NULL),
(381, '05F', '2021-06', '05F2021-06', 743, 'auto', '', '743', 361, '2021-06-01', '2021-06-21', NULL),
(382, '05G', '2021-06', '05G2021-06', 743, 'auto', '', '743', 362, '2021-06-01', '2021-06-21', NULL),
(383, '05H', '2021-06', '05H2021-06', 932, 'cheque', '', '932', 299, '2021-06-01', '2021-06-15', NULL),
(384, '06A', '2021-06', '06A2021-06', 932, 'cheque', '', '932', 256, '2021-06-01', '2021-06-07', NULL),
(385, '06B', '2021-06', '06B2021-06', 743, 'cheque', '', '743', 318, '2021-06-01', '2021-06-15', NULL),
(386, '06C', '2021-06', '06C2021-06', 743, 'cheque', '', '743', 225, '2021-06-01', '2021-06-03', NULL),
(387, '06D', '2021-06', '06D2021-06', 932, 'cheque', '', '932', 261, '2021-06-01', '2021-06-07', NULL),
(388, '06E', '2021-06', '06E2021-06', 932, 'auto', '', '932', 363, '2021-06-01', '2021-06-21', NULL),
(389, '06F', '2021-06', '06F2021-06', 743, 'cheque', '', '743', 232, '2021-06-01', '2021-06-03', NULL),
(390, '06G', '2021-06', '06G2021-06', 743, 'cheque', '', '743', 303, '2021-06-01', '2021-06-15', NULL),
(391, '06H', '2021-06', '06H2021-06', 932, 'cheque', '', '932', 252, '2021-06-01', '2021-06-07', NULL),
(392, '07A', '2021-06', '07A2021-06', 932, 'cheque', '', '932', 323, '2021-06-01', '2021-06-15', NULL),
(394, '07C', '2021-06', '07C2021-06', 743, 'cheque', '', '743', 244, '2021-06-01', '2021-06-07', NULL),
(395, '07D', '2021-06', '07D2021-06', 932, 'auto', '', '932', 364, '2021-06-01', '2021-06-21', NULL),
(396, '07E', '2021-06', '07E2021-06', 932, 'cheque', '', '932', 271, '2021-06-01', '2021-06-07', NULL),
(397, '07F', '2021-06', '07F2021-06', 743, 'auto', '', '743', 365, '2021-06-01', '2021-06-21', NULL),
(398, '07G', '2021-06', '07G2021-06', 743, 'cheque', '', '743', 319, '2021-06-01', '2021-06-15', NULL),
(399, '07H', '2021-06', '07H2021-06', 932, 'cheque', '', '932', 480, '2021-06-01', '2021-07-12', NULL),
(400, '08A', '2021-06', '08A2021-06', 932, 'cheque', '', '932', 828, '2021-06-01', '2021-09-02', NULL),
(401, '08B', '2021-06', '08B2021-06', 743, 'auto', '', '743', 366, '2021-06-01', '2021-06-21', NULL),
(402, '08C', '2021-06', '08C2021-06', 743, 'cheque', '', '743', 311, '2021-06-01', '2021-06-15', NULL),
(403, '08D', '2021-06', '08D2021-06', 932, 'auto', '', '932', 367, '2021-06-01', '2021-06-21', NULL),
(404, '08E', '2021-06', '08E2021-06', 932, 'cheque', '', '932', 239, '2021-06-01', '2021-06-03', NULL),
(405, '08F', '2021-06', '08F2021-06', 743, 'cheque', '', '743', 340, '2021-06-01', '2021-06-25', NULL),
(406, '08G', '2021-06', '08G2021-06', 743, 'cheque', '', '743', 333, '2021-06-01', '2021-06-22', NULL),
(407, '08H', '2021-06', '08H2021-06', 932, 'cash', '', '932', 339, '2021-06-01', '2021-06-22', NULL),
(408, '09A', '2021-06', '09A2021-06', 932, 'cheque', '', '932', 453, '2021-06-01', '2021-07-06', NULL),
(409, '09B', '2021-06', '09B2021-06', 743, 'auto', '', '743', 368, '2021-06-01', '2021-06-21', NULL),
(410, '09C', '2021-06', '09C2021-06', 743, 'cheque', '', '743', 240, '2021-06-01', '2021-06-03', NULL),
(411, '09D', '2021-06', '09D2021-06', 932, 'cheque', '', '932', 349, '2021-06-01', '2021-06-30', NULL),
(412, '09E', '2021-06', '09E2021-06', 932, 'cheque', '', '932', 324, '2021-06-01', '2021-06-22', NULL),
(413, '09F', '2021-06', '09F2021-06', 743, 'auto', '', '743', 369, '2021-06-01', '2021-06-21', NULL),
(414, '09G', '2021-06', '09G2021-06', 743, 'cheque', '', '743', 236, '2021-06-01', '2021-06-03', NULL),
(415, '09H', '2021-06', '09H2021-06', 932, 'cheque', '', '932', 320, '2021-06-01', '2021-06-15', NULL),
(416, '10A', '2021-06', '10A2021-06', 932, 'cheque', '', '932', 282, '2021-06-01', '2021-06-07', NULL),
(417, '10B', '2021-06', '10B2021-06', 743, 'cheque', '', '743', 230, '2021-06-01', '2021-06-03', NULL),
(418, '10C', '2021-06', '10C2021-06', 743, 'auto', '', '743', 370, '2021-06-01', '2021-06-21', NULL),
(419, '10D', '2021-06', '10D2021-06', 932, 'cheque', '', '932', 235, '2021-06-01', '2021-06-03', NULL),
(420, '10E', '2021-06', '10E2021-06', 932, 'cheque', '', '932', 279, '2021-06-01', '2021-06-07', NULL),
(422, '10G', '2021-06', '10G2021-06', 743, 'cash', '', '743', 509, '2021-06-01', '2021-07-19', NULL),
(423, '10H', '2021-06', '10H2021-06', 932, 'cheque', '', '932', 526, '2021-06-01', '2021-07-21', NULL),
(424, '11A', '2021-06', '11A2021-06', 932, 'cheque', '', '932', 228, '2021-06-01', '2021-06-03', NULL),
(426, '11C', '2021-06', '11C2021-06', 743, 'cheque', '', '743', 229, '2021-06-01', '2021-06-03', NULL),
(427, '11D', '2021-06', '11D2021-06', 932, 'cheque', '', '932', 265, '2021-06-01', '2021-06-07', NULL),
(428, '11E', '2021-06', '11E2021-06', 932, 'auto', '', '932', 371, '2021-06-01', '2021-06-21', NULL),
(429, '11F', '2021-06', '11F2021-06', 743, 'cheque', '', '743', 467, '2021-06-01', '2021-07-06', NULL),
(430, '11G', '2021-06', '11G2021-06', 743, 'cheque', '', '743', 470, '2021-06-01', '2021-07-06', NULL),
(431, '11H', '2021-06', '11H2021-06', 932, 'auto', '', '932', 372, '2021-06-01', '2021-06-21', NULL),
(432, '12A', '2021-06', '12A2021-06', 932, 'cheque', '', '932', 277, '2021-06-01', '2021-06-07', NULL),
(434, '12C', '2021-06', '12C2021-06', 743, 'cheque', '', '743', 905, '2021-06-01', '2021-09-20', NULL),
(435, '12D', '2021-06', '12D2021-06', 932, 'auto', '', '932', 373, '2021-06-01', '2021-06-21', NULL),
(436, '12E', '2021-06', '12E2021-06', 932, 'cheque', '', '932', 350, '2021-06-01', '2021-06-30', NULL),
(437, '12F', '2021-06', '12F2021-06', 743, 'auto', '', '743', 374, '2021-06-01', '2021-06-21', NULL),
(438, '12G', '2021-06', '12G2021-06', 743, 'cheque', '', '743', 297, '2021-06-01', '2021-06-15', NULL),
(439, '12H', '2021-06', '12H2021-06', 932, 'auto', '', '932', 375, '2021-06-01', '2021-06-21', NULL),
(441, '13B', '2021-06', '13B2021-06', 743, 'auto', '', '743', 376, '2021-06-01', '2021-06-21', NULL),
(442, '13C', '2021-06', '13C2021-06', 743, 'cheque', '', '743', 331, '2021-06-01', '2021-06-22', NULL),
(443, '13D', '2021-06', '13D2021-06', 932, 'cheque', '', '932', 304, '2021-06-01', '2021-06-15', NULL),
(444, '13E', '2021-06', '13E2021-06', 932, 'cheque', '', '932', 408, '2021-06-01', '2021-07-06', NULL),
(445, '13F', '2021-06', '13F2021-06', 743, 'cheque', '', '743', 278, '2021-06-01', '2021-06-07', NULL),
(446, '13G', '2021-06', '13G2021-06', 743, 'cheque', '', '743', 516, '2021-06-01', '2021-07-19', NULL),
(447, '13H', '2021-06', '13H2021-06', 932, 'cheque', '', '932', 298, '2021-06-01', '2021-06-15', NULL),
(448, '14A', '2021-06', '14A2021-06', 932, 'cheque', '', '932', 272, '2021-06-01', '2021-06-07', NULL),
(449, '14B', '2021-06', '14B2021-06', 743, 'cheque', '', '743', 321, '2021-06-01', '2021-06-15', NULL),
(450, '14C', '2021-06', '14C2021-06', 743, 'cheque', '', '743', 337, '2021-06-01', '2021-06-22', NULL),
(451, '14D', '2021-06', '14D2021-06', 932, 'cheque', '', '932', 312, '2021-06-01', '2021-06-15', NULL),
(452, '14E', '2021-06', '14E2021-06', 932, 'cheque', '', '932', 322, '2021-06-01', '2021-06-15', NULL),
(453, '14F', '2021-06', '14F2021-06', 743, 'auto', '', '743', 377, '2021-06-01', '2021-06-21', NULL),
(454, '14G', '2021-06', '14G2021-06', 743, 'auto', '', '743', 378, '2021-06-01', '2021-06-21', NULL),
(455, '14H', '2021-06', '14H2021-06', 932, 'cheque', '', '932', 352, '2021-06-01', '2021-06-30', NULL),
(456, '15A', '2021-06', '15A2021-06', 932, 'cheque', '', '932', 284, '2021-06-01', '2021-06-07', NULL),
(457, '15B', '2021-06', '15B2021-06', 743, 'cheque', '', '743', 268, '2021-06-01', '2021-06-07', NULL),
(458, '15C', '2021-06', '15C2021-06', 743, 'cheque', '', '743', 305, '2021-06-01', '2021-06-15', NULL),
(459, '15D', '2021-06', '15D2021-06', 932, 'cheque', '', '932', 246, '2021-06-01', '2021-06-07', NULL),
(460, '15E', '2021-06', '15E2021-06', 932, 'cheque', '', '932', 285, '2021-06-01', '2021-06-07', NULL),
(461, '15F', '2021-06', '15F2021-06', 743, 'cheque', '', '743', 345, '2021-06-01', '2021-06-25', NULL),
(462, '15G', '2021-06', '15G2021-06', 743, 'auto', '', '743', 379, '2021-06-01', '2021-06-21', NULL),
(463, '15H', '2021-06', '15H2021-06', 932, 'auto', '', '932', 380, '2021-06-01', '2021-06-21', NULL),
(464, '16A', '2021-06', '16A2021-06', 932, 'cheque', '', '932', 517, '2021-06-01', '2021-07-19', NULL),
(466, '16C', '2021-06', '16C2021-06', 743, 'auto', '', '743', 381, '2021-06-01', '2021-06-21', NULL),
(467, '16D', '2021-06', '16D2021-06', 932, 'auto', '', '932', 382, '2021-06-01', '2021-06-21', NULL),
(468, '16E', '2021-06', '16E2021-06', 932, 'auto', '', '932', 383, '2021-06-01', '2021-06-21', NULL),
(469, '16F', '2021-06', '16F2021-06', 743, 'auto', '', '743', 384, '2021-06-01', '2021-06-21', NULL),
(470, '16G', '2021-06', '16G2021-06', 743, 'cheque', '', '743', 237, '2021-06-01', '2021-06-03', NULL),
(471, '16H', '2021-06', '16H2021-06', 932, 'cheque', '', '932', 342, '2021-06-01', '2021-06-25', NULL),
(472, '17A', '2021-06', '17A2021-06', 932, 'cheque', '', '932', 291, '2021-06-01', '2021-06-15', NULL),
(473, '17B', '2021-06', '17B2021-06', 743, 'cheque', '', '743', 317, '2021-06-01', '2021-06-15', NULL),
(474, '17C', '2021-06', '17C2021-06', 743, 'cheque', '', '743', 309, '2021-06-01', '2021-06-15', NULL),
(475, '17D', '2021-06', '17D2021-06', 932, 'cheque', '', '932', 274, '2021-06-01', '2021-06-07', NULL),
(476, '17E', '2021-06', '17E2021-06', 932, 'cheque', '', '932', 263, '2021-06-01', '2021-06-07', NULL),
(477, '17F', '2021-06', '17F2021-06', 743, 'auto', '', '743', 385, '2021-06-01', '2021-06-21', NULL),
(478, '17G', '2021-06', '17G2021-06', 743, 'cheque', '', '743', 306, '2021-06-01', '2021-06-15', NULL),
(479, '17H', '2021-06', '17H2021-06', 932, 'cheque', '', '932', 292, '2021-06-01', '2021-06-15', NULL),
(481, '18B', '2021-06', '18B2021-06', 743, 'cheque', '', '743', 302, '2021-06-01', '2021-06-15', NULL),
(482, '18C', '2021-06', '18C2021-06', 743, 'cheque', '', '743', 301, '2021-06-01', '2021-06-15', NULL),
(483, '18D', '2021-06', '18D2021-06', 932, 'cheque', '', '932', 332, '2021-06-01', '2021-06-22', NULL),
(484, '18E', '2021-06', '18E2021-06', 932, 'cheque', '', '932', 483, '2021-06-01', '2021-07-12', NULL),
(486, '18G', '2021-06', '18G2021-06', 743, 'auto', '', '743', 386, '2021-06-01', '2021-06-21', NULL),
(487, '18H', '2021-06', '18H2021-06', 932, 'cheque', '', '932', 507, '2021-06-01', '2021-07-12', NULL),
(488, '19A', '2021-06', '19A2021-06', 932, 'cheque', '', '932', 273, '2021-06-01', '2021-06-07', NULL),
(489, '19B', '2021-06', '19B2021-06', 743, 'cheque', '', '743', 243, '2021-06-01', '2021-06-07', NULL),
(490, '19C', '2021-06', '19C2021-06', 743, 'cash', '', '743', 245, '2021-06-01', '2021-06-05', NULL),
(491, '19D', '2021-06', '19D2021-06', 932, 'cheque', '', '932', 250, '2021-06-01', '2021-06-07', NULL),
(492, '19E', '2021-06', '19E2021-06', 932, 'cheque', '', '932', 275, '2021-06-01', '2021-06-07', NULL),
(493, '19F', '2021-06', '19F2021-06', 743, 'cheque', '', '743', 266, '2021-06-01', '2021-06-07', NULL),
(494, '19G', '2021-06', '19G2021-06', 743, 'auto', '', '743', 387, '2021-06-01', '2021-06-21', NULL),
(495, '19H', '2021-06', '19H2021-06', 932, 'cash', '', '932', 334, '2021-06-01', '2021-06-22', NULL),
(496, '20A', '2021-06', '20A2021-06', 932, 'auto', '', '932', 388, '2021-06-01', '2021-06-21', NULL),
(497, '20B', '2021-06', '20B2021-06', 743, 'cheque', '', '743', 251, '2021-06-01', '2021-06-07', NULL),
(498, '20C', '2021-06', '20C2021-06', 743, 'cheque', '', '743', 313, '2021-06-01', '2021-06-15', NULL),
(499, '20D', '2021-06', '20D2021-06', 932, 'cheque', '', '932', 247, '2021-06-01', '2021-06-07', NULL),
(500, '20E', '2021-06', '20E2021-06', 932, 'cheque', '', '932', 280, '2021-06-01', '2021-06-07', NULL),
(501, '20F', '2021-06', '20F2021-06', 743, 'cheque', '', '743', 407, '2021-06-01', '2021-07-06', NULL),
(502, '20G', '2021-06', '20G2021-06', 743, 'cheque', '', '743', 330, '2021-06-01', '2021-06-22', NULL),
(503, '20H', '2021-06', '20H2021-06', 932, 'cheque', '', '932', 283, '2021-06-01', '2021-06-07', NULL),
(504, '21A', '2021-06', '21A2021-06', 932, 'cheque', '', '932', 227, '2021-06-01', '2021-06-03', NULL),
(505, '21B', '2021-06', '21B2021-06', 743, 'auto', '', '743', 389, '2021-06-01', '2021-06-21', NULL),
(506, '21C', '2021-06', '21C2021-06', 743, 'cheque', '', '743', 267, '2021-06-01', '2021-06-07', NULL),
(507, '21D', '2021-06', '21D2021-06', 932, 'cheque', '', '932', 403, '2021-06-01', '2021-07-06', NULL),
(508, '21E', '2021-06', '21E2021-06', 932, 'cheque', '', '932', 269, '2021-06-01', '2021-06-07', NULL),
(509, '21F', '2021-06', '21F2021-06', 743, 'cheque', '', '743', 335, '2021-06-01', '2021-06-22', NULL),
(510, '21G', '2021-06', '21G2021-06', 743, 'cheque', '', '743', 300, '2021-06-01', '2021-06-15', NULL),
(511, '21H', '2021-06', '21H2021-06', 932, 'auto', '', '932', 390, '2021-06-01', '2021-06-21', NULL),
(512, '22A', '2021-06', '22A2021-06', 932, 'cheque', '', '932', 310, '2021-06-01', '2021-06-15', NULL),
(513, '22B', '2021-06', '22B2021-06', 743, 'cheque', '', '743', 270, '2021-06-01', '2021-06-07', NULL),
(514, '22C', '2021-06', '22C2021-06', 743, 'auto', '', '743', 391, '2021-06-01', '2021-06-21', NULL),
(515, '22D', '2021-06', '22D2021-06', 932, 'cheque', '', '932', 233, '2021-06-01', '2021-06-03', NULL),
(516, '22E', '2021-06', '22E2021-06', 932, 'cheque', '', '932', 328, '2021-06-01', '2021-06-22', NULL),
(517, '22F', '2021-06', '22F2021-06', 743, 'cheque', '', '743', 495, '2021-06-01', '2021-07-12', NULL),
(518, '22G', '2021-06', '22G2021-06', 743, 'auto', '', '743', 392, '2021-06-01', '2021-06-21', NULL),
(519, '22H', '2021-06', '22H2021-06', 932, 'cheque', '', '932', 293, '2021-06-01', '2021-06-15', NULL),
(520, '23A', '2021-06', '23A2021-06', 932, 'cheque', '', '932', 344, '2021-06-01', '2021-06-25', NULL),
(521, '23B', '2021-06', '23B2021-06', 743, 'cheque', '', '743', 294, '2021-06-01', '2021-06-15', NULL),
(522, '23C', '2021-06', '23C2021-06', 743, 'cash', '', '743', 295, '2021-06-01', '2021-06-15', NULL),
(523, '23D', '2021-06', '23D2021-06', 932, 'cheque', '', '932', 329, '2021-06-01', '2021-06-22', NULL),
(524, '23E', '2021-06', '23E2021-06', 932, 'auto', '', '932', 393, '2021-06-01', '2021-06-21', NULL),
(525, '23F', '2021-06', '23F2021-06', 743, 'cheque', '', '743', 325, '2021-06-01', '2021-06-22', NULL),
(528, '24A', '2021-06', '24A2021-06', 932, 'cheque', '', '932', 351, '2021-06-01', '2021-06-30', NULL),
(529, '24B', '2021-06', '24B2021-06', 743, 'cheque', '', '743', 314, '2021-06-01', '2021-06-15', NULL),
(530, '24C', '2021-06', '24C2021-06', 743, 'cheque', '', '743', 528, '2021-06-01', '2021-07-21', NULL),
(531, '24D', '2021-06', '24D2021-06', 932, 'auto', '', '932', 394, '2021-06-01', '2021-06-21', NULL),
(532, '24E', '2021-06', '24E2021-06', 932, 'auto', '', '932', 395, '2021-06-01', '2021-06-21', NULL),
(533, '24F', '2021-06', '24F2021-06', 743, 'cheque', '', '743', 341, '2021-06-01', '2021-06-25', NULL),
(534, '24G', '2021-06', '24G2021-06', 743, 'cheque', '', '743', 224, '2021-06-01', '2021-06-03', NULL),
(535, '24H', '2021-06', '24H2021-06', 932, 'auto', '', '932', 396, '2021-06-01', '2021-06-21', NULL),
(536, '25A', '2021-06', '25A2021-06', 932, 'auto', '', '932', 397, '2021-06-01', '2021-06-21', NULL),
(538, '25C', '2021-06', '25C2021-06', 743, 'cheque', '', '743', 326, '2021-06-01', '2021-06-22', NULL),
(539, '25D', '2021-06', '25D2021-06', 932, 'auto', '', '932', 398, '2021-06-01', '2021-06-21', NULL),
(540, '25E', '2021-06', '25E2021-06', 932, 'cheque', '', '932', 255, '2021-06-01', '2021-06-07', NULL),
(541, '25F', '2021-06', '25F2021-06', 743, 'auto', '', '743', 399, '2021-06-01', '2021-06-21', NULL),
(542, '25G', '2021-06', '25G2021-06', 743, 'cheque', '', '743', 287, '2021-06-01', '2021-06-07', NULL),
(543, '25H', '2021-06', '25H2021-06', 932, 'cheque', '', '932', 241, '2021-06-01', '2021-06-03', NULL),
(544, 'SHOP01', '2021-06', 'SHOP012021-06', 774, 'cheque', '', '774', 406, '2021-06-01', '2021-07-06', NULL),
(545, 'SHOP02', '2021-06', 'SHOP022021-06', 711, 'auto', '', '711', 401, '2021-06-01', '2021-06-21', NULL),
(547, 'SHOP04', '2021-06', 'SHOP042021-06', 679, 'cash', '', '679', 253, '2021-06-01', '2021-06-05', NULL),
(548, 'SHOP05', '2021-06', 'SHOP052021-06', 774, 'cheque', '', '774', 234, '2021-06-01', '2021-06-03', NULL),
(549, 'SHOP06', '2021-06', 'SHOP062021-06', 443, 'cheque', '', '443', 258, '2021-06-01', '2021-06-07', NULL),
(550, 'SHOP07', '2021-06', 'SHOP072021-06', 379, 'cheque', '', '379', 315, '2021-06-01', '2021-06-15', NULL),
(551, 'SHOP08', '2021-06', 'SHOP082021-06', 443, 'auto', '', '443', 600, '2021-06-01', '2021-06-01', NULL),
(552, 'SHOP09', '2021-06', 'SHOP092021-06', 505, 'auto', '', '505', 601, '2021-06-01', '2021-06-01', NULL),
(553, 'SHOP10', '2021-06', 'SHOP102021-06', 853, 'cheque', '', '853', 260, '2021-06-01', '2021-06-07', NULL),
(554, 'SHOP11', '2021-06', 'SHOP112021-06', 1010, 'cheque', '', '1010', 281, '2021-06-01', '2021-06-07', NULL),
(555, 'SHOP12', '2021-06', 'SHOP122021-06', 836, 'cheque', '', '836', 307, '2021-06-01', '2021-06-15', NULL),
(556, 'SHOP13', '2021-06', 'SHOP132021-06', 695, 'cheque', '', '695', 478, '2021-06-01', '2021-07-12', NULL),
(599, '16H', '2021-07', '16H2021-07', 932, 'cheque', '', '932', 342, '2021-07-01', '2021-06-25', NULL),
(600, '02G', '2021-07', '02G2021-07', 743, 'auto', '', '743', 400, '2021-07-01', '2021-06-21', NULL),
(601, '01A', '2021-07', '01A2021-07', 932, 'auto', '', '932', 550, '2021-07-01', '2021-07-16', NULL),
(602, '01B', '2021-07', '01B2021-07', 743, 'cheque', '', '743', 459, '2021-07-01', '2021-07-06', NULL),
(603, '01C', '2021-07', '01C2021-07', 743, 'cheque', '', '743', 473, '2021-07-01', '2021-07-06', NULL),
(604, '01D', '2021-07', '01D2021-07', 932, 'cash', '', '932', 411, '2021-07-01', '2021-07-06', NULL),
(605, '01E', '2021-07', '01E2021-07', 932, 'cheque', '', '932', 460, '2021-07-01', '2021-07-06', NULL),
(606, '01F', '2021-07', '01F2021-07', 743, 'auto', '', '743', 551, '2021-07-01', '2021-07-16', NULL);
INSERT INTO `Total` (`ID`, `Unit`, `ManageFeeDate`, `DCode`, `Amount`, `Method`, `BCQ`, `Paid`, `RCode`, `DemandDate`, `ReceivedDate`, `BankInDate`) VALUES
(607, '01G', '2021-07', '01G2021-07', 743, 'auto', '', '743', 552, '2021-07-01', '2021-07-16', NULL),
(608, '01H', '2021-07', '01H2021-07', 932, 'auto', '', '932', 553, '2021-07-01', '2021-07-16', NULL),
(609, '02A', '2021-07', '02A2021-07', 932, 'cash', '', '932', 493, '2021-07-01', '2021-07-12', NULL),
(610, '02B', '2021-07', '02B2021-07', 743, 'cheque', '', '743', 935, '2021-07-01', '2021-09-27', NULL),
(611, '02C', '2021-07', '02C2021-07', 743, 'cheque', '', '743', 415, '2021-07-01', '2021-07-06', NULL),
(612, '02D', '2021-07', '02D2021-07', 932, 'cash', '', '932', 416, '2021-07-01', '2021-07-06', NULL),
(613, '02E', '2021-07', '02E2021-07', 932, 'cheque', '', '932', 479, '2021-07-01', '2021-07-12', NULL),
(614, '02F', '2021-07', '02F2021-07', 743, 'cheque', '', '743', 433, '2021-07-01', '2021-07-06', NULL),
(616, '02H', '2021-07', '02H2021-07', 932, 'cheque', '', '932', 417, '2021-07-01', '2021-07-06', NULL),
(617, '03A', '2021-07', '03A2021-07', 932, 'auto', '', '932', 554, '2021-07-01', '2021-07-16', NULL),
(618, '03B', '2021-07', '03B2021-07', 743, 'cheque', '', '743', 702, '2021-07-01', '2021-08-13', NULL),
(619, '03C', '2021-07', '03C2021-07', 743, 'cheque', '', '743', 455, '2021-07-01', '2021-07-06', NULL),
(620, '03D', '2021-07', '03D2021-07', 932, 'auto', '', '932', 555, '2021-07-01', '2021-07-16', NULL),
(621, '03E', '2021-07', '03E2021-07', 932, 'auto', '', '932', 556, '2021-07-01', '2021-07-16', NULL),
(622, '03F', '2021-07', '03F2021-07', 743, 'cheque', '', '743', 534, '2021-07-01', '2021-07-21', NULL),
(623, '03G', '2021-07', '03G2021-07', 743, 'cheque', '', '743', 683, '2021-07-01', '2021-08-06', NULL),
(624, '03H', '2021-07', '03H2021-07', 932, 'auto', '', '932', 557, '2021-07-01', '2021-07-16', NULL),
(625, '04A', '2021-07', '04A2021-07', 932, 'cheque', '', '932', 523, '2021-07-01', '2021-07-19', NULL),
(626, '04B', '2021-07', '04B2021-07', 743, 'cheque', '', '743', 462, '2021-07-01', '2021-07-06', NULL),
(627, '04C', '2021-07', '04C2021-07', 743, 'cheque', '', '743', 440, '2021-07-01', '2021-07-06', NULL),
(628, '04D', '2021-07', '04D2021-07', 932, 'cash', '', '932', 438, '2021-07-01', '2021-07-06', NULL),
(629, '04E', '2021-07', '04E2021-07', 932, 'cheque', '', '932', 444, '2021-07-01', '2021-07-06', NULL),
(630, '04F', '2021-07', '04F2021-07', 743, 'cheque', '', '743', 409, '2021-07-01', '2021-07-06', NULL),
(631, '04G', '2021-07', '04G2021-07', 743, 'cheque', '', '743', 512, '2021-07-01', '2021-07-19', NULL),
(633, '05A', '2021-07', '05A2021-07', 932, 'cheque', '', '932', 540, '2021-07-01', '2021-07-21', NULL),
(634, '05B', '2021-07', '05B2021-07', 743, 'cheque', '', '743', 522, '2021-07-01', '2021-07-19', NULL),
(635, '05C', '2021-07', '05C2021-07', 743, 'cheque', '', '743', 439, '2021-07-01', '2021-07-06', NULL),
(636, '05D', '2021-07', '05D2021-07', 932, 'cheque', '', '932', 712, '2021-07-01', '2021-08-16', NULL),
(637, '05E', '2021-07', '05E2021-07', 932, 'cheque', '', '932', 505, '2021-07-01', '2021-07-12', NULL),
(638, '05F', '2021-07', '05F2021-07', 743, 'auto', '', '743', 558, '2021-07-01', '2021-07-16', NULL),
(639, '05G', '2021-07', '05G2021-07', 743, 'auto', '', '743', 559, '2021-07-01', '2021-07-16', NULL),
(640, '05H', '2021-07', '05H2021-07', 932, 'cheque', '', '932', 496, '2021-07-01', '2021-07-12', NULL),
(641, '06A', '2021-07', '06A2021-07', 932, 'cheque', '', '932', 448, '2021-07-01', '2021-07-06', NULL),
(642, '06B', '2021-07', '06B2021-07', 743, 'cheque', '', '743', 504, '2021-07-01', '2021-07-12', NULL),
(643, '06C', '2021-07', '06C2021-07', 743, 'cheque', '', '743', 426, '2021-07-01', '2021-07-06', NULL),
(644, '06D', '2021-07', '06D2021-07', 932, 'cheque', '', '932', 429, '2021-07-01', '2021-07-06', NULL),
(645, '06E', '2021-07', '06E2021-07', 932, 'auto', '', '932', 560, '2021-07-01', '2021-07-16', NULL),
(646, '06F', '2021-07', '06F2021-07', 743, 'cheque', '', '743', 434, '2021-07-01', '2021-07-06', NULL),
(647, '06G', '2021-07', '06G2021-07', 743, 'cheque', '', '743', 469, '2021-07-01', '2021-07-06', NULL),
(648, '06H', '2021-07', '06H2021-07', 932, 'cheque', '', '932', 431, '2021-07-01', '2021-07-06', NULL),
(649, '07A', '2021-07', '07A2021-07', 932, 'cheque', '', '932', 529, '2021-07-01', '2021-07-21', NULL),
(651, '07C', '2021-07', '07C2021-07', 743, 'cheque', '', '743', 423, '2021-07-01', '2021-07-06', NULL),
(652, '07D', '2021-07', '07D2021-07', 932, 'auto', '', '932', 561, '2021-07-01', '2021-07-16', NULL),
(653, '07E', '2021-07', '07E2021-07', 932, 'cheque', '', '932', 456, '2021-07-01', '2021-07-06', NULL),
(654, '07F', '2021-07', '07F2021-07', 743, 'auto', '', '743', 562, '2021-07-01', '2021-07-16', NULL),
(655, '07G', '2021-07', '07G2021-07', 743, 'cheque', '', '743', 452, '2021-07-01', '2021-07-06', NULL),
(656, '07H', '2021-07', '07H2021-07', 932, 'cheque', '', '932', 480, '2021-07-01', '2021-07-12', NULL),
(657, '08A', '2021-07', '08A2021-07', 932, 'cheque', '', '932', 828, '2021-07-01', '2021-09-02', NULL),
(658, '08B', '2021-07', '08B2021-07', 743, 'auto', '', '743', 563, '2021-07-01', '2021-07-16', NULL),
(659, '08C', '2021-07', '08C2021-07', 743, 'cheque', '', '743', 497, '2021-07-01', '2021-07-12', NULL),
(660, '08D', '2021-07', '08D2021-07', 932, 'auto', '', '932', 564, '2021-07-01', '2021-07-16', NULL),
(661, '08E', '2021-07', '08E2021-07', 932, 'cheque', '', '932', 441, '2021-07-01', '2021-07-06', NULL),
(662, '08F', '2021-07', '08F2021-07', 743, 'cheque', '', '743', 705, '2021-07-01', '2021-08-13', NULL),
(663, '08G', '2021-07', '08G2021-07', 743, 'cheque', '', '743', 542, '2021-07-01', '2021-07-26', NULL),
(664, '08H', '2021-07', '08H2021-07', 932, 'cash', '', '932', 537, '2021-07-01', '2021-07-21', NULL),
(665, '09A', '2021-07', '09A2021-07', 932, 'cheque', '', '932', 453, '2021-07-01', '2021-07-06', NULL),
(666, '09B', '2021-07', '09B2021-07', 743, 'auto', '', '743', 565, '2021-07-01', '2021-07-16', NULL),
(667, '09C', '2021-07', '09C2021-07', 743, 'cheque', '', '743', 427, '2021-07-01', '2021-07-06', NULL),
(668, '09D', '2021-07', '09D2021-07', 932, 'cheque', '', '932', 543, '2021-07-01', '2021-07-27', NULL),
(669, '09E', '2021-07', '09E2021-07', 932, 'cheque', '', '932', 474, '2021-07-01', '2021-07-06', NULL),
(670, '09F', '2021-07', '09F2021-07', 743, 'auto', '', '743', 566, '2021-07-01', '2021-07-16', NULL),
(671, '09G', '2021-07', '09G2021-07', 743, 'cheque', '', '743', 436, '2021-07-01', '2021-07-06', NULL),
(672, '09H', '2021-07', '09H2021-07', 932, 'cheque', '', '932', 531, '2021-07-01', '2021-07-21', NULL),
(673, '10A', '2021-07', '10A2021-07', 932, 'cheque', '', '932', 405, '2021-07-01', '2021-07-06', NULL),
(674, '10B', '2021-07', '10B2021-07', 743, 'cheque', '', '743', 410, '2021-07-01', '2021-07-06', NULL),
(675, '10C', '2021-07', '10C2021-07', 743, 'auto', '', '743', 567, '2021-07-01', '2021-07-16', NULL),
(676, '10D', '2021-07', '10D2021-07', 932, 'cheque', '', '932', 430, '2021-07-01', '2021-07-06', NULL),
(677, '10E', '2021-07', '10E2021-07', 932, 'cheque', '', '932', 447, '2021-07-01', '2021-07-06', NULL),
(678, '10F', '2021-07', '10F2021-07', 743, 'auto', '', '743', 568, '2021-07-01', '2021-07-16', NULL),
(679, '10G', '2021-07', '10G2021-07', 743, 'cheque', '', '743', 895, '2021-07-01', '2021-09-13', NULL),
(680, '10H', '2021-07', '10H2021-07', 932, 'cheque', '', '932', 526, '2021-07-01', '2021-07-21', NULL),
(681, '11A', '2021-07', '11A2021-07', 932, 'cheque', '', '932', 424, '2021-07-01', '2021-07-06', NULL),
(682, '11B', '2021-07', '11B2021-07', 743, 'cheque', '', '743', 476, '2021-07-01', '2021-07-06', NULL),
(683, '11C', '2021-07', '11C2021-07', 743, 'cheque', '', '743', 437, '2021-07-01', '2021-07-06', NULL),
(684, '11D', '2021-07', '11D2021-07', 932, 'cheque', '', '932', 449, '2021-07-01', '2021-07-06', NULL),
(685, '11E', '2021-07', '11E2021-07', 932, 'auto', '', '932', 569, '2021-07-01', '2021-07-16', NULL),
(686, '11F', '2021-07', '11F2021-07', 743, 'cheque', '', '743', 467, '2021-07-01', '2021-07-06', NULL),
(687, '11G', '2021-07', '11G2021-07', 743, 'cheque', '', '743', 470, '2021-07-01', '2021-07-06', NULL),
(688, '11H', '2021-07', '11H2021-07', 932, 'auto', '', '932', 570, '2021-07-01', '2021-07-16', NULL),
(689, '12A', '2021-07', '12A2021-07', 932, 'cheque', '', '932', 446, '2021-07-01', '2021-07-06', NULL),
(690, '12B', '2021-07', '12B2021-07', 743, 'auto', '', '743', 571, '2021-07-01', '2021-07-16', NULL),
(691, '12C', '2021-07', '12C2021-07', 743, 'cheque', '', '743', 905, '2021-07-01', '2021-09-20', NULL),
(692, '12D', '2021-07', '12D2021-07', 932, 'auto', '', '932', 572, '2021-07-01', '2021-07-16', NULL),
(693, '12E', '2021-07', '12E2021-07', 932, 'cheque', '', '932', 544, '2021-07-01', '2021-07-27', NULL),
(694, '12F', '2021-07', '12F2021-07', 743, 'auto', '', '743', 573, '2021-07-01', '2021-07-16', NULL),
(695, '12G', '2021-07', '12G2021-07', 743, 'cheque', '', '743', 502, '2021-07-01', '2021-07-12', NULL),
(696, '12H', '2021-07', '12H2021-07', 932, 'auto', '', '932', 574, '2021-07-01', '2021-07-16', NULL),
(697, '13A', '2021-07', '13A2021-07', 932, 'cheque', '', '932', 445, '2021-07-01', '2021-07-06', NULL),
(698, '13B', '2021-07', '13B2021-07', 743, 'auto', '', '743', 575, '2021-07-01', '2021-07-16', NULL),
(699, '13C', '2021-07', '13C2021-07', 743, 'cheque', '', '743', 500, '2021-07-01', '2021-07-12', NULL),
(700, '13D', '2021-07', '13D2021-07', 932, 'cheque', '', '932', 538, '2021-07-01', '2021-07-21', NULL),
(701, '13E', '2021-07', '13E2021-07', 932, 'cheque', '', '932', 815, '2021-07-01', '2021-09-01', NULL),
(702, '13F', '2021-07', '13F2021-07', 743, 'cheque', '', '743', 515, '2021-07-01', '2021-07-19', NULL),
(703, '13G', '2021-07', '13G2021-07', 743, 'cheque', '', '743', 518, '2021-07-01', '2021-07-19', NULL),
(704, '13H', '2021-07', '13H2021-07', 932, 'cheque', '', '932', 428, '2021-07-01', '2021-07-06', NULL),
(705, '14A', '2021-07', '14A2021-07', 932, 'cheque', '', '932', 450, '2021-07-01', '2021-07-06', NULL),
(706, '14B', '2021-07', '14B2021-07', 743, 'cheque', '', '743', 463, '2021-07-01', '2021-07-06', NULL),
(707, '14C', '2021-07', '14C2021-07', 743, 'cheque', '', '743', 524, '2021-07-01', '2021-07-21', NULL),
(708, '14D', '2021-07', '14D2021-07', 932, 'cheque', '', '932', 508, '2021-07-01', '2021-07-12', NULL),
(709, '14E', '2021-07', '14E2021-07', 932, 'cheque', '', '932', 506, '2021-07-01', '2021-07-12', NULL),
(710, '14F', '2021-07', '14F2021-07', 743, 'auto', '', '743', 576, '2021-07-01', '2021-07-16', NULL),
(711, '14G', '2021-07', '14G2021-07', 743, 'auto', '', '743', 577, '2021-07-01', '2021-07-16', NULL),
(712, '14H', '2021-07', '14H2021-07', 932, 'cheque', '', '932', 547, '2021-07-01', '2021-07-27', NULL),
(713, '15A', '2021-07', '15A2021-07', 932, 'cheque', '', '932', 499, '2021-07-01', '2021-07-12', NULL),
(714, '15B', '2021-07', '15B2021-07', 743, 'cheque', '', '743', 432, '2021-07-01', '2021-07-06', NULL),
(715, '15C', '2021-07', '15C2021-07', 743, 'cheque', '', '743', 533, '2021-07-01', '2021-07-21', NULL),
(716, '15D', '2021-07', '15D2021-07', 932, 'cheque', '', '932', 422, '2021-07-01', '2021-07-06', NULL),
(717, '15E', '2021-07', '15E2021-07', 932, 'cheque', '', '932', 468, '2021-07-01', '2021-07-06', NULL),
(718, '15F', '2021-07', '15F2021-07', 743, 'cheque', '', '743', 541, '2021-07-01', '2021-07-26', NULL),
(719, '15G', '2021-07', '15G2021-07', 743, 'auto', '', '743', 578, '2021-07-01', '2021-07-16', NULL),
(720, '15H', '2021-07', '15H2021-07', 932, 'auto', '', '932', 579, '2021-07-01', '2021-07-16', NULL),
(721, '16A', '2021-07', '16A2021-07', 932, 'cheque', '', '932', 519, '2021-07-01', '2021-07-19', NULL),
(722, '16B', '2021-07', '16B2021-07', 743, 'cheque', '', '743', 694, '2021-07-01', '2021-08-10', NULL),
(723, '16C', '2021-07', '16C2021-07', 743, 'auto', '', '743', 580, '2021-07-01', '2021-07-16', NULL),
(724, '16D', '2021-07', '16D2021-07', 932, 'auto', '', '932', 581, '2021-07-01', '2021-07-16', NULL),
(725, '16E', '2021-07', '16E2021-07', 932, 'auto', '', '932', 582, '2021-07-01', '2021-07-16', NULL),
(726, '16F', '2021-07', '16F2021-07', 743, 'auto', '', '743', 583, '2021-07-01', '2021-07-16', NULL),
(727, '16G', '2021-07', '16G2021-07', 743, 'cheque', '', '743', 458, '2021-07-01', '2021-07-06', NULL),
(729, '17A', '2021-07', '17A2021-07', 932, 'cheque', '', '932', 464, '2021-07-01', '2021-07-06', NULL),
(730, '17B', '2021-07', '17B2021-07', 743, 'cheque', '', '743', 607, '2021-07-01', '2021-08-02', NULL),
(731, '17C', '2021-07', '17C2021-07', 743, 'cheque', '', '743', 498, '2021-07-01', '2021-07-12', NULL),
(732, '17D', '2021-07', '17D2021-07', 932, 'cheque', '', '932', 530, '2021-07-01', '2021-07-21', NULL),
(733, '17E', '2021-07', '17E2021-07', 932, 'cheque', '', '932', 501, '2021-07-01', '2021-07-12', NULL),
(734, '17F', '2021-07', '17F2021-07', 743, 'auto', '', '743', 584, '2021-07-01', '2021-07-16', NULL),
(735, '17G', '2021-07', '17G2021-07', 743, 'cheque', '', '743', 532, '2021-07-01', '2021-07-21', NULL),
(736, '17H', '2021-07', '17H2021-07', 932, 'cheque', '', '932', 481, '2021-07-01', '2021-07-12', NULL),
(737, '18A', '2021-07', '18A2021-07', 932, 'cheque', '', '932', 520, '2021-07-01', '2021-07-19', NULL),
(738, '18B', '2021-07', '18B2021-07', 743, 'cheque', '', '743', 482, '2021-07-01', '2021-07-12', NULL),
(739, '18C', '2021-07', '18C2021-07', 743, 'cheque', '', '743', 621, '2021-07-01', '2021-08-02', NULL),
(740, '18D', '2021-07', '18D2021-07', 932, 'cheque', '', '932', 525, '2021-07-01', '2021-07-21', NULL),
(741, '18E', '2021-07', '18E2021-07', 932, 'cheque', '', '932', 483, '2021-07-01', '2021-07-12', NULL),
(743, '18G', '2021-07', '18G2021-07', 743, 'auto', '', '743', 585, '2021-07-01', '2021-07-16', NULL),
(744, '18H', '2021-07', '18H2021-07', 932, 'cheque', '', '932', 733, '2021-07-01', '2021-08-24', NULL),
(745, '19A', '2021-07', '19A2021-07', 932, 'cheque', '', '932', 484, '2021-07-01', '2021-07-12', NULL),
(746, '19B', '2021-07', '19B2021-07', 743, 'cheque', '', '743', 503, '2021-07-01', '2021-07-12', NULL),
(747, '19C', '2021-07', '19C2021-07', 743, 'cash', '', '743', 412, '2021-07-01', '2021-07-06', NULL),
(748, '19D', '2021-07', '19D2021-07', 932, 'cheque', '', '932', 420, '2021-07-01', '2021-07-06', NULL),
(749, '19E', '2021-07', '19E2021-07', 932, 'cheque', '', '932', 485, '2021-07-01', '2021-07-12', NULL),
(750, '19F', '2021-07', '19F2021-07', 743, 'cheque', '', '743', 466, '2021-07-01', '2021-07-06', NULL),
(751, '19G', '2021-07', '19G2021-07', 743, 'auto', '', '743', 586, '2021-07-01', '2021-07-16', NULL),
(752, '19H', '2021-07', '19H2021-07', 932, 'cash', '', '932', 521, '2021-07-01', '2021-07-19', NULL),
(753, '20A', '2021-07', '20A2021-07', 932, 'auto', '', '932', 587, '2021-07-01', '2021-07-16', NULL),
(754, '20B', '2021-07', '20B2021-07', 743, 'cheque', '', '743', 421, '2021-07-01', '2021-07-06', NULL),
(755, '20C', '2021-07', '20C2021-07', 743, 'cheque', '', '743', 486, '2021-07-01', '2021-07-12', NULL),
(756, '20D', '2021-07', '20D2021-07', 932, 'cheque', '', '932', 461, '2021-07-01', '2021-07-06', NULL),
(757, '20E', '2021-07', '20E2021-07', 932, 'cheque', '', '932', 477, '2021-07-01', '2021-07-06', NULL),
(758, '20F', '2021-07', '20F2021-07', 743, 'cheque', '', '743', 545, '2021-07-01', '2021-07-27', NULL),
(759, '20G', '2021-07', '20G2021-07', 743, 'cheque', '', '743', 527, '2021-07-01', '2021-07-21', NULL),
(760, '20H', '2021-07', '20H2021-07', 932, 'cheque', '', '932', 451, '2021-07-01', '2021-07-06', NULL),
(761, '21A', '2021-07', '21A2021-07', 932, 'cheque', '', '932', 413, '2021-07-01', '2021-07-06', NULL),
(762, '21B', '2021-07', '21B2021-07', 743, 'auto', '', '743', 588, '2021-07-01', '2021-07-16', NULL),
(763, '21C', '2021-07', '21C2021-07', 743, 'cheque', '', '743', 487, '2021-07-01', '2021-07-12', NULL),
(764, '21D', '2021-07', '21D2021-07', 932, 'cheque', '', '932', 511, '2021-07-01', '2021-07-19', NULL),
(765, '21E', '2021-07', '21E2021-07', 932, 'cheque', '', '932', 435, '2021-07-01', '2021-07-06', NULL),
(766, '21F', '2021-07', '21F2021-07', 743, 'cheque', '', '743', 514, '2021-07-01', '2021-07-19', NULL),
(767, '21G', '2021-07', '21G2021-07', 743, 'cheque', '', '743', 465, '2021-07-01', '2021-07-06', NULL),
(768, '21H', '2021-07', '21H2021-07', 932, 'auto', '', '932', 589, '2021-07-01', '2021-07-16', NULL),
(769, '22A', '2021-07', '22A2021-07', 932, 'cheque', '', '932', 510, '2021-07-01', '2021-07-19', NULL),
(770, '22B', '2021-07', '22B2021-07', 743, 'cheque', '', '743', 471, '2021-07-01', '2021-07-06', NULL),
(771, '22C', '2021-07', '22C2021-07', 743, 'auto', '', '743', 590, '2021-07-01', '2021-07-16', NULL),
(772, '22D', '2021-07', '22D2021-07', 932, 'cheque', '', '932', 442, '2021-07-01', '2021-07-06', NULL),
(773, '22E', '2021-07', '22E2021-07', 932, 'cheque', '', '932', 535, '2021-07-01', '2021-07-21', NULL),
(774, '22F', '2021-07', '22F2021-07', 743, 'cheque', '', '743', 495, '2021-07-01', '2021-07-12', NULL),
(775, '22G', '2021-07', '22G2021-07', 743, 'auto', '', '743', 591, '2021-07-01', '2021-07-16', NULL),
(776, '22H', '2021-07', '22H2021-07', 932, 'cheque', '', '932', 488, '2021-07-01', '2021-07-12', NULL),
(777, '23A', '2021-07', '23A2021-07', 932, 'cheque', '', '932', 548, '2021-07-01', '2021-07-27', NULL),
(778, '23B', '2021-07', '23B2021-07', 743, 'cheque', '', '743', 489, '2021-07-01', '2021-07-12', NULL),
(779, '23C', '2021-07', '23C2021-07', 743, 'cash', '', '743', 418, '2021-07-01', '2021-07-06', NULL),
(780, '23D', '2021-07', '23D2021-07', 932, 'cheque', '', '932', 536, '2021-07-01', '2021-07-21', NULL),
(781, '23E', '2021-07', '23E2021-07', 932, 'auto', '', '932', 592, '2021-07-01', '2021-07-16', NULL),
(782, '23F', '2021-07', '23F2021-07', 743, 'cheque', '', '743', 494, '2021-07-01', '2021-07-12', NULL),
(783, '23G', '2021-07', '23G2021-07', 743, 'cheque', '', '743', 936, '2021-07-01', '2021-09-27', NULL),
(784, '23H', '2021-07', '23H2021-07', 932, 'cheque', '', '932', 490, '2021-07-01', '2021-07-12', NULL),
(785, '24A', '2021-07', '24A2021-07', 932, NULL, NULL, NULL, NULL, '2021-07-01', NULL, NULL),
(786, '24B', '2021-07', '24B2021-07', 743, 'cheque', '', '743', 724, '2021-07-01', '2021-08-16', NULL),
(787, '24C', '2021-07', '24C2021-07', 743, 'cheque', '', '743', 528, '2021-07-01', '2021-07-21', NULL),
(788, '24D', '2021-07', '24D2021-07', 932, 'auto', '', '932', 593, '2021-07-01', '2021-07-16', NULL),
(789, '24E', '2021-07', '24E2021-07', 932, 'auto', '', '932', 594, '2021-07-01', '2021-07-16', NULL),
(790, '24F', '2021-07', '24F2021-07', 743, 'cheque', '', '743', 704, '2021-07-01', '2021-08-13', NULL),
(791, '24G', '2021-07', '24G2021-07', 743, 'cheque', '', '743', 454, '2021-07-01', '2021-07-06', NULL),
(792, '24H', '2021-07', '24H2021-07', 932, 'auto', '', '932', 595, '2021-07-01', '2021-07-16', NULL),
(793, '25A', '2021-07', '25A2021-07', 932, 'auto', '', '932', 596, '2021-07-01', '2021-07-16', NULL),
(794, '25B', '2021-07', '25B2021-07', 743, 'cheque', '', '743', 546, '2021-07-01', '2021-07-27', NULL),
(795, '25C', '2021-07', '25C2021-07', 743, 'cheque', '', '743', 491, '2021-07-01', '2021-07-12', NULL),
(796, '25D', '2021-07', '25D2021-07', 932, 'auto', '', '932', 597, '2021-07-01', '2021-07-16', NULL),
(797, '25E', '2021-07', '25E2021-07', 932, 'cheque', '', '932', 457, '2021-07-01', '2021-07-06', NULL),
(798, '25F', '2021-07', '25F2021-07', 743, 'auto', '', '743', 598, '2021-07-01', '2021-07-16', NULL),
(799, '25G', '2021-07', '25G2021-07', 743, 'cheque', '', '743', 492, '2021-07-01', '2021-07-12', NULL),
(800, '25H', '2021-07', '25H2021-07', 932, 'cheque', '', '932', 443, '2021-07-01', '2021-07-06', NULL),
(801, 'SHOP01', '2021-07', 'SHOP012021-07', 774, 'cheque', '', '774', 692, '2021-07-01', '2021-08-09', NULL),
(802, 'SHOP02', '2021-07', 'SHOP022021-07', 711, 'auto', '', '711', 797, '2021-07-01', '2021-07-16', NULL),
(803, 'SHOP03', '2021-07', 'SHOP032021-07', 632, 'cheque', '', '632', 539, '2021-07-01', '2021-07-21', NULL),
(804, 'SHOP04', '2021-07', 'SHOP042021-07', 679, 'cash', '', '679', 414, '2021-07-01', '2021-07-06', NULL),
(805, 'SHOP05', '2021-07', 'SHOP052021-07', 774, 'cheque', '', '774', 419, '2021-07-01', '2021-07-06', NULL),
(806, 'SHOP06', '2021-07', 'SHOP062021-07', 443, 'cheque', '', '443', 425, '2021-07-01', '2021-07-06', NULL),
(807, 'SHOP07', '2021-07', 'SHOP072021-07', 379, 'cheque', '', '379', 513, '2021-07-01', '2021-07-19', NULL),
(808, 'SHOP08', '2021-07', 'SHOP082021-07', 443, 'auto', '', '443', 602, '2021-07-01', '2021-07-19', NULL),
(809, 'SHOP09', '2021-07', 'SHOP092021-07', 505, 'auto', '', '505', 603, '2021-07-01', '2021-07-19', NULL),
(810, 'SHOP10', '2021-07', 'SHOP102021-07', 853, 'cheque', '', '853', 660, '2021-07-01', '2021-08-03', NULL),
(811, 'SHOP11', '2021-07', 'SHOP112021-07', 1010, 'cheque', '', '1010', 472, '2021-07-01', '2021-07-06', NULL),
(812, 'SHOP12', '2021-07', 'SHOP122021-07', 836, 'cheque', '', '836', 700, '2021-07-01', '2021-08-10', NULL),
(813, 'SHOP13', '2021-07', 'SHOP132021-07', 695, 'cheque', '', '695', 478, '2021-07-01', '2021-07-12', NULL),
(857, 'SHOP04', '2021-08', 'SHOP042021-08', 679, 'cash', '', '679', 414, '2021-08-01', '2021-07-06', NULL),
(858, '02H', '2021-08', '02H2021-08', 932, 'cheque', '', '932', 417, '2021-08-01', '2021-07-06', NULL),
(859, '02H', '2021-09', '02H2021-09', 932, 'cheque', '', '932', 417, '2021-09-01', '2021-07-06', NULL),
(860, '02H', '2021-10', '02H2021-10', 932, 'cheque', '', '932', 417, '2021-10-01', '2021-07-06', NULL),
(861, '02H', '2021-11', '02H2021-11', 932, 'cheque', '', '932', 417, '2021-11-01', '2021-07-06', NULL),
(862, '02H', '2021-12', '02H2021-12', 932, 'cheque', '', '932', 417, '2021-12-01', '2021-07-06', NULL),
(863, '13A', '2021-08', '13A2021-08', 932, 'cheque', '', '932', 445, '2021-08-01', '2021-07-06', NULL),
(865, '13A', '2021-09', '13A2021-09', 932, 'cheque', '', '932', 445, '2021-09-01', '2021-07-06', NULL),
(866, '11B', '2021-08', '11B2021-08', 743, 'cheque', '', '743', 476, '2021-08-01', '2021-07-06', NULL),
(867, '11B', '2021-09', '11B2021-09', 743, 'cheque', '', '743', 476, '2021-09-01', '2021-07-06', NULL),
(868, '23H', '2021-08', '23H2021-08', 932, 'cheque', '', '932', 490, '2021-08-01', '2021-07-12', NULL),
(869, '23H', '2021-09', '23H2021-09', 932, 'cheque', '', '932', 490, '2021-09-01', '2021-07-12', NULL),
(870, '13G', '2021-08', '13G2021-08', 743, 'cheque', '', '743', 518, '2021-08-01', '2021-07-19', NULL),
(871, '13G', '2021-09', '13G2021-09', 743, 'cheque', '', '743', 518, '2021-09-01', '2021-07-19', NULL),
(872, '16A', '2021-08', '16A2021-08', 932, 'cheque', '', '932', 519, '2021-08-01', '2021-07-19', NULL),
(873, '16A', '2021-09', '16A2021-09', 932, 'cheque', '', '932', 519, '2021-09-01', '2021-07-19', NULL),
(874, '18A', '2021-08', '18A2021-08', 932, 'cheque', '', '932', 520, '2021-08-01', '2021-07-19', NULL),
(875, '18A', '2021-09', '18A2021-09', 932, 'cheque', '', '932', 520, '2021-09-01', '2021-07-19', NULL),
(876, '18A', '2021-10', '18A2021-10', 932, 'cheque', '', '932', 520, '2021-10-01', '2021-07-19', NULL),
(877, '18A', '2021-11', '18A2021-11', 932, 'cheque', '', '932', 520, '2021-11-01', '2021-07-19', NULL),
(878, '18A', '2021-12', '18A2021-12', 932, 'cheque', '', '932', 520, '2021-12-01', '2021-07-19', NULL),
(879, '10H', '2021-08', '10H2021-08', 932, 'cheque', '', '932', 526, '2021-08-01', '2021-07-21', NULL),
(880, '25B', '2021-08', '25B2021-08', 743, 'cheque', '', '743', 546, '2021-08-01', '2021-07-27', NULL),
(881, '24A', '2021-08', '24A2021-08', 932, 'cheque', '', '932', 599, '2021-08-01', '2021-07-27', NULL),
(882, '01A', '2021-08', '01A2021-08', 979, 'auto', '', '979', 785, '2021-08-01', '2021-08-13', NULL),
(883, '01B', '2021-08', '01B2021-08', 780, 'cheque', '', '780', 651, '2021-08-01', '2021-08-03', NULL),
(884, '01C', '2021-08', '01C2021-08', 780, 'cheque', '', '780', 667, '2021-08-01', '2021-08-06', NULL),
(885, '01D', '2021-08', '01D2021-08', 979, 'cash', '', '979', 663, '2021-08-01', '2021-08-03', NULL),
(886, '01E', '2021-08', '01E2021-08', 979, 'cheque', '', '979', 665, '2021-08-01', '2021-08-06', NULL),
(887, '01F', '2021-08', '01F2021-08', 780, 'auto', '', '780', 758, '2021-08-01', '2021-08-13', NULL),
(888, '01G', '2021-08', '01G2021-08', 780, 'auto', '', '780', 787, '2021-08-01', '2021-08-13', NULL),
(889, '01H', '2021-08', '01H2021-08', 979, 'auto', '', '979', 788, '2021-08-01', '2021-08-13', NULL),
(890, '02A', '2021-08', '02A2021-08', 979, 'cash', '', '979', 632, '2021-08-01', '2021-08-02', NULL),
(891, '02B', '2021-08', '02B2021-08', 780, 'cheque', '', '780', 935, '2021-08-01', '2021-09-27', NULL),
(892, '02C', '2021-08', '02C2021-08', 780, 'cash', '', '780', 637, '2021-08-01', '2021-08-02', NULL),
(893, '02D', '2021-08', '02D2021-08', 979, 'cash', '', '979', 638, '2021-08-01', '2021-08-02', NULL),
(894, '02E', '2021-08', '02E2021-08', 979, 'cheque', '', '979', 612, '2021-08-01', '2021-08-02', NULL),
(895, '02F', '2021-08', '02F2021-08', 780, 'cheque', '', '780', 657, '2021-08-01', '2021-08-03', NULL),
(896, '02G', '2021-08', '02G2021-08', 780, 'auto', '', '780', 741, '2021-08-01', '2021-08-13', NULL),
(898, '03A', '2021-08', '03A2021-08', 979, 'auto', '', '979', 770, '2021-08-01', '2021-08-13', NULL),
(899, '03B', '2021-08', '03B2021-08', 780, 'cheque', '', '780', 703, '2021-08-01', '2021-08-13', NULL),
(900, '03C', '2021-08', '03C2021-08', 780, 'cheque', '', '780', 646, '2021-08-01', '2021-08-03', NULL),
(901, '03D', '2021-08', '03D2021-08', 979, 'auto', '', '979', 789, '2021-08-01', '2021-08-13', NULL),
(902, '03E', '2021-08', '03E2021-08', 979, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(903, '03F', '2021-08', '03F2021-08', 780, 'cheque', '', '780', 727, '2021-08-01', '2021-08-20', NULL),
(904, '03G', '2021-08', '03G2021-08', 780, 'cheque', '', '780', 683, '2021-08-01', '2021-08-06', NULL),
(905, '03H', '2021-08', '03H2021-08', 979, 'auto', '', '979', 773, '2021-08-01', '2021-08-13', NULL),
(906, '04A', '2021-08', '04A2021-08', 979, 'cheque', '', '979', 688, '2021-08-01', '2021-08-09', NULL),
(907, '04B', '2021-08', '04B2021-08', 780, 'cheque', '', '780', 695, '2021-08-01', '2021-08-10', NULL),
(908, '04C', '2021-08', '04C2021-08', 780, 'cheque', '', '780', 627, '2021-08-01', '2021-08-02', NULL),
(909, '04D', '2021-08', '04D2021-08', 979, 'cash', '', '979', 639, '2021-08-01', '2021-08-02', NULL),
(910, '04E', '2021-08', '04E2021-08', 979, 'cheque', '', '979', 618, '2021-08-01', '2021-08-02', NULL),
(911, '04F', '2021-08', '04F2021-08', 780, 'cheque', '', '780', 661, '2021-08-01', '2021-08-03', NULL),
(912, '04G', '2021-08', '04G2021-08', 780, 'cheque', '', '780', 738, '2021-08-01', '2021-08-24', NULL),
(914, '05A', '2021-08', '05A2021-08', 979, 'cash', '', '979', 728, '2021-08-01', '2021-08-20', NULL),
(915, '05B', '2021-08', '05B2021-08', 780, 'cheque', '', '780', 719, '2021-08-01', '2021-08-16', NULL),
(916, '05C', '2021-08', '05C2021-08', 780, 'cash', '', '780', 614, '2021-08-01', '2021-08-02', NULL),
(917, '05D', '2021-08', '05D2021-08', 979, 'cheque', '', '979', 712, '2021-08-01', '2021-08-16', NULL),
(918, '05E', '2021-08', '05E2021-08', 979, 'cheque', '', '979', 701, '2021-08-01', '2021-08-13', NULL),
(919, '05F', '2021-08', '05F2021-08', 780, 'auto', '', '780', 774, '2021-08-01', '2021-08-13', NULL),
(920, '05G', '2021-08', '05G2021-08', 780, 'auto', '', '780', 740, '2021-08-01', '2021-08-13', NULL),
(921, '05H', '2021-08', '05H2021-08', 979, 'cheque', '', '979', 693, '2021-08-01', '2021-08-10', NULL),
(922, '06A', '2021-08', '06A2021-08', 979, 'cheque', '', '979', 619, '2021-08-01', '2021-08-02', NULL),
(923, '06B', '2021-08', '06B2021-08', 780, 'cheque', '', '780', 697, '2021-08-01', '2021-08-10', NULL),
(924, '06C', '2021-08', '06C2021-08', 780, 'cheque', '', '780', 604, '2021-08-01', '2021-08-02', NULL),
(925, '06D', '2021-08', '06D2021-08', 979, 'cheque', '', '979', 642, '2021-08-01', '2021-08-02', NULL),
(926, '06E', '2021-08', '06E2021-08', 979, 'auto', '', '979', 775, '2021-08-01', '2021-08-13', NULL),
(927, '06F', '2021-08', '06F2021-08', 780, 'cheque', '', '780', 608, '2021-08-01', '2021-08-02', NULL),
(928, '06G', '2021-08', '06G2021-08', 780, 'cheque', '', '780', 696, '2021-08-01', '2021-08-10', NULL),
(929, '06H', '2021-08', '06H2021-08', 979, 'cheque', '', '979', 626, '2021-08-01', '2021-08-02', NULL),
(930, '07A', '2021-08', '07A2021-08', 979, 'cheque', '', '979', 709, '2021-08-01', '2021-08-13', NULL),
(932, '07C', '2021-08', '07C2021-08', 780, 'cheque', '', '780', 613, '2021-08-01', '2021-08-02', NULL),
(933, '07D', '2021-08', '07D2021-08', 979, 'auto', '', '979', 776, '2021-08-01', '2021-08-13', NULL),
(934, '07E', '2021-08', '07E2021-08', 979, 'cheque', '', '979', 669, '2021-08-01', '2021-08-06', NULL),
(935, '07F', '2021-08', '07F2021-08', 780, 'auto', '', '780', 777, '2021-08-01', '2021-08-13', NULL),
(936, '07G', '2021-08', '07G2021-08', 780, 'cheque', '', '780', 684, '2021-08-01', '2021-08-09', NULL),
(937, '07H', '2021-08', '07H2021-08', 979, 'cheque', '', '979', 647, '2021-08-01', '2021-08-03', NULL),
(938, '08A', '2021-08', '08A2021-08', 979, 'cheque', '', '979', 828, '2021-08-01', '2021-09-02', NULL),
(939, '08B', '2021-08', '08B2021-08', 780, 'auto', '', '780', 786, '2021-08-01', '2021-08-13', NULL),
(940, '08C', '2021-08', '08C2021-08', 780, 'cheque', '', '780', 725, '2021-08-01', '2021-08-16', NULL),
(941, '08D', '2021-08', '08D2021-08', 979, 'auto', '', '979', 772, '2021-08-01', '2021-08-13', NULL),
(942, '08E', '2021-08', '08E2021-08', 979, 'cheque', '', '979', 615, '2021-08-01', '2021-08-02', NULL),
(943, '08F', '2021-08', '08F2021-08', 780, 'cheque', '', '780', 705, '2021-08-01', '2021-08-13', NULL),
(944, '08G', '2021-08', '08G2021-08', 780, 'cheque', '', '780', 679, '2021-08-01', '2021-08-06', NULL),
(945, '08H', '2021-08', '08H2021-08', 979, 'cash', '', '979', 721, '2021-08-01', '2021-08-16', NULL),
(946, '09A', '2021-08', '09A2021-08', 979, 'cheque', '', '979', 732, '2021-08-01', '2021-08-24', NULL),
(947, '09B', '2021-08', '09B2021-08', 37, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(948, '09C', '2021-08', '09C2021-08', 780, 'cheque', '', '780', 648, '2021-08-01', '2021-08-03', NULL),
(949, '09D', '2021-08', '09D2021-08', 979, 'cheque', '', '979', 790, '2021-08-01', '2021-08-30', NULL),
(950, '09E', '2021-08', '09E2021-08', 979, 'cash', '', '979', 640, '2021-08-01', '2021-08-02', NULL),
(951, '09F', '2021-08', '09F2021-08', 780, 'auto', '', '780', 779, '2021-08-01', '2021-08-13', NULL),
(952, '09G', '2021-08', '09G2021-08', 780, 'cheque', '', '780', 658, '2021-08-01', '2021-08-03', NULL),
(953, '09H', '2021-08', '09H2021-08', 979, 'cheque', '', '979', 685, '2021-08-01', '2021-08-09', NULL),
(954, '10A', '2021-08', '10A2021-08', 979, 'cheque', '', '979', 620, '2021-08-01', '2021-08-02', NULL),
(955, '10B', '2021-08', '10B2021-08', 743, 'cheque', '', '743', 610, '2021-08-01', '2021-08-02', NULL),
(956, '10C', '2021-08', '10C2021-08', 780, 'auto', '', '780', 769, '2021-08-01', '2021-08-13', NULL),
(957, '10D', '2021-08', '10D2021-08', 979, 'cheque', '', '979', 622, '2021-08-01', '2021-08-02', NULL),
(958, '10E', '2021-08', '10E2021-08', 979, 'cheque', '', '979', 652, '2021-08-01', '2021-08-03', NULL),
(959, '10F', '2021-08', '10F2021-08', 780, 'auto', '', '780', 750, '2021-08-01', '2021-08-13', NULL),
(960, '10G', '2021-08', '10G2021-08', 780, 'cheque', '', '780', 895, '2021-08-01', '2021-09-13', NULL),
(962, '11A', '2021-08', '11A2021-08', 979, 'cheque', '', '979', 606, '2021-08-01', '2021-08-02', NULL),
(964, '11C', '2021-08', '11C2021-08', 780, 'cheque', '', '780', 643, '2021-08-01', '2021-08-02', NULL),
(965, '11D', '2021-08', '11D2021-08', 979, 'cheque', '', '979', 653, '2021-08-01', '2021-08-03', NULL),
(966, '11E', '2021-08', '11E2021-08', 979, 'auto', '', '979', 771, '2021-08-01', '2021-08-13', NULL),
(967, '11F', '2021-08', '11F2021-08', 780, 'cheque', '', '780', 718, '2021-08-01', '2021-08-16', NULL),
(968, '11G', '2021-08', '11G2021-08', 780, 'cheque', '', '780', 876, '2021-08-01', '2021-09-09', NULL),
(969, '11H', '2021-08', '11H2021-08', 979, 'auto', '', '979', 742, '2021-08-01', '2021-08-13', NULL),
(970, '12A', '2021-08', '12A2021-08', 979, 'cheque', '', '979', 662, '2021-08-01', '2021-08-03', NULL),
(971, '12B', '2021-08', '12B2021-08', 780, 'auto', '', '780', 743, '2021-08-01', '2021-08-13', NULL),
(972, '12C', '2021-08', '12C2021-08', 780, 'cheque', '', '780', 905, '2021-08-01', '2021-09-20', NULL),
(973, '12D', '2021-08', '12D2021-08', 979, 'auto', '', '979', 744, '2021-08-01', '2021-08-13', NULL),
(974, '12E', '2021-08', '12E2021-08', 979, 'cheque', '', '979', 737, '2021-08-01', '2021-08-24', NULL),
(975, '12F', '2021-08', '12F2021-08', 780, 'auto', '', '780', 745, '2021-08-01', '2021-08-13', NULL),
(976, '12G', '2021-08', '12G2021-08', 780, 'cheque', '', '780', 682, '2021-08-01', '2021-08-06', NULL),
(977, '12H', '2021-08', '12H2021-08', 979, 'auto', '', '979', 746, '2021-08-01', '2021-08-13', NULL),
(979, '13B', '2021-08', '13B2021-08', 780, 'auto', '', '780', 747, '2021-08-01', '2021-08-13', NULL),
(980, '13C', '2021-08', '13C2021-08', 780, 'cheque', '', '780', 729, '2021-08-01', '2021-08-20', NULL),
(981, '13D', '2021-08', '13D2021-08', 979, 'cheque', '', '979', 792, '2021-08-01', '2021-08-30', NULL),
(982, '13E', '2021-08', '13E2021-08', 979, 'cheque', '', '979', 815, '2021-08-01', '2021-09-01', NULL),
(983, '13F', '2021-08', '13F2021-08', 780, 'cheque', '', '780', 672, '2021-08-01', '2021-08-06', NULL),
(985, '13H', '2021-08', '13H2021-08', 979, 'cheque', '', '979', 650, '2021-08-01', '2021-08-03', NULL),
(986, '14A', '2021-08', '14A2021-08', 979, 'cheque', '', '979', 671, '2021-08-01', '2021-08-06', NULL),
(987, '14B', '2021-08', '14B2021-08', 780, 'cheque', '', '780', 609, '2021-08-01', '2021-08-02', NULL),
(988, '14C', '2021-08', '14C2021-08', 780, 'cheque', '', '780', 708, '2021-08-01', '2021-08-13', NULL),
(989, '14D', '2021-08', '14D2021-08', 979, 'cheque', '', '979', 715, '2021-08-01', '2021-08-16', NULL),
(990, '14E', '2021-08', '14E2021-08', 979, 'cheque', '', '979', 689, '2021-08-01', '2021-08-09', NULL),
(991, '14F', '2021-08', '14F2021-08', 780, 'auto', '', '780', 796, '2021-08-01', '2021-08-13', NULL),
(992, '14G', '2021-08', '14G2021-08', 780, 'auto', '', '780', 748, '2021-08-01', '2021-08-13', NULL),
(993, '14H', '2021-08', '14H2021-08', 979, 'cheque', '', '979', 794, '2021-08-01', '2021-08-30', NULL),
(994, '15A', '2021-08', '15A2021-08', 979, 'cheque', '', '979', 698, '2021-08-01', '2021-08-10', NULL),
(995, '15B', '2021-08', '15B2021-08', 780, 'cheque', '', '780', 624, '2021-08-01', '2021-08-02', NULL),
(996, '15C', '2021-08', '15C2021-08', 780, 'cheque', '', '780', 713, '2021-08-01', '2021-08-16', NULL),
(997, '15D', '2021-08', '15D2021-08', 979, 'cheque', '', '979', 654, '2021-08-01', '2021-08-03', NULL),
(998, '15E', '2021-08', '15E2021-08', 979, 'cheque', '', '979', 655, '2021-08-01', '2021-08-03', NULL),
(999, '15F', '2021-08', '15F2021-08', 780, 'cheque', '', '780', 731, '2021-08-01', '2021-08-20', NULL),
(1000, '15G', '2021-08', '15G2021-08', 780, 'auto', '', '780', 749, '2021-08-01', '2021-08-13', NULL),
(1001, '15H', '2021-08', '15H2021-08', 979, 'auto', '', '979', 751, '2021-08-01', '2021-08-13', NULL),
(1003, '16B', '2021-08', '16B2021-08', 780, 'cheque', '', '780', 694, '2021-08-01', '2021-08-10', NULL),
(1004, '16C', '2021-08', '16C2021-08', 780, 'auto', '', '780', 752, '2021-08-01', '2021-08-13', NULL),
(1005, '16D', '2021-08', '16D2021-08', 979, 'auto', '', '979', 753, '2021-08-01', '2021-08-13', NULL),
(1006, '16E', '2021-08', '16E2021-08', 979, 'auto', '', '979', 783, '2021-08-01', '2021-08-13', NULL),
(1007, '16F', '2021-08', '16F2021-08', 780, 'auto', '', '780', 754, '2021-08-01', '2021-08-13', NULL),
(1008, '16G', '2021-08', '16G2021-08', 780, 'cheque', '', '780', 616, '2021-08-01', '2021-08-02', NULL),
(1009, '16H', '2021-08', '16H2021-08', 979, 'cheque', '', '979', 798, '2021-08-01', '2021-09-01', NULL),
(1010, '17A', '2021-08', '17A2021-08', 979, 'cheque', '', '979', 686, '2021-08-01', '2021-08-09', NULL),
(1011, '17B', '2021-08', '17B2021-08', 780, 'cheque', '', '780', 607, '2021-08-01', '2021-08-02', NULL),
(1012, '17C', '2021-08', '17C2021-08', 780, 'cheque', '', '780', 710, '2021-08-01', '2021-08-13', NULL),
(1013, '17D', '2021-08', '17D2021-08', 979, 'cheque', '', '979', 673, '2021-08-01', '2021-08-06', NULL),
(1014, '17E', '2021-08', '17E2021-08', 979, 'cash', '', '979', 634, '2021-08-01', '2021-08-02', NULL),
(1015, '17F', '2021-08', '17F2021-08', 780, 'auto', '', '780', 756, '2021-08-01', '2021-08-13', NULL),
(1016, '17G', '2021-08', '17G2021-08', 780, 'cheque', '', '780', 714, '2021-08-01', '2021-08-16', NULL),
(1017, '17H', '2021-08', '17H2021-08', 979, 'cheque', '', '979', 674, '2021-08-01', '2021-08-06', NULL),
(1019, '18B', '2021-08', '18B2021-08', 780, 'cheque', '', '780', 623, '2021-08-01', '2021-08-02', NULL),
(1020, '18C', '2021-08', '18C2021-08', 780, 'cheque', '', '780', 621, '2021-08-01', '2021-08-02', NULL),
(1021, '18D', '2021-08', '18D2021-08', 979, 'cheque', '', '979', 723, '2021-08-01', '2021-08-16', NULL),
(1022, '18E', '2021-08', '18E2021-08', 979, 'cheque', '', '979', 885, '2021-08-01', '2021-09-09', NULL),
(1024, '18G', '2021-08', '18G2021-08', 780, 'cheque', '', '780', 706, '2021-08-01', '2021-08-13', NULL),
(1025, '18H', '2021-08', '18H2021-08', 979, 'cheque', '', '979', 733, '2021-08-01', '2021-08-24', NULL),
(1026, '19A', '2021-08', '19A2021-08', 979, 'cheque', '', '979', 631, '2021-08-01', '2021-08-02', NULL),
(1027, '19B', '2021-08', '19B2021-08', 780, 'cheque', '', '780', 668, '2021-08-01', '2021-08-06', NULL),
(1028, '19C', '2021-08', '19C2021-08', 780, 'cash', '', '780', 633, '2021-08-01', '2021-08-02', NULL),
(1029, '19D', '2021-08', '19D2021-08', 979, 'cash', '', '979', 635, '2021-08-01', '2021-08-02', NULL),
(1030, '19E', '2021-08', '19E2021-08', 979, 'cheque', '', '979', 675, '2021-08-01', '2021-08-06', NULL),
(1031, '19F', '2021-08', '19F2021-08', 780, 'cheque', '', '780', 649, '2021-08-01', '2021-08-03', NULL),
(1032, '19G', '2021-08', '19G2021-08', 780, 'auto', '', '780', 757, '2021-08-01', '2021-08-13', NULL),
(1033, '19H', '2021-08', '19H2021-08', 979, 'cash', '', '979', 722, '2021-08-01', '2021-08-16', NULL),
(1034, '20A', '2021-08', '20A2021-08', 979, 'auto', '', '979', 759, '2021-08-01', '2021-08-13', NULL),
(1035, '20B', '2021-08', '20B2021-08', 780, 'cash', '', '780', 636, '2021-08-01', '2021-08-02', NULL),
(1036, '20C', '2021-08', '20C2021-08', 780, 'cheque', '', '780', 676, '2021-08-01', '2021-08-06', NULL),
(1037, '20D', '2021-08', '20D2021-08', 979, 'cheque', '', '979', 677, '2021-08-01', '2021-08-06', NULL),
(1038, '20E', '2021-08', '20E2021-08', 979, 'cheque', '', '979', 699, '2021-08-01', '2021-08-10', NULL),
(1039, '20F', '2021-08', '20F2021-08', 780, 'cheque', '', '780', 793, '2021-08-01', '2021-08-30', NULL),
(1040, '20G', '2021-08', '20G2021-08', 780, 'cheque', '', '780', 716, '2021-08-01', '2021-08-16', NULL),
(1041, '20H', '2021-08', '20H2021-08', 979, 'cheque', '', '979', 659, '2021-08-01', '2021-08-03', NULL),
(1042, '21A', '2021-08', '21A2021-08', 979, 'cheque', '', '979', 605, '2021-08-01', '2021-08-02', NULL),
(1043, '21B', '2021-08', '21B2021-08', 780, 'auto', '', '780', 760, '2021-08-01', '2021-08-13', NULL),
(1044, '21C', '2021-08', '21C2021-08', 780, 'cheque', '', '780', 664, '2021-08-01', '2021-08-06', NULL),
(1045, '21D', '2021-08', '21D2021-08', 979, 'cheque', '', '979', 739, '2021-08-01', '2021-08-24', NULL),
(1046, '21E', '2021-08', '21E2021-08', 979, 'cheque', '', '979', 678, '2021-08-01', '2021-08-06', NULL),
(1047, '21F', '2021-08', '21F2021-08', 780, 'cheque', '', '780', 734, '2021-08-01', '2021-08-24', NULL),
(1048, '21G', '2021-08', '21G2021-08', 780, 'cheque', '', '780', 711, '2021-08-01', '2021-08-16', NULL),
(1049, '21H', '2021-08', '21H2021-08', 979, 'auto', '', '979', 761, '2021-08-01', '2021-08-13', NULL),
(1050, '22A', '2021-08', '22A2021-08', 979, 'cheque', '', '979', 795, '2021-08-01', '2021-08-30', NULL),
(1051, '22B', '2021-08', '22B2021-08', 780, 'cheque', '', '780', 670, '2021-08-01', '2021-08-06', NULL),
(1052, '22C', '2021-08', '22C2021-08', 780, 'auto', '', '780', 762, '2021-08-01', '2021-08-13', NULL),
(1053, '22D', '2021-08', '22D2021-08', 979, 'cheque', '', '979', 628, '2021-08-01', '2021-08-02', NULL),
(1054, '22E', '2021-08', '22E2021-08', 979, 'cheque', '', '979', 726, '2021-08-01', '2021-08-16', NULL),
(1055, '22F', '2021-08', '22F2021-08', 780, 'cheque', '', '780', 736, '2021-08-01', '2021-08-24', NULL),
(1056, '22G', '2021-08', '22G2021-08', 780, 'auto', '', '780', 763, '2021-08-01', '2021-08-13', NULL),
(1057, '22H', '2021-08', '22H2021-08', 979, 'cheque', '', '979', 730, '2021-08-01', '2021-08-20', NULL),
(1058, '23A', '2021-08', '23A2021-08', 979, 'cheque', '', '979', 690, '2021-08-01', '2021-08-09', NULL),
(1059, '23B', '2021-08', '23B2021-08', 780, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1060, '23C', '2021-08', '23C2021-08', 780, 'cash', '', '780', 680, '2021-08-01', '2021-08-06', NULL),
(1061, '23D', '2021-08', '23D2021-08', 979, 'cheque', '', '979', 720, '2021-08-01', '2021-08-16', NULL),
(1062, '23E', '2021-08', '23E2021-08', 979, 'auto', '', '979', 764, '2021-08-01', '2021-08-13', NULL),
(1063, '23F', '2021-08', '23F2021-08', 780, 'cheque', '', '780', 687, '2021-08-01', '2021-08-09', NULL),
(1064, '23G', '2021-08', '23G2021-08', 780, 'cheque', '', '780', 936, '2021-08-01', '2021-09-27', NULL),
(1067, '24B', '2021-08', '24B2021-08', 780, 'cheque', '', '780', 717, '2021-08-01', '2021-08-16', NULL),
(1068, '24C', '2021-08', '24C2021-08', 780, 'cheque', '', '780', 735, '2021-08-01', '2021-08-24', NULL),
(1069, '24D', '2021-08', '24D2021-08', 979, 'auto', '', '979', 765, '2021-08-01', '2021-08-13', NULL),
(1070, '24E', '2021-08', '24E2021-08', 979, 'auto', '', '979', 766, '2021-08-01', '2021-08-13', NULL),
(1071, '24F', '2021-08', '24F2021-08', 780, 'cheque', '', '780', 704, '2021-08-01', '2021-08-13', NULL),
(1072, '24G', '2021-08', '24G2021-08', 780, 'cheque', '', '780', 666, '2021-08-01', '2021-08-06', NULL),
(1073, '24H', '2021-08', '24H2021-08', 979, 'auto', '', '979', 767, '2021-08-01', '2021-08-13', NULL),
(1074, '25A', '2021-08', '25A2021-08', 979, 'auto', '', '979', 768, '2021-08-01', '2021-08-13', NULL),
(1076, '25C', '2021-08', '25C2021-08', 780, 'cheque', '', '780', 707, '2021-08-01', '2021-08-13', NULL),
(1077, '25D', '2021-08', '25D2021-08', 979, 'auto', '', '979', 784, '2021-08-01', '2021-08-13', NULL),
(1078, '25E', '2021-08', '25E2021-08', 979, 'cheque', '', '979', 645, '2021-08-01', '2021-08-03', NULL),
(1079, '25F', '2021-08', '25F2021-08', 780, 'auto', '', '780', 755, '2021-08-01', '2021-08-13', NULL),
(1080, '25G', '2021-08', '25G2021-08', 780, 'cheque', '', '780', 656, '2021-08-01', '2021-08-03', NULL),
(1081, '25H', '2021-08', '25H2021-08', 979, 'cheque', '', '979', 644, '2021-08-01', '2021-08-03', NULL),
(1082, 'SHOP01', '2021-08', 'SHOP012021-08', 813, 'cheque', '', '813', 819, '2021-08-01', '2021-09-02', NULL),
(1083, 'SHOP02', '2021-08', 'SHOP022021-08', 747, 'auto', '', '747', 781, '2021-08-01', '2021-08-13', NULL),
(1084, 'SHOP03', '2021-08', 'SHOP032021-08', 664, 'cheque', '', '664', 691, '2021-08-01', '2021-08-09', NULL),
(1086, 'SHOP05', '2021-08', 'SHOP052021-08', 39, 'cheque', '', '39', 814, '2021-08-01', '2021-09-01', NULL),
(1087, 'SHOP06', '2021-08', 'SHOP062021-08', 465, 'cheque', '', '465', 629, '2021-08-01', '2021-08-02', NULL),
(1088, 'SHOP07', '2021-08', 'SHOP072021-08', 19, 'cheque', '', '19', 866, '2021-08-01', '2021-09-07', NULL),
(1089, 'SHOP08', '2021-08', 'SHOP082021-08', 465, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1090, 'SHOP09', '2021-08', 'SHOP092021-08', 530, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1091, 'SHOP10', '2021-08', 'SHOP102021-08', 896, 'cheque', '', '896', 660, '2021-08-01', '2021-08-03', NULL),
(1092, 'SHOP11', '2021-08', 'SHOP112021-08', 1061, 'cheque', '', '1061', 617, '2021-08-01', '2021-08-02', NULL),
(1093, 'SHOP12', '2021-08', 'SHOP122021-08', 878, 'cheque', '', '878', 700, '2021-08-01', '2021-08-10', NULL),
(1094, 'SHOP13', '2021-08', 'SHOP132021-08', 730, 'cheque', '', '730', 878, '2021-08-01', '2021-09-09', NULL),
(1137, '02H', '2021-08-adv', '02H2021-08-adv', 47, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1138, '04H', '2021-08-adv', '04H2021-08-adv', 47, 'cheque', '', '47', 916, '2021-08-01', '2021-09-20', NULL),
(1139, '07B', '2021-08-adv', '07B2021-08-adv', 37, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1140, '10H', '2021-08-adv', '10H2021-08-adv', 47, 'cheque', '', '47', 915, '2021-08-01', '2021-09-20', NULL),
(1141, '11B', '2021-08-adv', '11B2021-08-adv', 37, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1142, '13A', '2021-08-adv', '13A2021-08-adv', 47, 'cheque', '', '47', 840, '2021-08-01', '2021-09-02', NULL),
(1143, '13G', '2021-08-adv', '13G2021-08-adv', 37, 'cheque', '', '37', 625, '2021-08-01', '2021-08-02', NULL),
(1144, '16A', '2021-08-adv', '16A2021-08-adv', 47, 'cash', '', '47', 641, '2021-08-01', '2021-08-02', NULL),
(1145, '18A', '2021-08-adv', '18A2021-08-adv', 47, 'cheque', '', '47', 892, '2021-08-01', '2021-09-09', NULL),
(1146, '18F', '2021-08-adv', '18F2021-08-adv', 37, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1147, '23H', '2021-08-adv', '23H2021-08-adv', 47, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1148, '24A', '2021-08-adv', '24A2021-08-adv', 47, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1149, '25B', '2021-08-adv', '25B2021-08-adv', 37, NULL, NULL, NULL, NULL, '2021-08-01', NULL, NULL),
(1150, 'SHOP04', '2021-08-adv', 'SHOP042021-08-adv', 34, 'cash', '', '34', 818, '2021-08-01', '2021-09-02', NULL),
(1155, '10b', '2021-08-apart', '10b2021-08-apart', 37, 'cash', '', '37', 611, '2021-08-01', '2021-08-02', NULL),
(1157, '13G', '2021-09-adv', '13G2021-09-adv', 37, 'cheque', '', '37', 625, '2021-09-01', '2021-08-02', NULL),
(1160, 'SHOP05', '2021-08-apart', 'SHOP052021-08-apart', 774, 'cheque', '', '774', 630, '2021-08-01', '2021-08-02', NULL),
(1162, '16A', '2021-09-adv', '16A2021-09-adv', 47, 'cash', '', '47', 641, '2021-09-01', '2021-08-02', NULL),
(1163, 'SHOP07', '2021-08-apart', 'SHOP072021-08-apart', 379, 'cheque', '', '379', 681, '2021-08-01', '2021-08-06', NULL),
(1164, '16B', '2021-09', '16B2021-09', 780, 'cheque', '', '780', 694, '2021-09-01', '2021-08-10', NULL),
(1165, '16B', '2021-10', '16B2021-10', 780, 'cheque', '', '780', 694, '2021-10-01', '2021-08-10', NULL),
(1166, '16B', '2021-11', '16B2021-11', 780, 'cheque', '', '780', 694, '2021-11-01', '2021-08-10', NULL),
(1167, '16B', '2021-12', '16B2021-12', 780, 'cheque', '', '780', 694, '2021-12-01', '2021-08-10', NULL),
(1168, '09B', '2021-08-apart', '09B2021-08-apart', 743, 'auto', '', '743', 780, '2021-08-01', '2021-08-13', NULL),
(1169, '18G', '2021-09', '18G2021-09', 780, 'auto', '', '780', 782, '2021-09-01', '2021-08-13', NULL),
(1170, '01D', '2021-09', '01D2021-09', 979, 'cheque', '', '979', 791, '2021-09-01', '2021-08-30', NULL),
(1426, '01A', '2021-09', '01A2021-09', 979, 'auto', '', '979', 964, '2021-09-01', '2021-09-14', NULL),
(1427, '01B', '2021-09', '01B2021-09', 780, 'cheque', '', '780', 881, '2021-09-01', '2021-09-09', NULL),
(1428, '01C', '2021-09', '01C2021-09', 780, 'cheque', '', '780', 823, '2021-09-01', '2021-09-02', NULL),
(1430, '01E', '2021-09', '01E2021-09', 979, 'cheque', '', '979', 844, '2021-09-01', '2021-09-07', NULL),
(1431, '01F', '2021-09', '01F2021-09', 780, 'auto', '', '780', 972, '2021-09-01', '2021-09-14', NULL),
(1432, '01G', '2021-09', '01G2021-09', 780, 'auto', '', '780', 981, '2021-09-01', '2021-09-14', NULL),
(1433, '01H', '2021-09', '01H2021-09', 979, 'auto', '', '979', 982, '2021-09-01', '2021-09-14', NULL),
(1434, '02A', '2021-09', '02A2021-09', 979, 'cash', '', '979', 837, '2021-09-01', '2021-09-02', NULL),
(1435, '02B', '2021-09', '02B2021-09', 780, 'cheque', '', '780', 929, '2021-09-01', '2021-09-27', NULL),
(1436, '02C', '2021-09', '02C2021-09', 780, 'cash', '', '780', 826, '2021-09-01', '2021-09-02', NULL),
(1437, '02D', '2021-09', '02D2021-09', 979, 'cash', '', '979', 827, '2021-09-01', '2021-09-02', NULL),
(1438, '02E', '2021-09', '02E2021-09', 979, 'cheque', '', '979', 872, '2021-09-01', '2021-09-07', NULL),
(1439, '02F', '2021-09', '02F2021-09', 780, 'cheque', '', '780', 845, '2021-09-01', '2021-09-07', NULL),
(1440, '02G', '2021-09', '02G2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1442, '03A', '2021-09', '03A2021-09', 979, 'auto', '', '979', 945, '2021-09-01', '2021-09-14', NULL),
(1443, '03B', '2021-09', '03B2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1444, '03C', '2021-09', '03C2021-09', 780, 'cheque', '', '780', 846, '2021-09-01', '2021-09-07', NULL),
(1445, '03D', '2021-09', '03D2021-09', 979, 'auto', '', '979', 986, '2021-09-01', '2021-09-14', NULL),
(1446, '03E', '2021-09', '03E2021-09', 979, 'auto', '', '979', 940, '2021-09-01', '2021-09-14', NULL),
(1447, '03F', '2021-09', '03F2021-09', 780, 'cheque', '', '780', 918, '2021-09-01', '2021-09-20', NULL),
(1448, '03G', '2021-09', '03G2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1449, '03H', '2021-09', '03H2021-09', 979, 'auto', '', '979', 969, '2021-09-01', '2021-09-14', NULL),
(1450, '04A', '2021-09', '04A2021-09', 979, 'cheque', '', '979', 882, '2021-09-01', '2021-09-09', NULL),
(1451, '04B', '2021-09', '04B2021-09', 780, 'cheque', '', '780', 847, '2021-09-01', '2021-09-07', NULL),
(1452, '04C', '2021-09', '04C2021-09', 780, 'cheque', '', '780', 825, '2021-09-01', '2021-09-02', NULL),
(1453, '04D', '2021-09', '04D2021-09', 979, 'cash', '', '979', 834, '2021-09-01', '2021-09-02', NULL),
(1454, '04E', '2021-09', '04E2021-09', 979, 'cheque', '', '979', 813, '2021-09-01', '2021-09-01', NULL),
(1455, '04F', '2021-09', '04F2021-09', 780, 'cheque', '', '780', 829, '2021-09-01', '2021-09-02', NULL),
(1456, '04G', '2021-09', '04G2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1457, '04H', '2021-09', '04H2021-09', 979, 'cheque', '', '979', 916, '2021-09-01', '2021-09-20', NULL),
(1458, '05A', '2021-09', '05A2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1459, '05B', '2021-09', '05B2021-09', 780, 'cheque', '', '780', 900, '2021-09-01', '2021-09-13', NULL),
(1460, '05C', '2021-09', '05C2021-09', 780, 'cheque', '', '780', 873, '2021-09-01', '2021-09-07', NULL),
(1461, '05D', '2021-09', '05D2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1462, '05E', '2021-09', '05E2021-09', 979, 'cheque', '', '979', 906, '2021-09-01', '2021-09-20', NULL),
(1463, '05F', '2021-09', '05F2021-09', 780, 'auto', '', '780', 951, '2021-09-01', '2021-09-14', NULL),
(1464, '05G', '2021-09', '05G2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL);
INSERT INTO `Total` (`ID`, `Unit`, `ManageFeeDate`, `DCode`, `Amount`, `Method`, `BCQ`, `Paid`, `RCode`, `DemandDate`, `ReceivedDate`, `BankInDate`) VALUES
(1465, '05H', '2021-09', '05H2021-09', 979, 'cheque', '', '979', 880, '2021-09-01', '2021-09-09', NULL),
(1466, '06A', '2021-09', '06A2021-09', 979, 'cheque', '', '979', 838, '2021-09-01', '2021-09-02', NULL),
(1467, '06B', '2021-09', '06B2021-09', 780, 'cheque', '', '780', 874, '2021-09-01', '2021-09-07', NULL),
(1468, '06C', '2021-09', '06C2021-09', 780, 'cheque', '', '780', 816, '2021-09-01', '2021-09-01', NULL),
(1469, '06D', '2021-09', '06D2021-09', 979, 'cheque', '', '979', 821, '2021-09-01', '2021-09-02', NULL),
(1470, '06E', '2021-09', '06E2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1471, '06F', '2021-09', '06F2021-09', 780, 'cheque', '', '780', 808, '2021-09-01', '2021-09-01', NULL),
(1472, '06G', '2021-09', '06G2021-09', 780, 'cheque', '', '780', 867, '2021-09-01', '2021-09-07', NULL),
(1473, '06H', '2021-09', '06H2021-09', 979, 'cheque', '', '979', 807, '2021-09-01', '2021-09-01', NULL),
(1474, '07A', '2021-09', '07A2021-09', 979, 'cheque', '', '979', 908, '2021-09-01', '2021-09-20', NULL),
(1476, '07C', '2021-09', '07C2021-09', 780, 'cheque', '', '780', 859, '2021-09-01', '2021-09-07', NULL),
(1477, '07D', '2021-09', '07D2021-09', 979, 'auto', '', '979', 966, '2021-09-01', '2021-09-14', NULL),
(1478, '07E', '2021-09', '07E2021-09', 979, 'cheque', '', '979', 875, '2021-09-01', '2021-09-07', NULL),
(1479, '07F', '2021-09', '07F2021-09', 780, 'auto', '', '780', 946, '2021-09-01', '2021-09-14', NULL),
(1480, '07G', '2021-09', '07G2021-09', 780, 'cheque', '', '780', 839, '2021-09-01', '2021-09-02', NULL),
(1481, '07H', '2021-09', '07H2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1482, '08A', '2021-09', '08A2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1483, '08B', '2021-09', '08B2021-09', 780, 'auto', '', '780', 973, '2021-09-01', '2021-09-14', NULL),
(1484, '08C', '2021-09', '08C2021-09', 780, 'cheque', '', '780', 854, '2021-09-01', '2021-09-07', NULL),
(1485, '08D', '2021-09', '08D2021-09', 979, 'auto', '', '979', 977, '2021-09-01', '2021-09-14', NULL),
(1486, '08E', '2021-09', '08E2021-09', 979, 'cheque', '', '979', 833, '2021-09-01', '2021-09-02', NULL),
(1487, '08F', '2021-09', '08F2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1488, '08G', '2021-09', '08G2021-09', 780, 'cheque', '', '780', 901, '2021-09-01', '2021-09-13', NULL),
(1489, '08H', '2021-09', '08H2021-09', 979, 'cash', '', '979', 904, '2021-09-01', '2021-09-18', NULL),
(1490, '09A', '2021-09', '09A2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1491, '09B', '2021-09', '09B2021-09', 780, 'auto', '', '780', 984, '2021-09-01', '2021-09-14', NULL),
(1492, '09C', '2021-09', '09C2021-09', 780, 'cheque', '', '780', 830, '2021-09-01', '2021-09-02', NULL),
(1493, '09D', '2021-09', '09D2021-09', 979, 'cheque', '', '979', 922, '2021-09-01', '2021-09-27', NULL),
(1494, '09E', '2021-09', '09E2021-09', 979, 'cash', '', '979', 809, '2021-09-01', '2021-09-01', NULL),
(1495, '09F', '2021-09', '09F2021-09', 780, 'auto', '', '780', 950, '2021-09-01', '2021-09-14', NULL),
(1496, '09G', '2021-09', '09G2021-09', 780, 'cheque', '', '780', 817, '2021-09-01', '2021-09-02', NULL),
(1497, '09H', '2021-09', '09H2021-09', 979, 'cheque', '', '979', 931, '2021-09-01', '2021-09-27', NULL),
(1498, '10A', '2021-09', '10A2021-09', 979, 'cheque', '', '979', 801, '2021-09-01', '2021-09-01', NULL),
(1499, '10B', '2021-09', '10B2021-09', 780, 'cheque', '', '780', 831, '2021-09-01', '2021-09-02', NULL),
(1500, '10C', '2021-09', '10C2021-09', 780, 'auto', '', '780', 965, '2021-09-01', '2021-09-14', NULL),
(1501, '10D', '2021-09', '10D2021-09', 979, 'cheque', '', '979', 822, '2021-09-01', '2021-09-02', NULL),
(1502, '10E', '2021-09', '10E2021-09', 979, 'cheque', '', '979', 841, '2021-09-01', '2021-09-02', NULL),
(1503, '10F', '2021-09', '10F2021-09', 780, 'cheque', '', '780', 932, '2021-09-01', '2021-09-27', NULL),
(1504, '10G', '2021-09', '10G2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1505, '10H', '2021-09', '10H2021-09', 979, 'cheque', '', '979', 915, '2021-09-01', '2021-09-20', NULL),
(1506, '11A', '2021-09', '11A2021-09', 979, 'cheque', '', '979', 803, '2021-09-01', '2021-09-01', NULL),
(1508, '11C', '2021-09', '11C2021-09', 780, 'cheque', '', '780', 800, '2021-09-01', '2021-09-01', NULL),
(1509, '11D', '2021-09', '11D2021-09', 979, 'cheque', '', '979', 804, '2021-09-01', '2021-09-01', NULL),
(1510, '11E', '2021-09', '11E2021-09', 979, 'auto', '', '979', 983, '2021-09-01', '2021-09-14', NULL),
(1511, '11F', '2021-09', '11F2021-09', 780, 'cheque', '', '780', 930, '2021-09-01', '2021-09-27', NULL),
(1512, '11G', '2021-09', '11G2021-09', 780, 'cheque', '', '780', 876, '2021-09-01', '2021-09-09', NULL),
(1513, '11H', '2021-09', '11H2021-09', 979, 'auto', '', '979', 952, '2021-09-01', '2021-09-14', NULL),
(1514, '12A', '2021-09', '12A2021-09', 979, 'cheque', '', '979', 843, '2021-09-01', '2021-09-07', NULL),
(1515, '12B', '2021-09', '12B2021-09', 780, 'auto', '', '780', 968, '2021-09-01', '2021-09-14', NULL),
(1516, '12C', '2021-09', '12C2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1517, '12D', '2021-09', '12D2021-09', 979, 'auto', '', '979', 954, '2021-09-01', '2021-09-14', NULL),
(1518, '12E', '2021-09', '12E2021-09', 979, 'cheque', '', '979', 920, '2021-09-01', '2021-09-27', NULL),
(1519, '12F', '2021-09', '12F2021-09', 780, 'auto', '', '780', 961, '2021-09-01', '2021-09-14', NULL),
(1520, '12G', '2021-09', '12G2021-09', 780, 'cheque', '', '780', 870, '2021-09-01', '2021-09-07', NULL),
(1521, '12H', '2021-09', '12H2021-09', 979, 'auto', '', '979', 985, '2021-09-01', '2021-09-14', NULL),
(1523, '13B', '2021-09', '13B2021-09', 780, 'auto', '', '780', 963, '2021-09-01', '2021-09-14', NULL),
(1524, '13C', '2021-09', '13C2021-09', 780, 'cheque', '', '780', 869, '2021-09-01', '2021-09-07', NULL),
(1525, '13D', '2021-09', '13D2021-09', 979, 'cheque', '', '979', 919, '2021-09-01', '2021-09-27', NULL),
(1526, '13E', '2021-09', '13E2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1527, '13F', '2021-09', '13F2021-09', 780, 'cheque', '', '780', 921, '2021-09-01', '2021-09-27', NULL),
(1529, '13H', '2021-09', '13H2021-09', 979, 'cheque', '', '979', 857, '2021-09-01', '2021-09-07', NULL),
(1530, '14A', '2021-09', '14A2021-09', 979, 'cheque', '', '979', 861, '2021-09-01', '2021-09-07', NULL),
(1531, '14B', '2021-09', '14B2021-09', 780, 'cheque', '', '780', 848, '2021-09-01', '2021-09-07', NULL),
(1532, '14C', '2021-09', '14C2021-09', 780, 'cheque', '', '780', 923, '2021-09-01', '2021-09-27', NULL),
(1533, '14D', '2021-09', '14D2021-09', 979, 'cheque', '', '979', 891, '2021-09-01', '2021-09-09', NULL),
(1534, '14E', '2021-09', '14E2021-09', 979, 'cheque', '', '979', 868, '2021-09-01', '2021-09-07', NULL),
(1535, '14F', '2021-09', '14F2021-09', 780, 'auto', '', '780', 948, '2021-09-01', '2021-09-14', NULL),
(1536, '14G', '2021-09', '14G2021-09', 780, 'auto', '', '780', 975, '2021-09-01', '2021-09-14', NULL),
(1537, '14H', '2021-09', '14H2021-09', 979, 'cheque', '', '979', 934, '2021-09-01', '2021-09-27', NULL),
(1538, '15A', '2021-09', '15A2021-09', 979, 'cheque', '', '979', 910, '2021-09-01', '2021-09-20', NULL),
(1539, '15B', '2021-09', '15B2021-09', 780, 'cheque', '', '780', 832, '2021-09-01', '2021-09-02', NULL),
(1540, '15C', '2021-09', '15C2021-09', 780, 'cheque', '', '780', 902, '2021-09-01', '2021-09-13', NULL),
(1541, '15D', '2021-09', '15D2021-09', 979, 'cheque', '', '979', 835, '2021-09-01', '2021-09-02', NULL),
(1542, '15E', '2021-09', '15E2021-09', 979, 'cheque', '', '979', 883, '2021-09-01', '2021-09-09', NULL),
(1543, '15F', '2021-09', '15F2021-09', 780, 'cheque', '', '780', 917, '2021-09-01', '2021-09-20', NULL),
(1544, '15G', '2021-09', '15G2021-09', 780, 'auto', '', '780', 979, '2021-09-01', '2021-09-14', NULL),
(1545, '15H', '2021-09', '15H2021-09', 979, 'auto', '', '979', 939, '2021-09-01', '2021-09-14', NULL),
(1548, '16C', '2021-09', '16C2021-09', 780, 'auto', '', '780', 957, '2021-09-01', '2021-09-14', NULL),
(1549, '16D', '2021-09', '16D2021-09', 979, 'auto', '', '979', 974, '2021-09-01', '2021-09-14', NULL),
(1550, '16E', '2021-09', '16E2021-09', 979, 'auto', '', '979', 959, '2021-09-01', '2021-09-14', NULL),
(1551, '16F', '2021-09', '16F2021-09', 780, 'auto', '', '780', 980, '2021-09-01', '2021-09-14', NULL),
(1552, '16G', '2021-09', '16G2021-09', 780, 'cheque', '', '780', 842, '2021-09-01', '2021-09-02', NULL),
(1553, '16H', '2021-09', '16H2021-09', 979, 'cheque', '', '979', 798, '2021-09-01', '2021-09-01', NULL),
(1554, '17A', '2021-09', '17A2021-09', 979, 'cheque', '', '979', 899, '2021-09-01', '2021-09-13', NULL),
(1555, '17B', '2021-09', '17B2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1556, '17C', '2021-09', '17C2021-09', 780, 'cheque', '', '780', 860, '2021-09-01', '2021-09-07', NULL),
(1557, '17D', '2021-09', '17D2021-09', 979, 'cheque', '', '979', 884, '2021-09-01', '2021-09-09', NULL),
(1558, '17E', '2021-09', '17E2021-09', 979, 'cheque', '', '979', 805, '2021-09-01', '2021-09-01', NULL),
(1559, '17F', '2021-09', '17F2021-09', 780, 'auto', '', '780', 978, '2021-09-01', '2021-09-14', NULL),
(1560, '17G', '2021-09', '17G2021-09', 780, 'cheque', '', '780', 903, '2021-09-01', '2021-09-13', NULL),
(1561, '17H', '2021-09', '17H2021-09', 979, 'cheque', '', '979', 849, '2021-09-01', '2021-09-07', NULL),
(1563, '18B', '2021-09', '18B2021-09', 780, 'cheque', '', '780', 865, '2021-09-01', '2021-09-07', NULL),
(1564, '18C', '2021-09', '18C2021-09', 780, 'cheque', '', '780', 862, '2021-09-01', '2021-09-07', NULL),
(1565, '18D', '2021-09', '18D2021-09', 979, 'cheque', '', '979', 894, '2021-09-01', '2021-09-09', NULL),
(1566, '18E', '2021-09', '18E2021-09', 979, 'cheque', '', '979', 885, '2021-09-01', '2021-09-09', NULL),
(1569, '18H', '2021-09', '18H2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1570, '19A', '2021-09', '19A2021-09', 979, 'cheque', '', '979', 893, '2021-09-01', '2021-09-09', NULL),
(1571, '19B', '2021-09', '19B2021-09', 780, 'cheque', '', '780', 888, '2021-09-01', '2021-09-09', NULL),
(1572, '19C', '2021-09', '19C2021-09', 780, 'cash', '', '780', 802, '2021-09-01', '2021-09-01', NULL),
(1573, '19D', '2021-09', '19D2021-09', 979, 'cash', '', '979', 811, '2021-09-01', '2021-09-01', NULL),
(1574, '19E', '2021-09', '19E2021-09', 979, 'cheque', '', '979', 855, '2021-09-01', '2021-09-07', NULL),
(1575, '19F', '2021-09', '19F2021-09', 780, 'cheque', '', '780', 907, '2021-09-01', '2021-09-20', NULL),
(1576, '19G', '2021-09', '19G2021-09', 780, 'auto', '', '780', 976, '2021-09-01', '2021-09-14', NULL),
(1577, '19H', '2021-09', '19H2021-09', 979, 'cash', '', '979', 890, '2021-09-01', '2021-09-09', NULL),
(1578, '20A', '2021-09', '20A2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1579, '20B', '2021-09', '20B2021-09', 780, 'cash', '', '780', 812, '2021-09-01', '2021-09-01', NULL),
(1580, '20C', '2021-09', '20C2021-09', 780, 'cheque', '', '780', 850, '2021-09-01', '2021-09-07', NULL),
(1581, '20D', '2021-09', '20D2021-09', 979, 'cheque', '', '979', 864, '2021-09-01', '2021-09-07', NULL),
(1582, '20E', '2021-09', '20E2021-09', 979, 'cheque', '', '979', 851, '2021-09-01', '2021-09-07', NULL),
(1583, '20F', '2021-09', '20F2021-09', 780, 'cheque', '', '780', 924, '2021-09-01', '2021-09-27', NULL),
(1584, '20G', '2021-09', '20G2021-09', 780, 'cheque', '', '780', 877, '2021-09-01', '2021-09-09', NULL),
(1585, '20H', '2021-09', '20H2021-09', 979, 'cheque', '', '979', 886, '2021-09-01', '2021-09-09', NULL),
(1586, '21A', '2021-09', '21A2021-09', 979, 'cheque', '', '979', 806, '2021-09-01', '2021-09-01', NULL),
(1587, '21B', '2021-09', '21B2021-09', 780, 'auto', '', '780', 958, '2021-09-01', '2021-09-14', NULL),
(1588, '21C', '2021-09', '21C2021-09', 780, 'cheque', '', '780', 852, '2021-09-01', '2021-09-07', NULL),
(1589, '21D', '2021-09', '21D2021-09', 979, 'cheque', '', '979', 912, '2021-09-01', '2021-09-20', NULL),
(1590, '21E', '2021-09', '21E2021-09', 979, 'cheque', '', '979', 856, '2021-09-01', '2021-09-07', NULL),
(1591, '21F', '2021-09', '21F2021-09', 780, 'cheque', '', '780', 853, '2021-09-01', '2021-09-07', NULL),
(1592, '21G', '2021-09', '21G2021-09', 780, 'cheque', '', '780', 898, '2021-09-01', '2021-09-13', NULL),
(1593, '21H', '2021-09', '21H2021-09', 979, 'auto', '', '979', 949, '2021-09-01', '2021-09-14', NULL),
(1594, '22A', '2021-09', '22A2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1595, '22B', '2021-09', '22B2021-09', 780, 'cheque', '', '780', 820, '2021-09-01', '2021-09-02', NULL),
(1596, '22C', '2021-09', '22C2021-09', 780, 'auto', '', '780', 942, '2021-09-01', '2021-09-14', NULL),
(1597, '22D', '2021-09', '22D2021-09', 979, 'cheque', '', '979', 836, '2021-09-01', '2021-09-02', NULL),
(1598, '22E', '2021-09', '22E2021-09', 979, 'cheque', '', '979', 913, '2021-09-01', '2021-09-20', NULL),
(1599, '22F', '2021-09', '22F2021-09', 780, 'cheque', '', '780', 925, '2021-09-01', '2021-09-27', NULL),
(1600, '22G', '2021-09', '22G2021-09', 780, 'auto', '', '780', 967, '2021-09-01', '2021-09-14', NULL),
(1601, '22H', '2021-09', '22H2021-09', 979, 'cheque', '', '979', 926, '2021-09-01', '2021-09-27', NULL),
(1602, '23A', '2021-09', '23A2021-09', 979, 'cheque', '', '979', 933, '2021-09-01', '2021-09-27', NULL),
(1603, '23B', '2021-09', '23B2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1604, '23C', '2021-09', '23C2021-09', 780, 'cash', '', '780', 858, '2021-09-01', '2021-09-07', NULL),
(1605, '23D', '2021-09', '23D2021-09', 979, 'cheque', '', '979', 914, '2021-09-01', '2021-09-20', NULL),
(1606, '23E', '2021-09', '23E2021-09', 979, 'auto', '', '979', 962, '2021-09-01', '2021-09-14', NULL),
(1607, '23F', '2021-09', '23F2021-09', 780, 'cheque', '', '780', 896, '2021-09-01', '2021-09-13', NULL),
(1608, '23G', '2021-09', '23G2021-09', 780, 'cheque', '', '780', 928, '2021-09-01', '2021-09-27', NULL),
(1610, '24A', '2021-09', '24A2021-09', 979, 'cheque', '', '979', 799, '2021-09-01', '2021-09-01', NULL),
(1611, '24B', '2021-09', '24B2021-09', 780, 'cheque', '', '780', 909, '2021-09-01', '2021-09-20', NULL),
(1612, '24C', '2021-09', '24C2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1613, '24D', '2021-09', '24D2021-09', 979, 'auto', '', '979', 943, '2021-09-01', '2021-09-14', NULL),
(1614, '24E', '2021-09', '24E2021-09', 979, 'auto', '', '979', 955, '2021-09-01', '2021-09-14', NULL),
(1615, '24F', '2021-09', '24F2021-09', 780, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1616, '24G', '2021-09', '24G2021-09', 780, 'cheque', '', '780', 871, '2021-09-01', '2021-09-07', NULL),
(1617, '24H', '2021-09', '24H2021-09', 979, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1618, '25A', '2021-09', '25A2021-09', 979, 'auto', '', '979', 953, '2021-09-01', '2021-09-14', NULL),
(1619, '25B', '2021-09', '25B2021-09', 780, 'cheque', '', '780', 897, '2021-09-01', '2021-09-13', NULL),
(1620, '25C', '2021-09', '25C2021-09', 780, 'cheque', '', '780', 887, '2021-09-01', '2021-09-09', NULL),
(1621, '25D', '2021-09', '25D2021-09', 979, 'auto', '', '979', 960, '2021-09-01', '2021-09-14', NULL),
(1622, '25E', '2021-09', '25E2021-09', 979, 'cheque', '', '979', 863, '2021-09-01', '2021-09-07', NULL),
(1623, '25F', '2021-09', '25F2021-09', 780, 'auto', '', '780', 944, '2021-09-01', '2021-09-14', NULL),
(1624, '25G', '2021-09', '25G2021-09', 780, 'cheque', '', '780', 889, '2021-09-01', '2021-09-09', NULL),
(1625, '25H', '2021-09', '25H2021-09', 979, 'cheque', '', '979', 810, '2021-09-01', '2021-09-01', NULL),
(1626, 'SHOP01', '2021-09', 'SHOP012021-09', 813, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1627, 'SHOP02', '2021-09', 'SHOP022021-09', 747, 'auto', '', '747', 971, '2021-09-01', '2021-09-14', NULL),
(1628, 'SHOP03', '2021-09', 'SHOP032021-09', 664, 'cheque', '', '664', 879, '2021-09-01', '2021-09-09', NULL),
(1629, 'SHOP04', '2021-09', 'SHOP042021-09', 713, 'cash', '', '713', 818, '2021-09-01', '2021-09-02', NULL),
(1630, 'SHOP05', '2021-09', 'SHOP052021-09', 813, 'cheque', '', '813', 814, '2021-09-01', '2021-09-01', NULL),
(1631, 'SHOP06', '2021-09', 'SHOP062021-09', 465, 'cheque', '', '465', 824, '2021-09-01', '2021-09-02', NULL),
(1632, 'SHOP07', '2021-09', 'SHOP072021-09', 398, 'cheque', '', '398', 866, '2021-09-01', '2021-09-07', NULL),
(1633, 'SHOP08', '2021-09', 'SHOP082021-09', 465, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1634, 'SHOP09', '2021-09', 'SHOP092021-09', 530, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1635, 'SHOP10', '2021-09', 'SHOP102021-09', 896, 'cheque', '', '896', 927, '2021-09-01', '2021-09-27', NULL),
(1636, 'SHOP11', '2021-09', 'SHOP112021-09', 1061, 'cheque', '', '1061', 911, '2021-09-01', '2021-09-20', NULL),
(1637, 'SHOP12', '2021-09', 'SHOP122021-09', 878, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1638, 'SHOP13', '2021-09', 'SHOP132021-09', 730, 'cheque', '', '730', 878, '2021-09-01', '2021-09-09', NULL),
(1681, '02H', '2021-09-adv', '02H2021-09-adv', 47, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1682, '07B', '2021-09-adv', '07B2021-09-adv', 37, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1683, '11B', '2021-09-adv', '11B2021-09-adv', 37, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1684, '13A', '2021-09-adv', '13A2021-09-adv', 47, 'cheque', '', '47', 840, '2021-09-01', '2021-09-02', NULL),
(1685, '18A', '2021-09-adv', '18A2021-09-adv', 47, 'cheque', '', '47', 892, '2021-09-01', '2021-09-09', NULL),
(1686, '18F', '2021-09-adv', '18F2021-09-adv', 37, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1687, '23H', '2021-09-adv', '23H2021-09-adv', 47, NULL, NULL, NULL, NULL, '2021-09-01', NULL, NULL),
(1690, '18A', '2021-10-adv', '18A2021-10-adv', 47, 'cheque', '', '47', 892, '2021-10-01', '2021-09-09', NULL),
(1692, '18A', '2021-11-adv', '18A2021-11-adv', 47, 'cheque', '', '47', 892, '2021-11-01', '2021-09-09', NULL),
(1694, '18A', '2021-12-adv', '18A2021-12-adv', 47, 'cheque', '', '47', 892, '2021-12-01', '2021-09-09', NULL),
(1697, '10H', '2021-10', '10H2021-10', 979, 'cheque', '', '979', 915, '2021-10-01', '2021-09-20', NULL),
(1698, '10H', '2021-12', '10H2021-12', 979, 'cheque', '', '979', 915, '2021-12-01', '2021-09-20', NULL),
(1699, '04H', '2021-10', '04H2021-10', 979, 'cheque', '', '979', 916, '2021-10-01', '2021-09-20', NULL),
(1700, '04H', '2021-11', '04H2021-11', 979, 'cheque', '', '979', 916, '2021-11-01', '2021-09-20', NULL),
(1701, '04H', '2021-12', '04H2021-12', 979, 'cheque', '', '979', 916, '2021-12-01', '2021-09-20', NULL),
(1702, '04H', '2022-01', '04H2022-01', 979, 'cheque', '', '979', 916, '2022-01-01', '2021-09-20', NULL),
(1703, '04H', '2022-02', '04H2022-02', 979, 'cheque', '', '979', 916, '2022-02-01', '2021-09-20', NULL),
(1705, '23G', '2021-10', '23G2021-10', 780, 'cheque', '', '780', 928, '2021-10-01', '2021-09-27', NULL),
(1706, '02B', '2022-10', '02B2022-10', 780, 'cheque', '', '780', 929, '2022-10-01', '2021-09-27', NULL),
(1707, '18G', '2021-10', '18G2021-10', 780, 'auto', '', '780', 956, '2021-10-01', '2021-09-14', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `Users`
--

INSERT INTO `Users` (`id`, `username`, `role`) VALUES
(1, 'admin', 's'),
(2, 'admin', 's');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `AllUnits`
--
ALTER TABLE `AllUnits`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Unit` (`Unit`);

--
-- 資料表索引 `Cal`
--
ALTER TABLE `Cal`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Cancel`
--
ALTER TABLE `Cancel`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Receipt`
--
ALTER TABLE `Receipt`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `Total`
--
ALTER TABLE `Total`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `DCode` (`DCode`);

--
-- 資料表索引 `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `AllUnits`
--
ALTER TABLE `AllUnits`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Cal`
--
ALTER TABLE `Cal`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Cancel`
--
ALTER TABLE `Cancel`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Receipt`
--
ALTER TABLE `Receipt`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1130;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Total`
--
ALTER TABLE `Total`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1708;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
