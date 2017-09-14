-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Q1ProjectEmployee
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Q1ProjectEmployee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Q1ProjectEmployee` ;
USE `Q1ProjectEmployee` ;

-- -----------------------------------------------------
-- Table `Q1ProjectEmployee`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Q1ProjectEmployee`.`Employee` (
  `idEmployee` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `EmpName` VARCHAR(45) NOT NULL,
  `ManagerID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE INDEX `idEmployee_UNIQUE` (`idEmployee` ASC),
  INDEX `fk_Employee_2_idx` (`ManagerID` ASC),
  CONSTRAINT `fk_Employee_2`
    FOREIGN KEY (`ManagerID`)
    REFERENCES `Q1ProjectEmployee`.`Employee` (`idEmployee`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Q1ProjectEmployee`.`Projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Q1ProjectEmployee`.`Projects` (
  `idProjects` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(45) NOT NULL,
  `project_description` VARCHAR(45) NULL,
  `project_managerID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idProjects`, `project_managerID`),
  UNIQUE INDEX `idProjects_UNIQUE` (`idProjects` ASC),
  INDEX `fk_Projects_1_idx` (`project_managerID` ASC),
  CONSTRAINT `fk_Projects_1`
    FOREIGN KEY (`project_managerID`)
    REFERENCES `Q1ProjectEmployee`.`Employee` (`idEmployee`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
