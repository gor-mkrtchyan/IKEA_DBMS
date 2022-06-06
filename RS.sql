-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema IKEA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IKEA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IKEA` DEFAULT CHARACTER SET utf8mb4 ;
USE `IKEA` ;

-- -----------------------------------------------------
-- Table `IKEA`.`Warehouses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Warehouses` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Warehouses` (
  `WarehouseID` INT NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `AddressLine1` VARCHAR(45) NOT NULL,
  `AddressLine2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostalCode` INT NOT NULL,
  PRIMARY KEY (`WarehouseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Branches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Branches` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Branches` (
  `BranchCode` INT NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `AddressLine1` VARCHAR(45) NOT NULL,
  `AddressLine2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostalCode` INT NOT NULL,
  `WarehouseID` INT NOT NULL,
  PRIMARY KEY (`BranchCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Employees` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Employees` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Extension` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `BranchCode` INT NOT NULL,
  `JobTitle` VARCHAR(45) NOT NULL,
  `ReportsTo` INT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Customers` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `AddressLine1` VARCHAR(45) NOT NULL,
  `AddressLine2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostalCode` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Payments` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Payments` (
  `CheckNumber` INT NOT NULL,
  `PaymentDate` DATETIME NOT NULL,
  `Amount` VARCHAR(10) NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`CheckNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Suppliers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Suppliers` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Suppliers` (
  `SupplierID` INT NOT NULL,
  `SupplierCompanyName` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `AddressLine1` VARCHAR(45) NOT NULL,
  `AddressLine2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostalCode` INT NOT NULL,
  PRIMARY KEY (`SupplierID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Materials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Materials` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Materials` (
  `MaterialType` VARCHAR(45) NOT NULL,
  `MaterialPrice` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MaterialType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Factories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Factories` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Factories` (
  `FactoryID` INT NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `AddressLine1` VARCHAR(45) NOT NULL,
  `AddressLine2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostalCode` INT NOT NULL,
  PRIMARY KEY (`FactoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`MaterialProduction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`MaterialProduction` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`MaterialProduction` (
  `MaterialType` VARCHAR(45) NOT NULL,
  `SupplierID` INT NOT NULL,
  PRIMARY KEY (`MaterialType`, `SupplierID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`MaterialDelivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`MaterialDelivery` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`MaterialDelivery` (
  `MaterialType` VARCHAR(45) NOT NULL,
  `FactoryID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `DateShipped` DATE NOT NULL,
  `DateDelivered` DATE NOT NULL,
  PRIMARY KEY (`MaterialType`, `FactoryID`, `DateShipped`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`ProductLines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`ProductLines` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`ProductLines` (
  `ProductLine` VARCHAR(45) NOT NULL,
  `TextDescription` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`ProductLine`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Products` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Products` (
  `ProductCode` VARCHAR(20) NOT NULL,
  `ProductName` VARCHAR(45) NOT NULL,
  `ProductScale` VARCHAR(45) NOT NULL,
  `ProductDescription` VARCHAR(400) NOT NULL,
  `QuantityInStock` INT NOT NULL,
  `ProductionCost` VARCHAR(45) NOT NULL,
  `ProductPrice` VARCHAR(45) NOT NULL,
  `ProductLine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`Orders` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`Orders` (
  `OrderNumber` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `RequiredDate` DATE NOT NULL,
  `ShippedDate` DATE NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Comments` VARCHAR(400) NULL,
  `CustomerID` INT NOT NULL,
  `BranchCode` INT NULL,
  PRIMARY KEY (`OrderNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`ProductProduction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`ProductProduction` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`ProductProduction` (
  `ProductCode` VARCHAR(10) NOT NULL,
  `FactoryID` INT NOT NULL,
  PRIMARY KEY (`ProductCode`, `FactoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`ProductDeliveryToWarehouses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`ProductDeliveryToWarehouses` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`ProductDeliveryToWarehouses` (
  `WarehouseID` INT NOT NULL,
  `ProductCode` VARCHAR(10) NOT NULL,
  `Quantity` INT NOT NULL,
  `DateShipped` DATE NOT NULL,
  `DateDelivered` DATE NOT NULL,
  PRIMARY KEY (`WarehouseID`, `ProductCode`, `DateShipped`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`ProductDeliveryToBranches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`ProductDeliveryToBranches` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`ProductDeliveryToBranches` (
  `ProductCode` VARCHAR(10) NOT NULL,
  `BranchCode` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `DateShipped` DATE NOT NULL,
  `DateDelivered` DATE NOT NULL,
  PRIMARY KEY (`ProductCode`, `BranchCode`, `DateShipped`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IKEA`.`OrderDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IKEA`.`OrderDetails` ;

CREATE TABLE IF NOT EXISTS `IKEA`.`OrderDetails` (
  `OrderNumber` INT NOT NULL,
  `ProductCode` VARCHAR(10) NOT NULL,
  `QuantityOrdered` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderNumber`, `ProductCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Warehouses`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Warehouses` (`WarehouseID`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (001, '+374 10 565621', 'Tbilisyan Hw. 24', 'YV156', 'Yerevan', 'YVN', 'Armenia', 0014);
INSERT INTO `IKEA`.`Warehouses` (`WarehouseID`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (002, '+374 10 295514', 'Zoravar Andranik St. 11', 'HR293', 'Hrazdan', 'Kotayk', 'Armenia', 2302);
INSERT INTO `IKEA`.`Warehouses` (`WarehouseID`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (003, '+374 10 554855', 'A. Manukyan St. 15', 'SP465', 'Spitak', 'Lori', 'Armenia', 1801);
INSERT INTO `IKEA`.`Warehouses` (`WarehouseID`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (004, '+374 10 514657', 'Spandaryan St. 16', 'SS532', 'Sisian', 'Syunik', 'Armenia', 3501);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Branches`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (1, '+374 10 491551', 'Arshakunyats Ave. 23', 'AS275', 'Yerevan', 'Yerevan', 'Armenia', 0026, 001);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (2, '+374 10 226655', 'Tigran Mets St. 53', 'DK143', 'Ashtarak', 'Aragatsotn', 'Armenia', 0201, 001);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (3, '+374 10 622525', 'Nersisyan St. 42', 'DG525', 'Artashat', 'Ararat', 'Armenia', 0702, 001);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (4, '+374 10 665544', 'Hanrapetutyan St. 25', 'BI432', 'Armavir', 'Armavir', 'Armenia', 0901, 001);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (5, '+374 10 326265', 'Azatutyan St. 64', 'VU424', 'Gavar', 'Gegharkunik', 'Armenia', 1205, 002);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (6, '+374 10 326512', 'Hatis St. 24', 'PD147', 'Abovyan', 'Kotayk', 'Armenia', 2204, 002);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (7, '+374 10 495879', 'K. Demirchyan St. 18', 'TT327', 'Vanadzor', 'Lori', 'Armenia', 2022, 003);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (8, '+374 10 978465', 'Lalayan St. 43', 'IK999', 'Gyumri', 'Shirak', 'Armenia', 3119, 003);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (9, '+374 10 985152', 'Shahumyan St. 53', 'KH432', 'Kapan', 'Syunik', 'Armenia', 3301, 004);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (10, '+374 10 987612', 'Ankakhutian St. 17', 'FV427', 'Ijevan', 'Tavush', 'Armenia', 4001, 002);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (11, '+374 10 496152', 'Mikoyan St. 4', 'UM420', 'Yeghegnadzor', 'Vayots-Dzor', 'Armenia', 3601, 004);
INSERT INTO `IKEA`.`Branches` (`BranchCode`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `WarehouseID`) VALUES (12, '+374 10 498652', 'Azatamartikneri St. 64', 'NK580', 'Stepanakert', 'Stepanakert', 'Artsakh', 3750, 004);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Employees`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (001, 'Aram', 'Asatryan', 111, 'Drakhtiperi@haymail.am', 1, 'President', NULL);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (002, 'Harut', 'Dzax', 519, 'HarutLeft@haymail.am', 1, 'VP Marketing', 001);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (003, 'Shakira', 'Tchngryan', 468, 'Wakawaka@haymail.am', 1, 'VP Sales', 001);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (004, 'Neo', 'Azizyan', 195, 'Neomatrix@haymail.am', 8, 'Sales Manager (North)', 003);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (005, 'Morpheus', 'Nurbekyants', 915, 'MorpheusMatrix@haymail.am', 6, 'Sales Manager (Center)', 003);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (006, 'Irena', 'Chan', 069, 'Watashiwa@haymail.am', 9, 'Sales Manager (South)', 003);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (007, 'Aram', 'Manukyan', 222, 'Hanapetutyun@haymail.am', 1, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (008, 'Eminem', 'Sargsyan', 666, 'Slimshady@haymail.am', 1, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (009, 'Elon', 'Muskulyan', 685, 'SpaceX@haymail.am', 2, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (010, 'Tigran', 'Mec', 798, 'Thegreat@haymail.am', 2, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (011, 'Tiko', 'Poqr', 156, 'Thenotsogreat@haymail.am', 3, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (012, 'Jennifer', 'Lavrentyan', 197, 'Jennyfromthebisedka@haymail.am', 3, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (013, 'Poghos', 'Poghosyan', 733, 'Poghos@haymail.am', 4, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (014, 'Qristine', 'Rolandyan', 455, 'CR7@haymail.am', 4, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (015, 'Hasmik', 'Makaryan', 155, 'Hasmak@haymail.am', 5, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (016, 'Karen', 'Vardanyan', 157, 'Karvard@haymail.am', 5, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (017, 'Nikoghayos', 'Ashtarakeci', 159, 'NikAshtarak@haymail.am', 6, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (018, 'Suren', 'Zanazanyan', 169, 'SurZan@haymail.am', 6, 'Sales Rep', 005);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (019, 'Mark', 'Tsarukyan', 802, 'MarkTsar@haymail.am', 7, 'Sales Rep', 004);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (020, 'Beyonce', 'Vardevanyan', 119, 'Singlelady@haymail.am', 7, 'Sales Rep', 004);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (021, 'Adele', 'Adamyan', 091, 'Hello@haymail.am', 8, 'Sales Rep', 004);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (022, 'Hovo', 'Tumanyan', 002, 'QajNazar@haymail.am', 8, 'Sales Rep', 004);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (023, 'Soghomon', 'Soghomonyan', 033, 'Komitas@haymail.am', 9, 'Sales Rep', 006);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (024, 'Yeghishe', 'Charents', 044, '1000dram@haymail.am', 9, 'Sales Rep', 006);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (025, 'Malena', 'Eurovision', 001, 'Qamiqami@haymail.am', 10, 'Sales Rep', 004);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (026, 'Aram', 'Harevan', 987, '15B@haymail.am', 10, 'Sales Rep', 004);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (027, 'Alyona', 'Valachkova', 444, 'PutinTOP@haymail.am', 11, 'Sales Rep', 006);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (028, 'Vrej', 'Uchiha', 009, 'Sasukeee@haymail.am', 11, 'Sales Rep', 006);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (029, 'Inna', 'Krmoyan', 999, 'InnaKrmoyan@haymail.am', 12, 'Sales Rep', 006);
INSERT INTO `IKEA`.`Employees` (`EmployeeID`, `FirstName`, `LastName`, `Extension`, `Email`, `BranchCode`, `JobTitle`, `ReportsTo`) VALUES (030, 'Gor', 'Mkrtchyan', 777, 'GorMkrtchyan@haymail.am', 12, 'Sales Rep', 006);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Customers`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (1, 'Mikayel', 'Movsisyan', '+374 99 165451', 'Parpetsi St. 12', ' ', 'Yerevan', 'Yerevan', 'Armenia', 0012, 007);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (2, 'Harutyun', 'Alikhanyan', '+374 55 156545', 'Harutyunyan St, 78', 'WE423', 'Stepanavan', 'Lori', 'Armenia', 1556, 019);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (3, 'Inesa', 'Harutyunyan', '+374 94 555556', 'Hakobyan St. 43', 'BB459', 'Ijevan', 'Tavush', 'Armenia', 1955, 022);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (4, 'Irena', 'Torosyan', '+374 77 159546', 'Gyulbenkyan St. 24', ' ', 'Yerevan', 'Yerevan', 'Armenia', 0033, 010);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (5, 'Mane', 'Davtyan', '+374 99 153205', 'Gayi St. 13', 'UU413', 'Yerevan', 'Yerevan', 'Armenia', 0045, 011);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (6, 'Ani', 'Tovmasyan', '+374 43 105547', 'Halabyan St. 43', ' ', 'Yerevan', 'Yerevan', 'Armenia', 0078, 012);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (7, 'Liana', 'Darbinyan', '+374 99 915674', 'Kirakosyan St. 42', 'LD412', 'Talin', 'Aragtsotn', 'Armenia', 1595, 013);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (8, 'Aram', 'Harutyunyan', '+374 77 615546', 'Muradyan St. 32', 'AH432', 'Zovuni', 'Kotayk', 'Armenia', 1956, 014);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (9, 'Ani', 'Gumruyan', '+374 43 166542', 'Karapetyan St. 12', 'AG132', 'Vanadzor', 'Lori', 'Armenia', 6566, 020);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (10, 'Karine', 'Beglaryan', '+374 99 484655', 'Lalayan St. 42', ' ', 'Yerevan', 'Yerevan', 'Armenia', 0061, 018);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (11, 'Lana', 'Tadevosyan', '+374 43 789822', 'Tigran Mets Ave. 34', ' ', 'Sisian', 'Syunik', 'Armenia', 6155, 019);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (12, 'Haynrikh', 'Santrosyan', '+374 99 415452', 'Mikayelyan St.52', 'HS423', 'Yerevan', 'Yerevan', 'Armenia', 0080, 007);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (13, 'Anahit', 'Baghdasaryan', '+374 77 915432', 'Amiryan St. 8', 'AB532', 'Gyumri', 'Shirak', 'Armenia', 0155, 020);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (14, 'Lilit', 'Galstyan', '+374 99 159654', 'Kostanyan St. 21', ' ', 'Spitak', 'Lori', 'Armenia', 0245, 021);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (15, 'Robert', 'Mirzoyan', '+374 55 156545', 'Hakobjanyan St. 4', ' ', 'Kapan', 'Syunik', 'Armenia', 5155, 029);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (16, 'Mikayel', 'Bejanyan', '+374 77 158584', 'Nikoghosyan St. 1', 'MB142', 'Yeghegnadzor', 'Vayots-Dzor', 'Armenia', 1555, 023);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (17, 'Anna', 'Zatikyan', '+374 94 915485', 'Qalantaryan St. 3', 'AZ943', 'Stepanakert', 'Stepanakert', 'Artsakh', 1654, 030);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (18, 'Svetlana', 'Ghevondyan', '+374 99 915965', 'Tarverdyan St. 4', ' ', 'Armavir', 'Armavir', 'Armenia', 5915, 009);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (19, 'Anahit', 'Matevosyan', '+374 55 915645', 'Vardanyan St. 43', 'AN432', 'Stepanakert', 'Stepanakert', 'Artsakh', 6155, 029);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (20, 'Gegham', 'Kadimyan', '+374 55 918454', 'Vergetnya St. 2', ' ', 'Stepanakert', 'Stepanakert', 'Artsakh', 4447, 030);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (21, 'Tigran', 'Barseghyan', '+374 99 914654', 'Leo St. 3', ' ', 'Stepanakert', 'Stepanakert', 'Artsakh', 1152, 030);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (22, 'Garik', 'Minasyan', '+374 99 914513', 'Manukyan St. 6', 'GM142', 'Goris', 'Syunik', 'Armenia', 6125, 028);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (23, 'Mari', 'Gevorgyan', '+374 99 191554', 'Geghamyan St. 5', 'MG423', 'Stepanakert', 'Stepanakert', 'Artsakh', 1554, 029);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (24, 'Hasmik', 'Alikhanyan', '+374 94 295951', 'Ulnetsi St. 3', ' ', 'Abovyan', 'Kotayk', 'Armenia', 8365, 007);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (25, 'Diana', 'Apitonyan', '+374 77 181855', 'Bareghamyan St. 2', 'DA432', 'Ashtarak', 'Aragatsotn', 'Armenia', 9154, 016);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (26, 'Ruben', 'Vardanyan', '+374 99 195654', 'Baghramyan St. 33', ' ', 'Armavir', 'Armavir', 'Armenia', 1951, 014);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (27, 'Boris', 'Johnson', '+7 156 1564615', 'Jacobi St. 12', 'BJ778', 'Vagharshapat', 'Armavir', 'Armenia', 2626, 015);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (28, 'Taron', 'Barseghyan', '+374 99 195561', 'Tumanyan St. 53', ' ', 'Spitak', 'Lori', 'Armenia', 6511, 022);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (29, 'Garegin', 'Movsisyan', '+374 77 155123', 'Gareginyan St. 4', 'GM555', 'Alaverdi', 'Lori', 'Armenia', 9115, 026);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (30, 'Mariam', 'Sahakyan', '+374 99 199156', 'Isahakyan St. 2', ' ', 'Stepanakert', 'Stepanakert', 'Artsakh', 1952, 029);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (31, 'Wilfried', 'Johnes', '+374 99 145645', 'Bagrevand St. 3', ' ', 'Yeghegnadzor', 'Vayots-Dzor', 'Armenia', 1855, 028);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (32, 'Matthew', 'Dickens', '+9 156 9455155', 'Johnes St. 3', ' ', 'London', 'London', 'The United Kingdom', 1852, 022);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (33, 'Vladislav', 'Baranov', '+7 152 1545951', 'Mayakovsky St. 12', 'HI891', 'Moscow', 'Moscow', 'Russia', 4862, 028);
INSERT INTO `IKEA`.`Customers` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`, `EmployeeID`) VALUES (34, 'Nicholas', 'Hoff', '+374 10 498914', 'Micolaus St. 21', 'RU849', 'Berlin', 'Berlin', 'Germany', 9152, 001);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Payments`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (1, '2021-01-03', '98000֏', 1);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (2, '2021-02-19', '413000֏', 1);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (3, '2021-05-16', '840000֏', 2);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (4, '2021-05-01', '146000֏', 3);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (5, '2021-04-13', '118000֏', 3);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (6, '2022-05-12', '157000֏', 3);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (7, '2022-01-03', '1725000֏', 4);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (8, '2021-01-02', '1210000֏', 5);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (9, '2021-05-10', '780000֏', 6);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (10, '2021-05-01', '657000֏', 9);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (11, '2021-10-02', '6000֏', 9);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (12, '2021-11-05', '78000֏', 10);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (13, '2021-05-11', '39000֏', 11);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (14, '2021-05-05', '204000֏', 12);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (15, '2021-04-11', '78000֏', 12);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (16, '2021-05-11', '157000֏', 13);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (17, '2021-07-20', '590000֏', 13);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (18, '2022-01-05', '590000֏', 14);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (19, '2021-10-19', '156000֏', 15);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (20, '2021-02-15', '677000֏', 15);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (21, '2021-03-15', '29000֏', 15);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (22, '2021-01-04', '221000֏', 15);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (23, '2021-02-05', '224000֏', 15);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (24, '2021-06-05', '185000֏', 16);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (25, '2021-10-08', '151000֏', 18);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (26, '2021-11-06', '590000֏', 20);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (27, '2021-04-02', '118000֏', 21);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (28, '2021-02-16', '156000֏', 21);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (29, '2021-03-12', '333000֏', 21);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (30, '2021-04-16', '393000֏', 21);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (31, '2021-06-15', '957000֏', 22);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (32, '2022-01-06', '768000֏', 25);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (33, '2022-10-15', '185000֏', 25);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (34, '2022-01-05', '58000֏', 26);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (35, '2021-01-06', '1614000֏', 28);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (36, '2021-01-06', '308000֏', 30);
INSERT INTO `IKEA`.`Payments` (`CheckNumber`, `PaymentDate`, `Amount`, `CustomerID`) VALUES (37, '2021-02-22', '590000֏', 30);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Suppliers`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (1, '\"ARM Wood\" LLC', '+374 10 952194', 'Hayrapetyan St. 12', 'IJ615', 'Ijevan', 'Tavush', 'Armenia', 4562);
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (2, '\"STECO\" LLC', '+374 10 959421', 'Karapetyan St. 4', 'SP915', 'Spitak', 'Lori', 'Armenia', 1562);
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (3, '\"Armavir Cotton\" LLC', '+374 10 231321', 'LerKamsar St. 12', 'AM452', 'Armavir', 'Armavir', 'Armenia', 5162);
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (4, '\"Aphina Knits\" LLC', '+374 10 546654', 'Mirzoyan St. 43', 'AK152', 'Gyumri', 'Shirak', 'Armenia', 4485);
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (5, '\"TAU Workshop\" LLC', '+374 10 948875', 'Firduzi St. 3', 'AS915', 'Vanadzor', 'Lori', 'Armenia', 1559);
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (6, '\"AMV\" LLC', '+374 10 796452', 'Hovsep Emin St. 9', 'AS987', 'Ararat', 'Ararat', 'Armenia', 1652);
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (7, '\"Sevan Textile\" LLC ', '+374 10 451289', 'Petrosyan St. 3', 'GV444', 'Gavar', 'Gegharkunik', 'Armenia', 6451);
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (8, '\"Dunder Mifflin\" LLC', '+374 10 645132', 'Sisakyan St. 12', 'SS909', 'Kapan', 'Syunik', 'Armenia', 1512);
INSERT INTO `IKEA`.`Suppliers` (`SupplierID`, `SupplierCompanyName`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (9, '\"Irani Textile\" LLC', '+98 921 654 2134', 'Shah Abadi st. 25', 'IR432', 'Tabriz', 'Tabriz', 'Iran', 23214);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Materials`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Wood', '100֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Glass', '50֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Cotton', '1.050֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Wool', '1.400֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Leather', '12.000֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Steel', '115֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Synthetic Fiber', '400֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Paper', '300֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Polyester', '1.150֏/kg');
INSERT INTO `IKEA`.`Materials` (`MaterialType`, `MaterialPrice`) VALUES ('Satin', '3.000֏/kg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Factories`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Factories` (`FactoryID`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (1, '+374 10 154154', 'Hakobyan St. 2', 'HH142', 'Vedi', 'Ararat', 'Armenia', 0015);
INSERT INTO `IKEA`.`Factories` (`FactoryID`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (2, '+374 10 615651', 'Jivani St. 34', 'JJ143', 'Charentsavan', 'Kotayk', 'Armenia', 7982);
INSERT INTO `IKEA`.`Factories` (`FactoryID`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (3, '+374 10 312456', 'Karapetyan St. 13', 'GS155', 'Goris', 'Syunik', 'Armenia', 4521);
INSERT INTO `IKEA`.`Factories` (`FactoryID`, `PhoneNumber`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Country`, `PostalCode`) VALUES (4, '+374 10 948492', 'Manvelyan St. 5', 'ST615', 'Stepanavan', 'Lori', 'Armenia', 6155);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`MaterialProduction`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Wood', 1);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Glass', 2);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Cotton', 3);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Wool', 4);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Leather', 5);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Steel', 6);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Synthetic Fiber', 7);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Paper', 8);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Polyester', 7);
INSERT INTO `IKEA`.`MaterialProduction` (`MaterialType`, `SupplierID`) VALUES ('Satin', 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`MaterialDelivery`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Wood', 1, 200, '2022-01-11', '2022-01-12');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Wood', 2, 8065, '2022-01-13', '2022-01-15');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Wood', 3, 6512, '2022-01-16', '2022-01-18');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Wood', 4, 7852, '2022-01-26', '2022-02-01');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Glass', 1, 10201, '2022-02-16', '2022-02-18');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Glass', 2, 10502, '2022-02-17', '2022-02-19');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Glass', 3, 9520, '2022-02-25', '2022-02-28');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Glass', 4, 8402, '2022-01-12', '2022-01-14');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Wool', 1, 8011, '2022-01-15', '2022-01-17');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Wool', 2, 9065, '2022-01-16', '2022-01-18');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Wool', 3, 6180, '2022-01-15', '2022-01-19');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Wool', 4, 7156, '2022-01-19', '2022-01-22');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Leather', 1, 10502, '2022-01-15', '2022-01-19');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Leather', 2, 5012, '2022-01-02', '2022-01-05');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Leather', 3, 9156, '2022-01-04', '2022-01-06');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Leather', 4, 7410, '2022-01-16', '2022-01-20');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Cotton', 1, 7915, '2022-02-06', '2022-02-09');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Cotton', 2, 8145, '2022-01-24', '2022-01-27');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Cotton', 3, 7522, '2022-02-11', '2022-02-13');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Cotton', 4, 9651, '2022-01-16', '2022-01-19');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Steel', 1, 12951, '2022-01-18', '2022-01-21');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Steel', 2, 11948, '2022-02-27', '2022-03-03');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Steel', 3, 10945, '2022-01-04', '2022-01-08');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Steel', 4, 12199, '2022-03-14', '2022-03-16');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Synthetic Fiber', 1, 7195, '2022-01-16', '2022-01-18');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Synthetic Fiber', 2, 8192, '2022-01-26', '2022-01-29');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Synthetic Fiber', 3, 7195, '2022-02-14', '2022-02-16');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Synthetic Fiber', 4, 9515, '2022-05-01', '2022-05-04');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Paper', 1, 8165, '2022-02-15', '2022-02-18');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Paper', 2, 8615, '2022-04-12', '2022-04-16');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Paper', 3, 9453, '2022-01-01', '2022-01-05');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Paper', 4, 9165, '2022-03-19', '2022-03-25');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Polyester', 1, 10165, '2022-02-14', '2022-02-16');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Polyester', 2, 10165, '2022-02-19', '2022-02-24');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Polyester', 3, 11499, '2022-03-01', '2022-03-05');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Polyester', 4, 10948, '2022-01-28', '2022-02-02');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Satin', 1, 10465, '2022-01-05', '2022-01-24');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Satin', 2, 9165, '2022-02-10', '2022-02-21');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Satin', 3, 8615, '2022-01-15', '2022-01-26');
INSERT INTO `IKEA`.`MaterialDelivery` (`MaterialType`, `FactoryID`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('Satin', 4, 10789, '2022-02-01', '2022-02-13');

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`ProductLines`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`ProductLines` (`ProductLine`, `TextDescription`) VALUES ('Armchair', 'A comfortable, cushioned chair with a support on each side, where you can rest your arms while you sit');
INSERT INTO `IKEA`.`ProductLines` (`ProductLine`, `TextDescription`) VALUES ('Bed', 'An item of furniture that is used as a place to sleep, rest, and relax.');
INSERT INTO `IKEA`.`ProductLines` (`ProductLine`, `TextDescription`) VALUES ('Bookshelf', 'A piece of furniture with horizontal shelves, often in a cabinet, used to store books or other printed materials.');
INSERT INTO `IKEA`.`ProductLines` (`ProductLine`, `TextDescription`) VALUES ('Wardrobe', 'A large, tall cupboard or recess in which clothes may be hung or stored.');
INSERT INTO `IKEA`.`ProductLines` (`ProductLine`, `TextDescription`) VALUES ('Chair', 'A seat, especially for one person, usually having four legs for support and a rest for the back and often having rests for the arms.');
INSERT INTO `IKEA`.`ProductLines` (`ProductLine`, `TextDescription`) VALUES ('Desk', 'A piece of furniture with a flat or sloping surface and typically with drawers, at which one can read, write, or do other work.');
INSERT INTO `IKEA`.`ProductLines` (`ProductLine`, `TextDescription`) VALUES ('Table', 'An item of furniture with a raised flat top and is supported most commonly by 1 or 4 legs (although some can have more), used as a surface for working at, eating from or on which to place things.');
INSERT INTO `IKEA`.`ProductLines` (`ProductLine`, `TextDescription`) VALUES ('Sofa', 'A long upholstered seat usually with arms and a back and often convertible into a bed.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Products`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('B004', 'KLEPPSTAD', '160x200 cm', 'Bed frame, white/Vissle beige', 21, '46000֏', '73000֏', 'Bed');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('B001', 'GLADSTAD', '160x200 cm', 'Upholstered bed, 2 storage boxes, Kabusa light grey', 184, '130000֏', '151000֏', 'Bed');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('B002', 'BRIMNES', '140x200 cm', 'Bed frame with storage, white', 94, '62000֏', '97000֏', 'Bed');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('B003', 'MALM', '90x200 cm', 'Bed frame, high, white', 98, '27000֏', '58000֏', 'Bed');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('B005', 'SUNDVIK', '60x120 cm', 'Cot, white', 46, '49000֏', '78000֏', 'Bed');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('B006', 'GULLIVER', '60x120 cm', 'Cot, white', 105, '39000֏', '68000֏', 'Bed');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('B007', 'ANGSTA', '134x199 cm', '3-seat sofa-bed, with chaise longue grey', 159, '124000֏', '157000֏', 'Bed');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('S001', 'LANDSKRONA', '360x78 cm', '5-seat sofa, with chaise longues/Gunnared dark grey/metal', 48, '573000֏', '768000֏', 'Sofa');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('S002', 'VIMLE', '241x68 cm', '3-seat sofa, with headrest/Gunnared medium grey', 97, '241000֏', '354000֏', 'Sofa');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('S003', 'ANGERSBY', '196x73 cm', '3-seat sofa, Knisa light grey', 87, '111000֏', '157000֏', 'Sofa');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('S004', 'KIVIK', '228x83 cm', '3-seat sofa, Kelinge grey-turquoise', 52, '218000֏', '295000֏', 'Sofa');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('S005', 'STOCKHOLM', '322x80 cm', '4-seat sofa, with chaise longue/Grann/Bomstad black', 63, '630000֏', '840000֏', 'Sofa');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('S006', 'FRIHETEN', '225x83 cm', 'Three-seat sofa-bed, Bomstad black', 94, '198000֏', '265000֏', 'Sofa');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('BS001', 'BILLY', '80x28x202 cm', 'Bookcase, white', 153, '11000֏', '25000֏', 'Bookshelf');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('BS002', 'GERSBY', '60x180 cm', 'Bookcase, white', 26, '6500֏', '13000֏', 'Bookshelf');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('BS003', 'KALLAX', '77x147 cm', 'Shelving unit, white', 96, '16000֏', '33000֏', 'Bookshelf');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('BS004', 'VESKEN', '36x23x100 cm', 'Shelf unit, white', 45, '2500֏', '6000֏', 'Bookshelf');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('BS005', 'LACK', '30x190 cm', 'Wall shelf unit, white', 61, '13000֏', '25000֏', 'Bookshelf');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('BS006', 'FLYSTA', '30x190 cm', 'Shelving unit, white', 56, '15000֏', '29000֏', 'Bookshelf');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('D001', 'BEKANT', '160x80 cm', 'Desk sit/stand, white stained oak veneer/white', 65, '180000֏', '275000֏', 'Desk');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('D002', 'RODULF', '140x80 cm', 'Desk sit/stand, grey/white', 48, '125000֏', '195000֏', 'Desk');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('D003', 'IDÅSEN', '120x70 cm', 'Desk sit/stand, black/dark grey', 98, '215000֏', '295000֏', 'Desk');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('D004', 'UTESPELARE', '160x80 cm', 'Gaming desk, black', 95, '52000֏', '78000֏', 'Desk');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('D005', 'MÅLVAKT / ALEX', '120x80 cm', 'Desk, black/white', 126, '39000֏', '65700֏', 'Desk');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T001', 'BORGEBY', '70 cm', 'Coffee table, birch veneer', 45, '28000֏', '49000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T002', 'KRAGSTA', '90 cm', 'Coffee table, white', 21, '35000֏', '58000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T003', 'GLADOM', '45x53 cm', 'Tray table, black', 84, '7000֏', '12000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T004', 'KVISTBRO', '44 cm', 'Storage table, black', 1, '9000֏', '15000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T005', 'TRULSTORP', '115x70 cm', 'Coffee table, white', 95, '48000֏', '68000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T006', 'VITTSJÖ', '90x50 cm', 'Nest of tables, set of 2, black-brown/glass', 98, '21000֏', '39000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T007', 'TOFTERYD', '95x95 cm', 'Coffee table, high-gloss black', 54, '83000֏', '108000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T008', 'HAVSTA', '75x60 cm', 'Coffee table, white', 5, '35000֏', '67000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T009', 'LISABO', '118x50 ccm', 'Coffee table, ash veneer', 62, '48000֏', '72000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T010', 'EKEDALEN', '120/180x80 cm', 'Extendable table, white', 9, '65000֏', '92000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T011', 'MARIEDAMM', '105 cm', 'Table, dark grey', 159, '85000֏', '118000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T012', 'INGATORP', '110/155 cm', 'Extendable table, white', 9, '119000֏', '187000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T013', 'SKOGSTA', '235x100 cm', 'Dining table, acacia', 4, '214000֏', '256000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T014', 'NORDVIKEN', '74/104x74 cm', 'Drop-leaf table, white', 15, '52000֏', '78000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('T015', 'RÖNNINGE', '75x75 cm', 'Bar table, birch', 62, '86000֏', '118000֏', 'Table');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('W001', 'HASVIK', '150x44x236 cm', 'Wardrobe combination, white', 98, '189000֏', '221000֏', 'Wardrobe');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('W002', 'FORSAND', '150x60x201 cm', 'Wardrobe combination, white', 15, '111000֏', '146000֏', 'Wardrobe');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('W003', 'BERGSBO', '200x60x236 cm', 'Wardrobe, white/white stained oak effect', 22, '197000֏', '224000֏', 'Wardrobe');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('W004', 'MEHAMN', '150x66x236 cm', 'Wardrobe combination, white', 26, '218000֏', '307000֏', 'Wardrobe');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('W005', 'TYSSEDAL', '175x58x236 cm', 'Wardrobe, white/white glass', 55, '265000֏', '325000֏', 'Wardrobe');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A001', 'PELLO', '67x96 cm', 'Armchair, Holmby natural', 132, '15000֏', '29000֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A002', 'EKERÖ', '70x75 cm', 'Armchair, Skiftebo dark blue', 132, '53000֏', '78000֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A003', 'POÄNG', '68x100 cm', 'Armchair, black-brown/Knisa black', 116, '20000֏', '45000֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A004', 'REMSTA', '60x88 cm', 'Armchair, Djuparp dark green-blue', 155, '51000֏', '78000֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A005', 'OMTÄNKSAM', '72x109 cm', 'Armchair, Gunnared dark grey', 195, '94000֏', '137000֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A006', 'EKTORP', '104x88 cm', 'Armchair, Hallarp grey', 159, '98000֏', '137000֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A007', 'TULLSTA', '79x78 cm', 'Armchair, Nordvalla medium grey', 70, '51000֏', '78500֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A008', 'VIMLE', '101x83 cm', 'Armchair, Gunnared medium grey', 51, '140000֏', '185000֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('A009', 'KLUBBFORS', '88x76 cm', 'Armchair, Gunnared beige', 15, '126000֏', '167000֏', 'Armchair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C001', 'LOBERGET / MALSKÄR', '67x90 cm', 'Swivel chair + pad, white black/dark grey', 67, '14000֏', '22600֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C002', 'MARKUS', '60x140 cm', 'Office chair, Vissle dark grey', 89, '52000֏', '88000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C003', 'MILLBERGET', '70x62 cm', 'Swivel chair, Murum black', 69, '24000֏', '49000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C004', 'MOLTE', '40x72 cm', 'Desk chair, grey', 71, '3500֏', '9000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C005', 'BLECKBERGET', '68x57 cm', 'Swivel chair, Idekulla beige', 72, '19000֏', '29000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C006', 'FLINTAN', '71x58 cm', 'Office chair, beige', 54, '21000֏', '39900֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C007', 'NILSERIK', '41x71 cm', 'Standing support, beige/Vissle dark grey', 101, '18000֏', '29000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C008', 'LÅNGFJÄLL', '67x92 cm', 'Conference chair with armrests, Gunnared blue/white', 122, '59000֏', '78000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C009', 'KÄTTIL', '46x89 cm', 'Chair, white/Knisa light grey', 98, '13000֏', '25000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C010', 'INGOLF', '40x91 cm', 'Chair, white/Hallarp beige', 32, '16000֏', '35000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C011', 'STEFAN', '42x90 cm', 'Chair, brown-black/Knisa grey/beige', 95, '12000֏', '23000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C012', 'SAKARIAS', '60x96 cm', 'Chair with armrests, black/Kvillsfors', 106, '57000֏', '72000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C013', 'LERHAMN', '42x85 cm', 'Chair, light antique stain/Vittaryd beige', 108, '8000֏', '19000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C014', 'KARLJAN', '49x81 cm', 'Chair, dark grey/Kabusa dark grey', 109, '11000֏', '17000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C015', 'TEODORES', '46x80 cm', 'Chair, white', 123, '8500֏', '15700֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C016', 'ODGER', '45x81 cm', 'Chair, anthracite', 95, '16000֏', '39000֏', 'Chair');
INSERT INTO `IKEA`.`Products` (`ProductCode`, `ProductName`, `ProductScale`, `ProductDescription`, `QuantityInStock`, `ProductionCost`, `ProductPrice`, `ProductLine`) VALUES ('C017', 'ADDE', '39x77 cm', 'Chair, black', 48, '2900֏', '7800֏', 'Chair');

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`Orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (1, '2022-01-12', '2022-01-19', '2022-01-19', 'Shipped', NULL, 1, 1);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (2, '2022-02-15', '2022-02-18', '2022-02-21', 'Shipped', NULL, 1, 1);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (3, '2022-03-19', '2022-03-21', '2022-03-22', 'Shipped', NULL, 2, 2);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (4, '2022-01-11', '2022-01-13', '2022-01-15', 'Shipped', 'All good!', 3, 3);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (5, '2022-01-25', '2022-01-29', '2022-01-28', 'Shipped', NULL, 3, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (6, '2022-05-19', '2022-05-21', NULL, 'In Progress', NULL, 3, 3);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (7, '2022-05-01', '2022-05-10', '2022-05-10', 'Shipped', NULL, 4, 4);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (8, '2022-02-12', '2022-02-15', NULL, 'On Hold', 'The current item is out of stock', 5, 5);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (9, '2022-03-15', '2022-03-19', NULL, 'Cancelled', 'Customer asked us to cancel the order.', 6, 6);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (10, '2022-01-15', '2022-01-19', '2022-01-07', 'Shipped', NULL, 9, 7);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (11, '2022-02-14', '2022-02-18', '2022-02-18', 'Shipped', NULL, 9, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (12, '2022-02-01', '2022-02-10', '2022-02-09', 'Shipped', NULL, 10, 8);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (13, '2022-01-01', '2022-01-09', NULL, 'On Hold', 'The current item is out of stock', 11, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (14, '2022-01-06', '2022-01-08', '2022-01-09', 'Shipped', NULL, 12, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (15, '2022-02-01', '2022-02-08', '2022-02-06', 'Shipped', NULL, 12, 9);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (16, '2022-02-06', '2022-02-11', '2022-02-10', 'Shipped', NULL, 13, 10);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (17, '2022-03-02', '2022-03-06', '2022-03-06', 'Shipped', NULL, 13, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (18, '2022-01-02', '2022-01-05', '2022-01-10', 'Shipped', NULL, 14, 11);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (19, '2022-03-05', '2022-03-08', NULL, 'Cancelled', 'Customer asked us to cancel the order.', 15, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (20, '2022-02-02', '2022-02-09', NULL, 'Cancelled', NULL, 15, 12);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (21, '2022-03-02', '2022-03-08', NULL, 'Cancelled', 'Customer asked us to cancel the order.', 15, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (22, '2022-03-01', '2022--03-08', '2022-03-09', 'Shipped', NULL, 15, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (23, '2022-01-02', '2022-01-05', '2022-02-04', 'Shipped', NULL, 15, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (24, '2022-02-06', '2022-02-10', '2022-02-10', 'Shipped', NULL, 16, 3);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (25, '2022-04-01', '2022-04-10', NULL, 'Cancelled', 'Customer asked us to cancel the order.', 18, 12);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (26, '2022-01-25', '2022-02-02', NULL, 'On Hold', 'The current item is out of stock', 20, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (27, '2022-02-02', '2022-02-08', NULL, 'Cancelled', 'Customer asked us to cancel the order.', 21, 11);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (28, '2022-04-05', '2022-04-11', '2022-04-18', 'Shipped', NULL, 21, 8);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (29, '2022-04-15', '2022-04-20', '2022-04-19', 'Shipped', 'The customer was rude to the delivery guy!', 21, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (30, '2022-04-11', '2022-04-15', '2022-04-15', 'Shipped', NULL, 21, 7);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (31, '2022-01-03', '2022-01-09', '2022-01-08', 'Shipped', 'The customer gave 20$ as a tip!', 22, 7);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (32, '2022-02-01', '2022-02-04', '2022-02-05', 'Shipped', NULL, 25, 9);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (33, '2022-01-15', '2022-01-19', '2022-01-21', 'Shipped', '', 25, 5);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (34, '2022-02-05', '2022-02-09', '2022-02-13', 'Shipped', 'Super nice customer!', 26, NULL);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (35, '2022-03-05', '2022-03-10', '2022-03-12', 'On Hold', 'The current item is out of stock', 28, 6);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (36, '2022-01-01', '2022-01-09', '2022-01-11', 'Shipped', NULL, 30, 6);
INSERT INTO `IKEA`.`Orders` (`OrderNumber`, `OrderDate`, `RequiredDate`, `ShippedDate`, `Status`, `Comments`, `CustomerID`, `BranchCode`) VALUES (37, '2022-03-02', '2022-03-08', '2022-03-10', 'Shipped', NULL, 30, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`ProductProduction`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B001', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B002', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B002', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B002', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B003', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B003', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B004', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B004', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B004', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B005', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B005', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B006', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B007', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('B007', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('BS001', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('BS001', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('BS002', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('BS003', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('BS004', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('BS004', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('BS005', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('BS006', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('S001', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('S002', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('S003', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('S004', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('S005', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('S006', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('D001', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('D001', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('D002', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('D003', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('D004', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('D004', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('D005', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T001', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T001', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T002', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T003', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T004', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T004', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T005', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T005', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T006', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T006', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T007', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T008', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T009', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T010', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T010', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T011', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T012', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T013', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T013', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T014', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('T015', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('W001', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('W001', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('W002', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('W003', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('W004', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('W004', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('W005', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A001', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A001', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A002', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A002', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A003', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A004', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A005', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A005', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A006', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A007', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A008', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A008', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('A009', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C001', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C001', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C002', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C003', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C004', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C005', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C006', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C006', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C007', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C008', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C008', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C009', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C010', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C010', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C011', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C012', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C013', 1);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C013', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C014', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C015', 4);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C016', 3);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C016', 2);
INSERT INTO `IKEA`.`ProductProduction` (`ProductCode`, `FactoryID`) VALUES ('C017', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`ProductDeliveryToWarehouses`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'B001', 12, '2022-01-02', '2022-01-05');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'B002', 15, '2022-01-05', '2022-01-07');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'B003', 2, '2022-01-15', '2022-01-18');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'B005', 3, '2022-01-19', '2022-01-22');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'B005', 6, '2022-01-17', '2022-01-20');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'B005', 7, '2022-01-12', '2022-01-16');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'B004', 15, '2022-02-22', '2022-02-26');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'B003', 12, '2022-05-21', '2022-05-15');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'C001', 10, '2022-02-26', '2022-03-01');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'C003', 11, '2022-03-12', '2022-03-15');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'C002', 9, '2022-01-02', '2022-01-05');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'C015', 7, '2022-01-09', '2022-01-13');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'C012', 8, '2022-01-12', '2022-01-06');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (001, 'C006', 16, '2022-01-16', '2022-01-19');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'C008', 15, '2022-04-02', '2022-04-06');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'C009', 12, '2022-01-02', '2022-01-06');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'D002', 11, '2022-03-15', '2022-03-18');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'D004', 10, '2022-02-16', '2022-02-18');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'D003', 13, '2022-01-12', '2022-01-16');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'BS002', 3, '2022-01-13', '2022-01-16');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'BS005', 8, '2022-03-12', '2022-03-16');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'BS002', 9, '2022-01-19', '2022-01-22');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'BS003', 7, '2022-03-12', '2022-03-16');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (002, 'D002', 4, '2022-03-19', '2022-03-22');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'D003', 5, '2022-01-18', '2022-01-21');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'W002', 6, '2022-01-16', '2022-01-19');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'W004', 10, '2022-01-14', '2022-01-18');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'W003', 11, '2022-01-07', '2022-01-10');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'W002', 12, '2022-01-09', '2022-01-15');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'D002', 12, '2022-01-09', '2022-01-13');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'D003', 13, '2022-01-15', '2022-01-19');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'D001', 13, '2022-01-16', '2022-01-19');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'B002', 15, '2022-02-15', '2022-02-19');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'B003', 16, '2022-04-12', '2022-04-16');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'B001', 17, '2022-04-22', '2022-04-23');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'B005', 18, '2022-01-12', '2022-01-18');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'T015', 12, '2022-01-22', '2022-01-25');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (003, 'T001', 10, '2022-05-02', '2022-05-05');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'T003', 2, '2022-01-02', '2022-01-06');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'T004', 3, '2022-01-02', '2022-01-08');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'T006', 4, '2022-02-02', '2022-02-06');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'T008', 5, '2022-01-06', '2022-01-08');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'T009', 6, '2022-01-09', '2022-01-13');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'T006', 9, '2022-01-07', '2022-01-12');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'T002', 8, '2022-01-15', '2022-01-19');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'W003', 7, '2022-01-16', '2022-01-18');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'W005', 4, '2022-03-12', '2022-03-18');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'W001', 5, '2022-02-12', '2022-02-16');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'A019', 6, '2022-02-12', '2022-02-18');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'A015', 1, '2022-01-02', '2022-01-10');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'A001', 2, '2022-01-02', '2022-01-07');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'A006', 3, '2022-05-12', '2022-05-19');
INSERT INTO `IKEA`.`ProductDeliveryToWarehouses` (`WarehouseID`, `ProductCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES (004, 'A014', 5, '2022-04-13', '2022-04-19');

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`ProductDeliveryToBranches`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('B002', 1, 12, '2021-01-10', '2021-01-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('B004', 1, 12, '2021-01-15', '2021-01-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('B005', 1, 12, '2021-02-01', '2021-02-04');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('B001', 1, 1, '2021-02-06', '2021-02-10');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('S001', 1, 2, '2021-02-15', '2021-02-20');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('S002', 1, 6, '2021-03-06', '2021-03-09');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('S003', 2, 6, '2021-03-10', '2021-03-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('S005', 2, 6, '2021-03-22', '2021-03-25');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('S004', 2, 6, '2021-04-05', '2021-04-08');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('S006', 2, 14, '2021-04-10', '2021-04-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('BS006', 2, 1, '2021-04-15', '2021-04-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('BS002', 2, 15, '2021-04-01', '2021-04-04');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('BS002', 3, 12, '2021-04-20', '2021-04-23');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('BS003', 3, 12, '2021-04-13', '2021-04-16');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('D001', 3, 12, '2021-04-30', '2021-05-03');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('D002', 3, 1, '2021-05-02', '2021-05-05');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('D003', 3, 15, '2021-05-15', '2021-05-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('D004', 3, 25, '2021-05-16', '2021-05-19');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('D005', 3, 2, '2021-05-20', '2021-05-23');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('D001', 4, 26, '2021-05-25', '2021-05-30');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T011', 4, 14, '2021-06-02', '2021-06-05');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T001', 4, 12, '2021-08-13', '2021-08-15');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T003', 4, 2, '2021-08-19', '2021-08-23');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T004', 4, 1, '2021-09-20', '2021-09-22');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T005', 4, 15, '2021-10-25', '2021-10-28');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T006', 5, 6, '2021-11-30', '2021-12-02');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T008', 5, 7, '2022-01-04', '2022-01-07');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T009', 5, 8, '2022-01-06', '2022-01-09');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T010', 5, 9, '2022-01-14', '2022-01-20');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('T012', 5, 8, '2022-01-21', '2022-01-24');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('W001', 5, 9, '2022-01-30', '2022-02-02');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('W002', 5, 8, '2022-02-01', '2022-02-04');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('W003', 5, 9, '2022-02-05', '2022-02-08');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('W001', 6, 7, '2022-02-07', '2022-02-10');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('W005', 6, 8, '2022-02-20', '2022-02-24');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('W006', 6, 4, '2022-03-04', '2022-03-07');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('A001', 6, 5, '2022-03-21', '2022-03-24');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('A002', 6, 12, '2022-03-29', '2022-04-04');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('A003', 6, 21, '2022-04-15', '2022-04-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('A005', 6, 5, '2022-04-20', '2022-04-23');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('A009', 7, 23, '2022-05-02', '2022-05-04');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('A008', 7, 15, '2022-05-03', '2022-05-06');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('A007', 7, 18, '2022-05-10', '2022-05-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C001', 7, 1, '2022-05-12', '2022-05-15');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C002', 7, 2, '2022-01-11', '2022-01-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C003', 8, 13, '2022-02-05', '2022-02-08');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C004', 8, 4, '2022-03-11', '2022-03-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C005', 8, 9, '2022-01-01', '2022-01-08');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C007', 9, 5, '2022-02-15', '2022-02-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C008', 9, 5, '2022-03-02', '2022-03-06');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C010', 9, 8, '2022-05-01', '2022-05-08');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C011', 10, 1, '2022-03-02', '2022-03-07');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C012', 10, 9, '2022-04-05', '2022-04-08');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C013', 10, 12, '2022-05-02', '2022-05-06');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C011', 11, 20, '2022-05-09', '2022-05-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C010', 11, 2, '2022-01-05', '2022-01-08');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('BS001', 11, 6, '2022-05-24', '2022-05-27');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('BS002', 11, 2, '2022-05-04', '2022-05-08');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('BS003', 11, 2, '2022-04-11', '2022-04-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C001', 12, 6, '2022-05-13', '2022-05-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C002', 12, 1, '2022-01-22', '2022-01-26');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C003', 12, 2, '2022-01-11', '2022-01-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C004', 12, 5, '2022-01-11', '2022-01-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C011', 12, 6, '2022-05-13', '2022-05-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C012', 12, 26, '2022-05-13', '2022-05-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C013', 12, 32, '2022-01-11', '2022-01-13');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C014', 12, 2, '2022-05-13', '2022-05-18');
INSERT INTO `IKEA`.`ProductDeliveryToBranches` (`ProductCode`, `BranchCode`, `Quantity`, `DateShipped`, `DateDelivered`) VALUES ('C015', 12, 32, '2022-01-11', '2022-01-13');

COMMIT;


-- -----------------------------------------------------
-- Data for table `IKEA`.`OrderDetails`
-- -----------------------------------------------------
START TRANSACTION;
USE `IKEA`;
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (1, 'B004', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (1, 'BS001', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (2, 'C003', '7');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (2, 'C005', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (2, 'T003', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (3, 'S005', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (4, 'W002', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (5, 'T011', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (6, 'C015', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (7, 'A003', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (7, 'S005', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (8, 'W003', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (8, 'W002', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (8, 'S005', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (9, 'A002', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (10, 'D005', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (11, 'BS004', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (12, 'D004', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (13, 'T006', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (14, 'A008', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (14, 'C013', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (15, 'C016', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (16, 'B007', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (17, 'S004', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (18, 'S004', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (19, 'D004', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (20, 'S004', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (20, 'C005', '3');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (21, 'C007', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (22, 'W001', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (23, 'W003', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (24, 'A008', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (25, 'B001', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (26, 'S004', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (27, 'T015', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (28, 'T014', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (29, 'S003', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (29, 'T001', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (29, 'B005', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (30, 'T001', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (30, 'S004', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (31, 'W005', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (31, 'W004', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (32, 'T013', '3');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (33, 'A008', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (34, 'A001', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (35, 'S001', '2');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (35, 'B005', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (36, 'BS002', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (36, 'D003', '1');
INSERT INTO `IKEA`.`OrderDetails` (`OrderNumber`, `ProductCode`, `QuantityOrdered`) VALUES (37, 'S004', '2');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
