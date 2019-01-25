-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Genes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genes` (
  `idGenes` INT UNSIGNED NOT NULL,
  `Gene Name` VARCHAR(45) NOT NULL,
  `start` INT UNSIGNED NULL,
  `end` INT UNSIGNED NULL,
  `Chromosome` ENUM("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "X", "Y") NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`idGenes`),
  UNIQUE INDEX `idGenes_UNIQUE` (`idGenes` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patients` (
  `idPatients` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `age` INT UNSIGNED NULL,
  `Gender` ENUM("M", "F") NULL,
  `syndrome` VARCHAR(45) NULL,
  PRIMARY KEY (`idPatients`),
  UNIQUE INDEX `idPatients_UNIQUE` (`idPatients` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `idsyndrome` INT UNSIGNED NOT NULL,
  `description syndrome` VARCHAR(255) NULL,
  `affected gene` VARCHAR(45) NOT NULL,
  `Patients_idPatients1` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idsyndrome`),
  UNIQUE INDEX `idsyndrome_UNIQUE` (`idsyndrome` ASC) VISIBLE,
  INDEX `fk_syndrome_Patients1_idx` (`Patients_idPatients1` ASC) VISIBLE,
  CONSTRAINT `fk_syndrome_Patients1`
    FOREIGN KEY (`Patients_idPatients1`)
    REFERENCES `mydb`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genes_has_syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genes_has_syndrome` (
  `Genes_idGenes` INT UNSIGNED NOT NULL,
  `syndrome_idsyndrome` INT UNSIGNED NOT NULL,
  `syndrome_Patients_idPatients` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Genes_idGenes`, `syndrome_idsyndrome`, `syndrome_Patients_idPatients`),
  INDEX `fk_Genes_has_syndrome_syndrome1_idx` (`syndrome_idsyndrome` ASC, `syndrome_Patients_idPatients` ASC) VISIBLE,
  INDEX `fk_Genes_has_syndrome_Genes1_idx` (`Genes_idGenes` ASC) VISIBLE,
  CONSTRAINT `fk_Genes_has_syndrome_Genes1`
    FOREIGN KEY (`Genes_idGenes`)
    REFERENCES `mydb`.`Genes` (`idGenes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Genes_has_syndrome_syndrome1`
    FOREIGN KEY (`syndrome_idsyndrome`)
    REFERENCES `mydb`.`syndrome` (`idsyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
