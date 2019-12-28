-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema landon_app
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema landon_app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `landon_app` DEFAULT CHARACTER SET utf8 ;
USE `landon_app` ;

-- -----------------------------------------------------
-- Table `landon_app`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `landon_app`.`clients` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `name` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `last_name` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `address` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `zip_code` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `city` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `state` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3;


-- -----------------------------------------------------
-- Table `landon_app`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `landon_app`.`migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21;


-- -----------------------------------------------------
-- Table `landon_app`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `landon_app`.`password_resets` (
  `email` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `token` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `landon_app`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `landon_app`.`rooms` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `floor` INT(11) NOT NULL,
  `description` TEXT COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5;


-- -----------------------------------------------------
-- Table `landon_app`.`reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `landon_app`.`reservations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_in` DATE NOT NULL,
  `date_out` DATE NOT NULL,
  `client_id` INT(10) UNSIGNED NOT NULL,
  `room_id` INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `reservations_client_id_foreign` (`client_id` ASC),
  INDEX `reservations_room_id_foreign` (`room_id` ASC),
  CONSTRAINT `reservations_client_id_foreign`
    FOREIGN KEY (`client_id`)
    REFERENCES `landon_app`.`clients` (`id`),
  CONSTRAINT `reservations_room_id_foreign`
    FOREIGN KEY (`room_id`)
    REFERENCES `landon_app`.`rooms` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2;


-- -----------------------------------------------------
-- Table `landon_app`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `landon_app`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `password` VARCHAR(191) COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `remember_token` VARCHAR(100) COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
