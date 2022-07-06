-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 05 2022 г., 00:09
-- Версия сервера: 10.4.21-MariaDB
-- Версия PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car rent`
--
CREATE DATABASE IF NOT EXISTS `car rent` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `car rent`;

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `ID_Cars` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Release_date` year(4) NOT NULL,
  `Race` int(11) NOT NULL,
  `State(new,old)` text NOT NULL,
  `FID_Vendors` int(11) NOT NULL,
  `Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`ID_Cars`, `Name`, `Release_date`, `Race`, `State(new,old)`, `FID_Vendors`, `Price`) VALUES
(1211, 'Car1V1', 1950, 1, 'old', 218676, 24),
(1212, 'Car2V1', 1990, 1211, 'old', 218676, 50.87),
(2391, 'Car1V2', 2010, 1211, 'new', 393749, 180.8),
(3821, 'Car1V3', 2004, 1211, 'old', 826486, 30.15),
(3822, 'Car2V3', 1984, 1211, 'old', 826486, 41),
(3823, 'Car3V3', 2014, 2022, 'new', 826486, 75.5);

-- --------------------------------------------------------

--
-- Структура таблицы `rent`
--

CREATE TABLE `rent` (
  `FID_Car` int(11) NOT NULL,
  `Date_start` date NOT NULL,
  `Time_start` time NOT NULL,
  `Date_end` date NOT NULL,
  `Time_end` time NOT NULL,
  `Cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `rent`
--

INSERT INTO `rent` (`FID_Car`, `Date_start`, `Time_start`, `Date_end`, `Time_end`, `Cost`) VALUES
(1211, '2014-09-01', '12:00:00', '2014-10-01', '12:00:00', 134.89),
(1212, '2014-08-12', '08:00:00', '2014-09-25', '14:00:00', 45.5),
(3821, '2014-10-01', '12:00:00', '2014-12-01', '12:00:00', 100),
(3821, '2022-07-05', '00:00:00', '2022-07-10', '00:00:00', 137);

-- --------------------------------------------------------

--
-- Структура таблицы `vendors`
--

CREATE TABLE `vendors` (
  `ID_Vendors` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `vendors`
--

INSERT INTO `vendors` (`ID_Vendors`, `Name`) VALUES
(218676, 'Vendor1'),
(393749, 'Vendor2'),
(826486, 'Vendor3');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`ID_Cars`);

--
-- Индексы таблицы `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`ID_Vendors`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
