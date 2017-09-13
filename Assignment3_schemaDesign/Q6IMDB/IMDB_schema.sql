-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IMDB` ;
USE `IMDB` ;

-- -----------------------------------------------------
-- Table `IMDB`.`Actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`Actors` (
  `idActors` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `actor_name` VARCHAR(45) NOT NULL,
  `actor_age` INT NULL,
  PRIMARY KEY (`idActors`),
  UNIQUE INDEX `idActors_UNIQUE` (`idActors` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`TVseries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`TVseries` (
  `idTVseries` INT UNSIGNED NOT NULL,
  `actorID` INT UNSIGNED NOT NULL,
  `tvs_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTVseries`, `actorID`),
  INDEX `fk_TVseries_1_idx` (`actorID` ASC),
  CONSTRAINT `fk_TVseries_1`
    FOREIGN KEY (`actorID`)
    REFERENCES `IMDB`.`Actors` (`idActors`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`Movies` (
  `idMovies` INT UNSIGNED NOT NULL,
  `actorID` INT NOT NULL,
  `movie_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMovies`, `actorID`),
  CONSTRAINT `fk_Movies_1`
    FOREIGN KEY (`idMovies`)
    REFERENCES `IMDB`.`Actors` (`idActors`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
