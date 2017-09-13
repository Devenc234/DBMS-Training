-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ecommerce` ;
USE `Ecommerce` ;

-- -----------------------------------------------------
-- Table `Ecommerce`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Customer` (
  `idCustomer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `Customer_addr` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`idCustomer` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Supplier` (
  `idSupplier` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(45) NOT NULL,
  `Supplier_addr` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE INDEX `idSupplier_UNIQUE` (`idSupplier` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Items` (
  `idItems` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplierID` INT UNSIGNED NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  `item_price` FLOAT UNSIGNED NOT NULL,
  `item_rating` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idItems`, `supplierID`),
  UNIQUE INDEX `idItems_UNIQUE` (`idItems` ASC),
  INDEX `fk_Items_1_idx` (`supplierID` ASC),
  CONSTRAINT `fk_Items_1`
    FOREIGN KEY (`supplierID`)
    REFERENCES `Ecommerce`.`Supplier` (`idSupplier`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Order` (
  `idOrder` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `order_date` DATETIME NOT NULL,
  `Order_payementInfo` ENUM('Y', 'N') NOT NULL,
  PRIMARY KEY (`idOrder`, `customer_id`),
  UNIQUE INDEX `idOrder_UNIQUE` (`idOrder` ASC),
  INDEX `fk_Order_1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_Order_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Ecommerce`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`OrderItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`OrderItem` (
  `idOrderItem` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderID` INT UNSIGNED NOT NULL,
  `itemID` INT UNSIGNED NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  `price` FLOAT NOT NULL,
  PRIMARY KEY (`idOrderItem`, `orderID`, `itemID`),
  UNIQUE INDEX `idOrderItem_UNIQUE` (`idOrderItem` ASC),
  INDEX `fk_OrderItem_2_idx` (`itemID` ASC),
  INDEX `fk_OrderItem_1_idx` (`orderID` ASC),
  CONSTRAINT `fk_OrderItem_1`
    FOREIGN KEY (`orderID`)
    REFERENCES `Ecommerce`.`Order` (`idOrder`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderItem_2`
    FOREIGN KEY (`itemID`)
    REFERENCES `Ecommerce`.`Items` (`idItems`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
