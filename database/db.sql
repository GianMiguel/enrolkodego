-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema enrolkodego
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema enrolkodego
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `enrolkodego` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `enrolkodego` ;

-- -----------------------------------------------------
-- Table `enrolkodego`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enrolkodego`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NULL DEFAULT NULL,
  `course_description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `enrolkodego`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enrolkodego`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_students_courses_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_courses`
    FOREIGN KEY (`course_id`)
    REFERENCES `enrolkodego`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `enrolkodego`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enrolkodego`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
