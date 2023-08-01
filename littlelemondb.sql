-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`customers` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers` (
  `Customer ID` INT NOT NULL AUTO_INCREMENT,
  `Customer name` VARCHAR(255) NOT NULL,
  `City` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  `Postal Code` INT NOT NULL,
  `Country Code` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Customer ID`, `Customer name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`menu` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu` (
  `Row Number` INT NOT NULL AUTO_INCREMENT,
  `Course Name` VARCHAR(100) NOT NULL,
  `Cuisine Name` VARCHAR(100) NOT NULL,
  `Starter Name` VARCHAR(100) NOT NULL,
  `Desert Name` VARCHAR(100) NOT NULL,
  `Drink` VARCHAR(100) NOT NULL,
  `Sides` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Row Number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`orders` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `Order ID` INT NOT NULL AUTO_INCREMENT,
  `Order Date` DATE NOT NULL,
  `Cost` DECIMAL(5,2) NOT NULL,
  `Quantity` INT NOT NULL,
  `Customer ID` INT NOT NULL,
  `Row Number` INT NOT NULL,
  `Sales` INT NOT NULL,
  `Discount` INT NOT NULL,
  PRIMARY KEY (`Order ID`),
  INDEX `Customer_ID_idx` (`Customer ID` ASC) VISIBLE,
  INDEX `Menu ID_idx` (`Row Number` ASC) VISIBLE,
  CONSTRAINT `Customer ID`
    FOREIGN KEY (`Customer ID`)
    REFERENCES `littlelemondb`.`customers` (`Customer ID`),
  CONSTRAINT `Row Number`
    FOREIGN KEY (`Row Number`)
    REFERENCES `littlelemondb`.`menu` (`Row Number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`order_delivery_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`order_delivery_status` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`order_delivery_status` (
  `Delivery ID` INT NOT NULL AUTO_INCREMENT,
  `Order ID` INT NOT NULL,
  `Delivery Date` DATE NOT NULL,
  `Delivery Cost` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`Delivery ID`),
  INDEX `Order_ID_idx` (`Order ID` ASC) VISIBLE,
  CONSTRAINT `Order_ID`
    FOREIGN KEY (`Order ID`)
    REFERENCES `littlelemondb`.`orders` (`Order ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
