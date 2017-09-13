-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema HotelBookingModel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema HotelBookingModel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HotelBookingModel` DEFAULT CHARACTER SET latin1 ;
USE `HotelBookingModel` ;

-- -----------------------------------------------------
-- Table `HotelBookingModel`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelBookingModel`.`Customer` (
  `idCustomer` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Customer_name` VARCHAR(45) NOT NULL,
  `Customer_phNo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`idCustomer` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `HotelBookingModel`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelBookingModel`.`Hotel` (
  `idHotel` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Hotel_name` VARCHAR(45) NOT NULL,
  `Hotel_addr` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHotel`),
  UNIQUE INDEX `idHotel_UNIQUE` (`idHotel` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `HotelBookingModel`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelBookingModel`.`Booking` (
  `customerID` INT(10) UNSIGNED NOT NULL,
  `BookingDate` DATE NOT NULL,
  `hotelID` INT(10) UNSIGNED NOT NULL,
  `BookingType` VARCHAR(10) NOT NULL,
  `BookingPrice` FLOAT NOT NULL,
  PRIMARY KEY (`customerID`, `BookingDate`, `hotelID`),
  INDEX `fk_Booking_2_idx` (`hotelID` ASC),
  CONSTRAINT `fk_Booking_1`
    FOREIGN KEY (`customerID`)
    REFERENCES `HotelBookingModel`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Booking_2`
    FOREIGN KEY (`hotelID`)
    REFERENCES `HotelBookingModel`.`Hotel` (`idHotel`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
