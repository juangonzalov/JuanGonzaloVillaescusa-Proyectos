-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TikTokDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TikTokDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TikTokDB` DEFAULT CHARACTER SET utf8 ;
USE `TikTokDB` ;

-- -----------------------------------------------------
-- Table `TikTokDB`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`videos` (
  `IDvideo` INT NOT NULL,
  `IDusuario` INT NULL,
  `título` VARCHAR(105) NULL,
  `descripción` VARCHAR(300) NULL,
  `fecha_publicación` TIMESTAMP NULL,
  PRIMARY KEY (`IDvideo`),
  INDEX `IDusuario_idx` (`IDusuario` ASC) VISIBLE,
  CONSTRAINT `IDusuario`
    FOREIGN KEY (`IDusuario`)
    REFERENCES `TikTokDB`.`usuarios` (`IDusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`comentarios` (
  `IDcomentario` INT NOT NULL AUTO_INCREMENT,
  `IDvideo` INT NULL,
  `IDusuario` INT NULL,
  `fecha_like` TIMESTAMP NULL,
  PRIMARY KEY (`IDcomentario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`seguidores` (
  `IDseguidor` INT NOT NULL AUTO_INCREMENT,
  `IDusuario_siguiendo` INT NULL,
  `IDusuario_seguidor` INT NULL,
  `fecha_seguimiento` TIMESTAMP NULL,
  PRIMARY KEY (`IDseguidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TikTokDB`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TikTokDB`.`usuarios` (
  `IDusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NULL,
  `correo` VARCHAR(150) NOT NULL,
  `fecha_registro` TIMESTAMP NOT NULL,
  `país_origen` VARCHAR(150) NOT NULL,
  `videos_IDvideo` INT NOT NULL,
  PRIMARY KEY (`IDusuario`),
  INDEX `IDvideo_idx` (`videos_IDvideo` ASC) VISIBLE,
  CONSTRAINT `IDvideo`
    FOREIGN KEY (`videos_IDvideo`)
    REFERENCES `TikTokDB`.`videos` (`IDvideo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `IDcomentario`
    FOREIGN KEY (`IDusuario`)
    REFERENCES `TikTokDB`.`comentarios` (`IDcomentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDseguidor`
    FOREIGN KEY (`IDusuario`)
    REFERENCES `TikTokDB`.`seguidores` (`IDseguidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
