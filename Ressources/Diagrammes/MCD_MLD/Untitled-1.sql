-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `id_user` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `picture` VARCHAR(255) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `postcode` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `hash` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_user`),
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transaction_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transaction_type` (
  `id_transaction_type` INT NOT NULL,
  `name` INT NOT NULL,
  PRIMARY KEY (`id_transaction_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transaction` (
  `id_transaction` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `total` INT NOT NULL,
  `id_user` INT UNSIGNED NOT NULL,
  `id_transaction_type` INT NOT NULL,
  PRIMARY KEY (`id_transaction`),
  CONSTRAINT `fk_Transaction_User`
    FOREIGN KEY (`id_user`)
    REFERENCES `mydb`.`User` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_Transaction_type1`
    FOREIGN KEY (`id_transaction_type`)
    REFERENCES `mydb`.`Transaction_type` (`id_transaction_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recurrence_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Recurrence_type` (
  `id_recurrence_type` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_recurrence_type`),
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recurrence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Recurrence` (
  `id_recurrence` INT NOT NULL,
  `date_start` DATETIME NOT NULL,
  `numbers_ transactions` INT NOT NULL,
  `id_transaction` INT NOT NULL,
  `id_recurrence_type` INT NOT NULL,
  PRIMARY KEY (`id_recurrence`),
  CONSTRAINT `fk_Recurrence_Transaction1`
    FOREIGN KEY (`id_transaction`)
    REFERENCES `mydb`.`Transaction` (`id_transaction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recurrence_Recurrence_type1`
    FOREIGN KEY (`id_recurrence_type`)
    REFERENCES `mydb`.`Recurrence_type` (`id_recurrence_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pays` (
  `id_pays` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `id_user` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_pays`),
  CONSTRAINT `fk_Pays_User1`
    FOREIGN KEY (`id_user`)
    REFERENCES `mydb`.`User` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;