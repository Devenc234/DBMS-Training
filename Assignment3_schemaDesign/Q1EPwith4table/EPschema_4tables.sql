-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema EPschema
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema new_EPschema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_EPschema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_EPschema` ;
-- -----------------------------------------------------
-- Schema new_EPschema2
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema new_EPschema3
-- -----------------------------------------------------
USE `new_EPschema` ;

-- -----------------------------------------------------
-- Table `new_EPschema`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_EPschema`.`Employee` (
  `idEmployee` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Employee_name` VARCHAR(45) NOT NULL,
  `Employee_email` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE INDEX `idEmployee_UNIQUE` (`idEmployee` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_EPschema`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_EPschema`.`Project` (
  `idProjects` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Project_name` VARCHAR(45) NOT NULL,
  `Project_description` VARCHAR(45) NULL,
  PRIMARY KEY (`idProjects`),
  UNIQUE INDEX `idProjects_UNIQUE` (`idProjects` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_EPschema`.`EmployeeProject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_EPschema`.`EmployeeProject` (
  `emp_id` INT UNSIGNED NOT NULL,
  `proj_id` INT UNSIGNED NOT NULL,
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC),
  INDEX `fk_EmployeeProject_2_idx` (`proj_id` ASC),
  PRIMARY KEY (`emp_id`, `proj_id`),
  CONSTRAINT `fk_EmployeeProject_1`
    FOREIGN KEY (`emp_id`)
    REFERENCES `new_EPschema`.`Employee` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_EmployeeProject_2`
    FOREIGN KEY (`proj_id`)
    REFERENCES `new_EPschema`.`Project` (`idProjects`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_EPschema`.`ReportTo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_EPschema`.`ReportTo` (
  `manager_id` INT UNSIGNED NOT NULL,
  `emp_id` INT UNSIGNED NOT NULL,
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC),
  INDEX `fk_ReportTo_2_idx` (`manager_id` ASC),
  PRIMARY KEY (`manager_id`, `emp_id`),
  CONSTRAINT `fk_ReportTo_1`
    FOREIGN KEY (`emp_id`)
    REFERENCES `new_EPschema`.`Employee` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ReportTo_2`
    FOREIGN KEY (`manager_id`)
    REFERENCES `new_EPschema`.`Employee` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
