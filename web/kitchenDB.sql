-- -----------------------------------------------------
-- Schema Kitche App
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Kitchen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kitchendb` DEFAULT CHARACTER SET utf8 ;
USE `kitchendb` ; 

-- -----------------------------------------------------
-- Table `kitchen`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kitchendb`.`usuarios` (
  `ID_US` INT NOT NULL AUTO_INCREMENT
  ,`NOMBRE_US` VARCHAR(15) NOT NULL
  ,`APELLIDO_US` VARCHAR(15) NOT NULL
  ,`NICKNAME_US` VARCHAR(10) NOT NULL UNIQUE
  ,`EMAIL_US` VARCHAR(25) NOT NULL
  ,`PASSWORD_US` VARCHAR(15) NOT NULL
  ,`BIRTH_US` DATE NULL
  ,PRIMARY KEY (`ID_US`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `kitchen`.`carta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kitchendb`.`carta` (
  `ID_CA` INT NOT NULL AUTO_INCREMENT
  ,`NOMBRE_CA` VARCHAR(15) NOT NULL
  ,`CATEGORIA_CA` VARCHAR(15) NOT NULL
  ,`SUBCAT_CA` VARCHAR(15) NULL
  ,`DESCRIPCION_CA` VARCHAR(100) NULL
  ,`PRECIO_CA` DOUBLE NULL
  ,PRIMARY KEY (`ID_CA`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `kitchen`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kitchendb`.`orden` (
  `ID_OR` INT NOT NULL AUTO_INCREMENT --numero de orden
  ,`NICKNAME_US` VARCHAR(15) NOT NULL -- nombre a quien esta la orden
  ,`ID_US` INT NOT NULL	-- id del cliente
  ,`MESA_RES` INT NULL -- Mesa para la orden
  ,`ESTADO_OR` VARCHAR(10) NULL --estado de la orden o si es para llevar
  ,`ID_CA` INT NOT NULL --id del platillo
  ,`NOMBRE_CA` VARCHAR(15) NOT NULL -- nombre del platillo
  ,PRIMARY KEY (`ID_OR`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `kitchen`.`reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kitchendb`.`reservacion` (
  `ID_RES` INT NOT NULL AUTO_INCREMENT
  ,`NICKNAME_US` VARCHAR(15) NOT NULL
  ,`ID_MES` INT NOT NULL
  ,`NOPERSONA_RES` INT  NOT NULL
  ,`SUBMESA_RES` INT NULL
  ,`HORA_RES` TIME NOT NULL
  ,`DIA_RES` DATE NOT NULL
  ,`ESTADO_RES` VARCHAR(10) NOT NULL
  ,PRIMARY KEY (`ID_RES`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `kitchen`.`restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kitchendb`.`restaurante` (
  `ID_REST` INT NOT NULL AUTO_INCREMENT
  ,`NAME_REST` VARCHAR(30) NOT NULL
  ,`DIRECCION1_REST` VARCHAR(30) NOT NULL
  ,`DIRECCION2_REST` VARCHAR(30) NULL
  ,`DIRECCION3_REST` VARCHAR(30) NULL
  ,`TELEFONO1_REST` VARCHAR(30) NOT NULL
  ,`TELEFONO2_REST` VARCHAR(30) NULL
  ,`TELEFONO3_REST` VARCHAR(30) NULL
  ,`EMAIL_REST` VARCHAR(30) NULL
  ,`FACEBOOK_REST` VARCHAR(30) NULL
  ,`MAP_REST` VARCHAR(1000) NULL
  ,PRIMARY KEY (`ID_REST`))
ENGINE = InnoDB;