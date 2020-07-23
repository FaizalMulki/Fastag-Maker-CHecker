CREATE DATABASE  IF NOT EXISTS `fastag` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fastag`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: fastag
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DocumentName` varchar(1250) DEFAULT NULL,
  `DocumentType` varchar(1250) DEFAULT NULL,
  `Extension` varchar(1250) DEFAULT NULL,
  `DocumentPath` varchar(5545) DEFAULT NULL,
  `Documents` mediumblob,
  `ReferenceId` int DEFAULT NULL,
  `IsVehicle` tinyint DEFAULT NULL,
  `IdType` varchar(400) DEFAULT NULL,
  `IsPAN` tinyint DEFAULT NULL,
  `CreatedBy` varchar(500) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `IsDeleted` tinyint DEFAULT NULL,
  `DeletedBy` varchar(500) DEFAULT NULL,
  `DeletedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ForeignReference_idx` (`ReferenceId`),
  CONSTRAINT `registration_document_id` FOREIGN KEY (`ReferenceId`) REFERENCES `registration` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recharge`
--

DROP TABLE IF EXISTS `recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recharge` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VehicleRegNo` varchar(150) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `TransactionId` varchar(45) DEFAULT NULL,
  `WLTransactionId` varchar(45) DEFAULT NULL,
  `FinacleReference` varchar(45) DEFAULT NULL,
  `ResponseCode` varchar(45) DEFAULT NULL,
  `ResponseMsg` varchar(505) DEFAULT NULL,
  `AmountDeducted` tinyint DEFAULT NULL,
  `RechargeSuccess` tinyint DEFAULT NULL,
  `CreatedBy` varchar(500) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `BranchCode` varchar(45) DEFAULT NULL,
  `PaymentType` varchar(45) DEFAULT NULL,
  `FromAccountNumber` varchar(55) DEFAULT NULL,
  `ToAccountNumber` varchar(55) DEFAULT NULL,
  `StatusId` int DEFAULT NULL,
  `RechargedBy` varchar(500) DEFAULT NULL,
  `RechargedDate` datetime DEFAULT NULL,
  `IsDeleted` tinyint DEFAULT NULL,
  `UpdatedBy` varchar(500) DEFAULT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Recharge_Status_Id_idx` (`StatusId`),
  CONSTRAINT `Recharge_Status_Id` FOREIGN KEY (`StatusId`) REFERENCES `status` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recharge`
--

