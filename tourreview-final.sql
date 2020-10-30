-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- 생성 시간: 19-11-24 03:25
-- 서버 버전: 5.7.26
-- PHP 버전: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `tourreview`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` varchar(20) NOT NULL DEFAULT '',
  `adminname` varchar(20) NOT NULL,
  `adminpassword` varchar(20) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `admin`
--

INSERT INTO `admin` (`adminId`, `adminname`, `adminpassword`) VALUES
('johnyun930', 'johnyun', 'yoowogur');

-- --------------------------------------------------------

--
-- 테이블 구조 `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `createdDate` varchar(20) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `reviewId` int(11) NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `reviewId` (`reviewId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 테이블 구조 `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 테이블 구조 `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` varchar(20) DEFAULT NULL,
  `reviewDescription` varchar(200) NOT NULL,
  `rating` int(5) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `locationId` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`reviewId`),
  KEY `userId` (`userId`),
  KEY `locationId` (`locationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 테이블 구조 `reviewimage`
--

DROP TABLE IF EXISTS `reviewimage`;
CREATE TABLE IF NOT EXISTS `reviewimage` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `imageName` varchar(200) NOT NULL,
  PRIMARY KEY (`reviewId`,`imageName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 테이블 구조 `siteuser`
--

DROP TABLE IF EXISTS `siteuser`;
CREATE TABLE IF NOT EXISTS `siteuser` (
  `userId` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `photo` varchar(20) NULL,
  `profile` varchar(100) NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phoneNum` varchar(20) NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `siteuser`
--

INSERT INTO `siteuser` (`userId`, `username`, `password`, `photo`, `profile`, `firstName`, `lastName`, `email`, `phoneNum`) VALUES
('dbswhd82', 'dbswhd82', 'dsjdsflkj', 'dbswhd82.png', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('john123', 'dbsjsdkj', 'sdfkdsjflk', 'dsjflksdjflkk', 'lsdfsdfjskl', 'fdsfsdjkljlk', 'fdsfsdkjsdkl', 'sdjfd@fsdfsdf', 'dsjfksdjlfks'),
('john12345', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('john123456', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('john12345678', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('john1234567890', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('john12345678901', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('johnyun', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('johnyun1', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('johnyun1234', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('johnyun12345', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('johnyun123456', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('johnyun1234567', 'john', 'dsjdsflkjk', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('yun1234', 'yun123', 'dsjdsflkj', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('yun12345', 'yun123', 'dsjdsflkj', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123'),
('yun123456', 'yun123', 'dsjdsflkj', '12312354', 'dsfkfdjklsdjklfsd', 'dasjklsdjlkj', 'fjsdkldfsklsdjlk', 'jfhskjdsjsdkjklj', '1123123');

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`reviewId`) REFERENCES `review` (`reviewId`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `siteuser` (`userId`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `siteuser` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`locationId`) REFERENCES `location` (`locationId`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `reviewimage`
--
ALTER TABLE `reviewimage`
  ADD CONSTRAINT `reviewimage_ibfk_1` FOREIGN KEY (`reviewId`) REFERENCES `review` (`reviewId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
