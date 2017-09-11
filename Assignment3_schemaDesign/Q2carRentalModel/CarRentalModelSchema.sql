-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema CRModel1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CRModel1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CRModel1` ;
USE `CRModel1` ;

-- -----------------------------------------------------
-- Table `CRModel1`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRModel1`.`Driver` (
  `idDriver` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Driver_name` VARCHAR(45) NOT NULL,
  `Driver_phoneNumber` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idDriver`),
  UNIQUE INDEX `idDriver_UNIQUE` (`idDriver` ASC),
  UNIQUE INDEX `Driver_phoneNumber_UNIQUE` (`Driver_phoneNumber` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRModel1`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRModel1`.`customer` (
  `idcustomer` INT UNSIGNED NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRModel1`.`Cabs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRModel1`.`Cabs` (
  `idCabs` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Cabs_PlateNumber` VARCHAR(45) NOT NULL,
  `Driver_idDriver` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCabs`, `Driver_idDriver`),
  UNIQUE INDEX `Cabs_PlateNumber_UNIQUE` (`Cabs_PlateNumber` ASC),
  UNIQUE INDEX `idCabs_UNIQUE` (`idCabs` ASC),
  INDEX `fk_Cabs_Driver1_idx` (`Driver_idDriver` ASC),
  UNIQUE INDEX `Driver_idDriver_UNIQUE` (`Driver_idDriver` ASC),
  CONSTRAINT `fk_Cabs_Driver1`
    FOREIGN KEY (`Driver_idDriver`)
    REFERENCES `CRModel1`.`Driver` (`idDriver`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRModel1`.`CabCustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRModel1`.`CabCustomer` (
  `Customer_idcustomer` INT UNSIGNED NOT NULL,
  `Cabs_idCabs` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Customer_idcustomer`, `Cabs_idCabs`),
  UNIQUE INDEX `Customer_idcustomer_UNIQUE` (`Customer_idcustomer` ASC),
  INDEX `fk_CabCustomer_2_idx` (`Cabs_idCabs` ASC),
  CONSTRAINT `fk_CabCustomer_1`
    FOREIGN KEY (`Customer_idcustomer`)
    REFERENCES `CRModel1`.`customer` (`idcustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CabCustomer_2`
    FOREIGN KEY (`Cabs_idCabs`)
    REFERENCES `CRModel1`.`Cabs` (`idCabs`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