LOCK TABLES `recharge` WRITE;
/*!40000 ALTER TABLE `recharge` DISABLE KEYS */;
INSERT  IGNORE INTO `recharge` (`Id`, `VehicleRegNo`, `Amount`, `TransactionId`, `WLTransactionId`, `FinacleReference`, `ResponseCode`, `ResponseMsg`, `AmountDeducted`, `RechargeSuccess`, `CreatedBy`, `CreatedDate`, `BranchCode`, `PaymentType`, `FromAccountNumber`, `ToAccountNumber`, `StatusId`, `RechargedBy`, `RechargedDate`, `IsDeleted`, `UpdatedBy`, `UpdatedDate`) VALUES (2,'WB02AF8126',7.00,'KBL2307202014849','20200723T083932770Z','    D1857','00','SUCCESS',1,1,'admin','2020-07-23 14:07:43','001','Transfer','4732500101964301','4362500100484501',2,'admin','2020-07-23 14:08:56',0,'admin','2020-07-23 14:08:07'),(3,'WB02AF8126',8.00,'KBL23072020141215','20200723T084258160Z','    D1860','00','SUCCESS',1,1,'admin','2020-07-23 14:10:16','001','Transfer','4732500101964301','4362500100484501',2,'admin','2020-07-23 14:12:22',0,'admin','2020-07-23 14:11:57'),(4,'WB02AF8126',3.00,'KBL23072020142923','','','','',0,0,'admin','2020-07-23 14:29:24','001','Transfer','4732500101964301','4362500100484501',1,'',NULL,1,'',NULL);
/*!40000 ALTER TABLE `recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(145) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `DeliveryAddress` varchar(1500) DEFAULT NULL,
  `VehicleTypeId` int DEFAULT NULL,
  `VehicleRegNo` varchar(150) DEFAULT NULL,
  `SecurityDeposit` decimal(10,2) DEFAULT NULL,
  `FastagFee` decimal(10,2) DEFAULT NULL,
  `MinimumBalanceDeposit` decimal(10,2) DEFAULT NULL,
  `Others` int DEFAULT NULL,
  `TotalPayable` decimal(10,2) DEFAULT NULL,
  `IsDeleted` tinyint DEFAULT NULL,
  `CreatedBy` varchar(500) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(500) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ReferenceNumber` varchar(300) DEFAULT NULL,
  `PaymentType` varchar(45) DEFAULT NULL,
  `FromAccountNumber` varchar(45) DEFAULT NULL,
  `ToAccountNumber` varchar(45) DEFAULT NULL,
  `BranchCode` varchar(45) DEFAULT NULL,
  `FatherName` varchar(500) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `FinacleTransNumber` varchar(255) DEFAULT NULL,
  `StatusId` int DEFAULT NULL,
  `ApprovedBy` varchar(500) DEFAULT NULL,
  `ApproverBranchCode` varchar(50) DEFAULT NULL,
  `ApprovedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `vehicle_registartion_id_idx` (`VehicleTypeId`),
  KEY `status_registration_id_idx` (`StatusId`),
  CONSTRAINT `status_registration_id` FOREIGN KEY (`StatusId`) REFERENCES `status` (`Id`),
  CONSTRAINT `vehicle_registartion_id` FOREIGN KEY (`VehicleTypeId`) REFERENCES `vehicletype` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VehicleTypeId` int DEFAULT NULL,
  `RefundableSecurityDeposit` decimal(10,2) DEFAULT NULL,
  `FastagFee` decimal(10,2) DEFAULT NULL,
  `MinimumBalanceWalletDeposit` decimal(10,2) DEFAULT NULL,
  `Others` decimal(10,2) DEFAULT NULL,
  `IsDeleted` tinyint DEFAULT '0',
  `CreatedBy` varchar(500) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(500) DEFAULT NULL,
  `EffectiveFrom` datetime DEFAULT NULL,
  `EffectiveTo` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `VehicleTypeReference_idx` (`VehicleTypeId`),
  CONSTRAINT `VehicleTypeReference` FOREIGN KEY (`VehicleTypeId`) REFERENCES `vehicletype` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(75) DEFAULT NULL,
  `Code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT  IGNORE INTO `status` (`Id`, `Name`, `Code`) VALUES (1,'Pending','Pending'),(2,'Approved','Approved');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletype` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(150) DEFAULT NULL,
  `Code` varchar(150) DEFAULT NULL,
  `IsDeleted` tinyint DEFAULT NULL,
  `CreatedBy` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(250) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT  IGNORE INTO `vehicletype` (`Id`, `Type`, `Code`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (7,'Car',NULL,0,'admin','2020-06-04 14:36:37',NULL,'0001-01-01 00:00:00'),(8,'Jeep',NULL,1,'admin','2020-06-04 15:38:56',NULL,'0001-01-01 00:00:00'),(9,'Jeep',NULL,0,'admin','2020-06-13 13:32:03','admin','2020-06-19 10:46:48');
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fastag'
--

--
-- Dumping routines for database 'fastag'
--
/*!50003 DROP PROCEDURE IF EXISTS `CheckDataWithinDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckDataWithinDateRange`(
IN VehicleTypeId INT,
IN EffectiveFrom varchar(200),
IN EffectiveTo varchar(200))
BEGIN
Select * from setting s where s.IsDeleted = 0 and s.VehicleTypeId= VehicleTypeId and (s.EffectiveFrom <= EffectiveFrom and s.EffectiveTo >= EffectiveTo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllItemsForApproval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllItemsForApproval`(
IN CreatedBy varchar(450),
IN BranchCode varchar(250),
IN Search varchar(1000),
IN FromDate varchar(100),
IN ToDate varchar(100),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  
)
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,r.*,v.Type as VehicleType,s.Name as StatusName from fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
inner join fastag.status s on s.Id=r.StatusId
where r.isdeleted=0 and r.CreatedBy!=CreatedBy and r.BranchCode=BranchCode and s.Code='Pending' and date(r.CreatedDate) between FromDate and ToDate
and ( r.FirstName LIKE CONCAT ('%', Search, '%') 
		OR r.LastName LIKE CONCAT ('%', Search, '%') OR r.Email LIKE CONCAT ('%', Search, '%') OR r.Mobile LIKE CONCAT ('%', Search, '%') OR r.ReferenceNumber LIKE CONCAT ('%', Search, '%') OR v.Type LIKE CONCAT ('%', Search, '%') OR r.CreatedBy LIKE CONCAT ('%', Search, '%') OR s.Name LIKE CONCAT ('%', Search, '%')
        or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from  fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
inner join fastag.status s on s.Id=r.StatusId
where r.isdeleted=0 and r.CreatedBy!=CreatedBy and r.BranchCode=BranchCode and s.Code='Pending' and date(r.CreatedDate) between FromDate and ToDate
 and ( r.FirstName LIKE CONCAT ('%', Search, '%') 
		OR r.LastName LIKE CONCAT ('%', Search, '%') OR r.Email LIKE CONCAT ('%', Search, '%') OR r.Mobile LIKE CONCAT ('%', Search, '%') OR r.ReferenceNumber LIKE CONCAT ('%', Search, '%') OR v.Type LIKE CONCAT ('%', Search, '%') OR r.CreatedBy LIKE CONCAT ('%', Search, '%') OR s.Name LIKE CONCAT ('%', Search, '%')
        or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllItemsForDashBoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllItemsForDashBoard`(
IN BranchCode varchar(250),
IN Search varchar(500),
IN FromDate varchar(100),
IN ToDate varchar(100),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  
)
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,r.*,v.Type as VehicleType,s.Name as StatusName from fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
inner join fastag.status s on s.Id=r.StatusId
where r.isdeleted=0 and r.BranchCode=BranchCode and date(r.CreatedDate) between FromDate and ToDate
and ( r.FirstName LIKE CONCAT ('%', Search, '%') 
		OR r.LastName LIKE CONCAT ('%', Search, '%') OR r.Email LIKE CONCAT ('%', Search, '%') OR r.Mobile LIKE CONCAT ('%', Search, '%') OR r.ReferenceNumber LIKE CONCAT ('%', Search, '%') OR v.Type LIKE CONCAT ('%', Search, '%') OR r.CreatedBy LIKE CONCAT ('%', Search, '%')  OR s.Name LIKE CONCAT ('%', Search, '%')
        or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from  fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
inner join fastag.status s on s.Id=r.StatusId
where r.isdeleted=0 and r.BranchCode=BranchCode and date(r.CreatedDate) between FromDate and ToDate
 and ( r.FirstName LIKE CONCAT ('%', Search, '%') 
		OR r.LastName LIKE CONCAT ('%', Search, '%') OR r.Email LIKE CONCAT ('%', Search, '%') OR r.Mobile LIKE CONCAT ('%', Search, '%') OR r.ReferenceNumber LIKE CONCAT ('%', Search, '%') OR v.Type LIKE CONCAT ('%', Search, '%') OR r.CreatedBy LIKE CONCAT ('%', Search, '%') OR s.Name LIKE CONCAT ('%', Search, '%')
        or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllRecharges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllRecharges`(
IN BranchCode varchar(250),
IN Search varchar(1000),
IN FromDate varchar(100),
IN ToDate varchar(100),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  

)
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,r.*, s.Name as StatusName from fastag.recharge r
inner join fastag.status s on s.Id=r.StatusId
where r.IsDeleted=0 and r.BranchCode=BranchCode and date(r.CreatedDate) between FromDate and ToDate
and ( r.VehicleRegNo LIKE CONCAT ('%', Search, '%') 
OR r.Amount LIKE CONCAT ('%', Search, '%')
OR r.TransactionId LIKE CONCAT ('%', Search, '%')
OR r.WLTransactionId LIKE CONCAT ('%', Search, '%')
OR r.FinacleReference LIKE CONCAT ('%', Search, '%')
OR r.CreatedBy LIKE CONCAT ('%', Search, '%')
OR r.BranchCode LIKE CONCAT ('%', Search, '%')
OR r.PaymentType LIKE CONCAT ('%', Search, '%')
OR r.FromAccountNumber LIKE CONCAT ('%', Search, '%')
OR r.ToAccountNumber LIKE CONCAT ('%', Search, '%')
OR r.PaymentType LIKE CONCAT ('%', Search, '%')
OR s.Name LIKE CONCAT ('%', Search, '%')
or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from  fastag.recharge r
 inner join fastag.status s on s.Id=r.StatusId
where r.IsDeleted=0 and r.BranchCode=BranchCode and date(r.CreatedDate) between FromDate and ToDate
 and ( r.VehicleRegNo LIKE CONCAT ('%', Search, '%') 
OR r.Amount LIKE CONCAT ('%', Search, '%')
OR r.TransactionId LIKE CONCAT ('%', Search, '%')
OR r.WLTransactionId LIKE CONCAT ('%', Search, '%')
OR r.FinacleReference LIKE CONCAT ('%', Search, '%')
OR r.CreatedBy LIKE CONCAT ('%', Search, '%')
OR r.BranchCode LIKE CONCAT ('%', Search, '%')
OR r.PaymentType LIKE CONCAT ('%', Search, '%')
OR r.FromAccountNumber LIKE CONCAT ('%', Search, '%')
OR r.ToAccountNumber LIKE CONCAT ('%', Search, '%')
OR r.PaymentType LIKE CONCAT ('%', Search, '%')
OR s.Name LIKE CONCAT ('%', Search, '%')
or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllRechargesForApproval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllRechargesForApproval`(
IN CreatedBy varchar(450),
IN BranchCode varchar(250),
IN Search varchar(1000),
IN FromDate varchar(100),
IN ToDate varchar(100),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  

)
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,r.*,s.Name as StatusName from fastag.recharge r
inner join fastag.status s on s.Id=r.StatusId
where  r.IsDeleted=0 and r.CreatedBy!=CreatedBy and r.BranchCode=BranchCode and s.Code='Pending' and date(r.CreatedDate) between FromDate and ToDate
and ( r.VehicleRegNo LIKE CONCAT ('%', Search, '%') 
OR r.Amount LIKE CONCAT ('%', Search, '%')
OR r.TransactionId LIKE CONCAT ('%', Search, '%')
OR r.WLTransactionId LIKE CONCAT ('%', Search, '%')
OR r.FinacleReference LIKE CONCAT ('%', Search, '%')
OR r.CreatedBy LIKE CONCAT ('%', Search, '%')
OR r.BranchCode LIKE CONCAT ('%', Search, '%')
OR r.PaymentType LIKE CONCAT ('%', Search, '%')
OR r.FromAccountNumber LIKE CONCAT ('%', Search, '%')
OR r.ToAccountNumber LIKE CONCAT ('%', Search, '%')
OR r.PaymentType LIKE CONCAT ('%', Search, '%')
OR s.Name LIKE CONCAT ('%', Search, '%')
or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from  fastag.recharge r
 inner join fastag.status s on s.Id=r.StatusId
where r.IsDeleted=0 and r.CreatedBy!=CreatedBy and r.BranchCode=BranchCode and s.Code='Pending' and date(r.CreatedDate) between FromDate and ToDate
and ( r.VehicleRegNo LIKE CONCAT ('%', Search, '%') 
OR r.Amount LIKE CONCAT ('%', Search, '%')
OR r.TransactionId LIKE CONCAT ('%', Search, '%')
OR r.WLTransactionId LIKE CONCAT ('%', Search, '%')
OR r.FinacleReference LIKE CONCAT ('%', Search, '%')
OR r.CreatedBy LIKE CONCAT ('%', Search, '%')
OR r.BranchCode LIKE CONCAT ('%', Search, '%')
OR r.PaymentType LIKE CONCAT ('%', Search, '%')
OR r.FromAccountNumber LIKE CONCAT ('%', Search, '%')
OR r.ToAccountNumber LIKE CONCAT ('%', Search, '%')
OR r.PaymentType LIKE CONCAT ('%', Search, '%')
OR s.Name LIKE CONCAT ('%', Search, '%')
or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllRegisterdItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllRegisterdItems`(
IN BranchCode varchar(250),
IN Search varchar(1000),
IN FromDate varchar(100),
IN ToDate varchar(100),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  
)
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,r.*,v.Type as VehicleType,s.Name as StatusName from fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
inner join fastag.status s on s.Id=r.StatusId
where r.isdeleted=0 and r.BranchCode=BranchCode and date(r.CreatedDate) between FromDate and ToDate
and ( r.FirstName LIKE CONCAT ('%', Search, '%') 
		OR r.LastName LIKE CONCAT ('%', Search, '%') OR r.Email LIKE CONCAT ('%', Search, '%') OR r.Mobile LIKE CONCAT ('%', Search, '%') OR r.ReferenceNumber LIKE CONCAT ('%', Search, '%') OR v.Type LIKE CONCAT ('%', Search, '%') OR r.CreatedBy LIKE CONCAT ('%', Search, '%')  OR s.Name LIKE CONCAT ('%', Search, '%')
        or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from  fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
inner join fastag.status s on s.Id=r.StatusId
where r.isdeleted=0 and r.BranchCode=BranchCode and date(r.CreatedDate) between FromDate and ToDate
 and ( r.FirstName LIKE CONCAT ('%', Search, '%') 
		OR r.LastName LIKE CONCAT ('%', Search, '%') OR r.Email LIKE CONCAT ('%', Search, '%') OR r.Mobile LIKE CONCAT ('%', Search, '%') OR r.ReferenceNumber LIKE CONCAT ('%', Search, '%') OR v.Type LIKE CONCAT ('%', Search, '%') OR r.CreatedBy LIKE CONCAT ('%', Search, '%') OR s.Name LIKE CONCAT ('%', Search, '%')
        or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllSettings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllSettings`(
IN Search varchar(1000),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  

)
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,s.*,v.Type as VehicleType from fastag.setting s
inner join fastag.vehicletype v on s.VehicleTypeId=v.Id
where s.isdeleted=0 
and (s.RefundableSecurityDeposit LIKE CONCAT ('%', Search, '%')
		OR s.MinimumBalanceWalletDeposit LIKE CONCAT ('%', Search, '%') OR s.Others LIKE CONCAT ('%', Search, '%') OR s.CreatedBy LIKE CONCAT ('%', Search, '%') 
        or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from fastag.setting s where s.isdeleted=0
 and 
		(s.RefundableSecurityDeposit LIKE CONCAT ('%', Search, '%') 	OR s.FastagFee LIKE CONCAT ('%', Search, '%') OR s.MinimumBalanceWalletDeposit LIKE CONCAT ('%', Search, '%') OR s.Others LIKE CONCAT ('%', Search, '%') OR s.CreatedBy LIKE CONCAT ('%', Search, '%') 
        or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllVehicles`(
IN Search varchar(1000),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  )
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,vt.* from fastag.vehicletype vt
where vt.isdeleted=0 
and ( vt.Type LIKE CONCAT ('%', Search, '%') 
		OR vt.CreatedBy LIKE CONCAT ('%', Search, '%') 
        or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from fastag.vehicletype vt where vt.isdeleted=0
and ( vt.Type LIKE CONCAT ('%', Search, '%') 
		OR vt.CreatedBy LIKE CONCAT ('%', Search, '%') 
        or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDashBoardCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDashBoardCount`(
IN BranchCode varchar(250)
/*IN IsSuperAdmin varchar(150),
IN CreatedBy varchar(250)*/
)
BEGIN
/*IF IsSuperAdmin = 'True' THEN*/

SELECT MAX(TotalRech) As TotalRech, MAX(TotalRechAmount) as TotalRechAmount , MAX(TotalReg) AS TotalReg, MAX(TotalAmount) as TotalAmount FROM (
select count(rcd.Id) As TotalRech,SUM(rcd.Amount) as TotalRechAmount ,0 AS TotalReg , 0 AS TotalAmount   FROM fastag.recharge rcd where rcd.isdeleted=0 and rcd.BranchCode=BranchCode and rcd.statusid=2
UNION ALL
SELECT 0 AS TotalRech, 0 AS TotalRechAmount, count(r.Id) As TotalReg,SUM(r.TotalPayable) as TotalAmount from fastag.registration r where r.isdeleted=0 and r.BranchCode=BranchCode and r.statusid=2)A;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRechargeById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRechargeById`(
IN Id INT
)
BEGIN
SELECT r.*,s.Name as StatusName from fastag.recharge r
inner join fastag.status s on s.Id=r.StatusId
where  r.Id=Id and r.IsDeleted=0 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRegisteredItemById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRegisteredItemById`(
IN Id INT
)
BEGIN
SELECT r.*,v.Type as VehicleType from fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
where  r.Id=Id and r.isdeleted=0 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-23 14:34:58
