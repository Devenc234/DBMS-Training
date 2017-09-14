-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PaytmUpdated
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PaytmUpdated
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PaytmUpdated` ;
USE `PaytmUpdated` ;

-- -----------------------------------------------------
-- Table `PaytmUpdated`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PaytmUpdated`.`Accounts` (
  `ac_number` INT UNSIGNED NOT NULL,
  `ac_type` ENUM('current', 'saving') NULL,
  `ac_balance` DECIMAL UNSIGNED NOT NULL,
  PRIMARY KEY (`ac_number`),
  UNIQUE INDEX `idAccounts_UNIQUE` (`ac_number` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PaytmUpdated`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PaytmUpdated`.`Customer` (
  `idCustomer` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `primary_ac` INT UNSIGNED NOT NULL COMMENT 'as one customer should have one account in one branch\n\nso PK( customerID,branchID)\n\nNo need to make ac_number primary.',
  PRIMARY KEY (`idCustomer`, `primary_ac`),
  INDEX `fk_Customer_1_idx` (`primary_ac` ASC),
  CONSTRAINT `fk_Customer_1`
    FOREIGN KEY (`primary_ac`)
    REFERENCES `PaytmUpdated`.`Accounts` (`ac_number`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PaytmUpdated`.`Branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PaytmUpdated`.`Branches` (
  `idBranches` INT UNSIGNED NOT NULL,
  `branch_name` VARCHAR(45) NOT NULL,
  `branch_addr` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idBranches`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PaytmUpdated`.`AllAccounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PaytmUpdated`.`AllAccounts` (
  `account_no` INT UNSIGNED NOT NULL,
  `customerID` INT UNSIGNED NOT NULL,
  `branchID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`customerID`, `branchID`),
  INDEX `fk_AllAccounts_1_idx` (`account_no` ASC),
  INDEX `fk_AllAccounts_2_idx` (`branchID` ASC),
  CONSTRAINT `fk_AllAccounts_1`
    FOREIGN KEY (`account_no`)
    REFERENCES `PaytmUpdated`.`Accounts` (`ac_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AllAccounts_2`
    FOREIGN KEY (`branchID`)
    REFERENCES `PaytmUpdated`.`Branches` (`idBranches`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_AllAccounts_3`
    FOREIGN KEY (`customerID`)
    REFERENCES `PaytmUpdated`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
