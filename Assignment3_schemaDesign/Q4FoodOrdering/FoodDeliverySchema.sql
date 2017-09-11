-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema FoodDelivery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FoodDelivery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FoodDelivery` ;
USE `FoodDelivery` ;

-- -----------------------------------------------------
-- Table `FoodDelivery`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`Restaurant` (
  `idRestaurant` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Restaurant_name` VARCHAR(45) NOT NULL,
  `Restaurant_addrID` INT NULL,
  PRIMARY KEY (`idRestaurant`),
  UNIQUE INDEX `idRestaurant_UNIQUE` (`idRestaurant` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`DeliveryPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`DeliveryPerson` (
  `idDeliveryPerson` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `DeliveryPerson_name` VARCHAR(45) NULL,
  `DeliveryPerson_mobileno` VARCHAR(10) NULL,
  PRIMARY KEY (`idDeliveryPerson`),
  UNIQUE INDEX `idDeliveryPerson_UNIQUE` (`idDeliveryPerson` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`Customer` (
  `idCustomer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Customer_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`idCustomer` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`CustomerRestaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`CustomerRestaurant` (
  `customerID` INT UNSIGNED NOT NULL,
  `restaurantID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`customerID`, `restaurantID`),
  INDEX `fk_CustomerRestaurant_2_idx` (`restaurantID` ASC),
  UNIQUE INDEX `customerID_UNIQUE` (`customerID` ASC),
  CONSTRAINT `fk_CustomerRestaurant_1`
    FOREIGN KEY (`customerID`)
    REFERENCES `FoodDelivery`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CustomerRestaurant_2`
    FOREIGN KEY (`restaurantID`)
    REFERENCES `FoodDelivery`.`Restaurant` (`idRestaurant`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`Order` (
  `idOrder` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customerID` INT UNSIGNED NOT NULL,
  `Order_deliveryboy` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idOrder`, `customerID`, `Order_deliveryboy`),
  UNIQUE INDEX `idOrder_UNIQUE` (`idOrder` ASC),
  INDEX `fk_Order_2_idx` (`Order_deliveryboy` ASC),
  INDEX `fk_Order_1_idx` (`customerID` ASC),
  CONSTRAINT `fk_Order_2`
    FOREIGN KEY (`Order_deliveryboy`)
    REFERENCES `FoodDelivery`.`DeliveryPerson` (`idDeliveryPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_1`
    FOREIGN KEY (`customerID`)
    REFERENCES `FoodDelivery`.`CustomerRestaurant` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`Items` (
  `idItems` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Item_name` VARCHAR(45) NOT NULL,
  `Item_price` FLOAT NOT NULL,
  `Item_description` VARCHAR(45) NULL,
  PRIMARY KEY (`idItems`),
  UNIQUE INDEX `idItems_UNIQUE` (`idItems` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`OrderItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`OrderItem` (
  `idOrderItem` INT UNSIGNED NOT NULL,
  `orderID` INT UNSIGNED NOT NULL,
  `itemID` INT UNSIGNED NOT NULL,
  `item_quantity` INT UNSIGNED NOT NULL,
  `discount` FLOAT NOT NULL DEFAULT 0.0,
  `OrderItem_price` FLOAT NOT NULL,
  PRIMARY KEY (`idOrderItem`, `orderID`),
  UNIQUE INDEX `idOrderItem_UNIQUE` (`idOrderItem` ASC),
  INDEX `fk_OrderItem_1_idx` (`orderID` ASC),
  INDEX `fk_OrderItem_2_idx` (`itemID` ASC),
  CONSTRAINT `fk_OrderItem_1`
    FOREIGN KEY (`orderID`)
    REFERENCES `FoodDelivery`.`Order` (`idOrder`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderItem_2`
    FOREIGN KEY (`itemID`)
    REFERENCES `FoodDelivery`.`Items` (`idItems`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FoodDelivery`.`RestaurantItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FoodDelivery`.`RestaurantItems` (
  `restaurantID` INT UNSIGNED NOT NULL,
  `itemID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`restaurantID`, `itemID`),
  INDEX `fk_RestaurantItems_1_idx` (`itemID` ASC),
  CONSTRAINT `fk_RestaurantItems_1`
    FOREIGN KEY (`itemID`)
    REFERENCES `FoodDelivery`.`Items` (`idItems`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_RestaurantItems_2`
    FOREIGN KEY (`restaurantID`)
    REFERENCES `FoodDelivery`.`Restaurant` (`idRestaurant`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
