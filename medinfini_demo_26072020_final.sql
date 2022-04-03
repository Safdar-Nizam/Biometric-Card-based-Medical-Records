CREATE DATABASE  IF NOT EXISTS `medinfini_demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medinfini_demo`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: medinfini_demo
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
-- Table structure for table `application_user_detail`
--

DROP TABLE IF EXISTS `application_user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_user_detail` (
  `user_detail_id` int NOT NULL AUTO_INCREMENT,
  `user_type_id` int DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `aadhar_card_num` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `father_name` varchar(45) DEFAULT NULL,
  `mother_name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `marital_status` varchar(45) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `blood_group` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `donate_blood` tinyint DEFAULT NULL,
  PRIMARY KEY (`user_detail_id`),
  KEY `fk_user_detail_user_type_idx` (`user_type_id`),
  CONSTRAINT `fk_user_detail_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `master_user_types` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_user_detail`
--

LOCK TABLES `application_user_detail` WRITE;
/*!40000 ALTER TABLE `application_user_detail` DISABLE KEYS */;
INSERT INTO `application_user_detail` VALUES (1,1,'Raj','Nerella','789456231','123156545648','abc@cde.com','srinivas','ramadevi','male','married',80,'B+','1987-11-21','Indian','Kukatpally',1),(2,4,'Rizwan Ahmed','Shoeb','741852963','77894561230','abc@cde.com','Riz','Shoe','male','single',60,'B+','1995-11-21','Indian','Kukatpally',1);
/*!40000 ALTER TABLE `application_user_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assoc_doctor_hospital`
--

DROP TABLE IF EXISTS `assoc_doctor_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assoc_doctor_hospital` (
  `assoc_doctor_hospital_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  PRIMARY KEY (`assoc_doctor_hospital_id`),
  KEY `assoc_doc_hosp_doc_idx` (`user_id`),
  KEY `assoc_doc_hosp_hosp_idx` (`hospital_id`),
  CONSTRAINT `assoc_doc_hosp_doc` FOREIGN KEY (`user_id`) REFERENCES `application_user_detail` (`user_detail_id`),
  CONSTRAINT `assoc_doc_hosp_hosp` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_details` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assoc_doctor_hospital`
--

LOCK TABLES `assoc_doctor_hospital` WRITE;
/*!40000 ALTER TABLE `assoc_doctor_hospital` DISABLE KEYS */;
INSERT INTO `assoc_doctor_hospital` VALUES (1,1,1);
/*!40000 ALTER TABLE `assoc_doctor_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assoc_staff_diagnonstic`
--

DROP TABLE IF EXISTS `assoc_staff_diagnonstic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assoc_staff_diagnonstic` (
  `assoc_staff_diagnostic_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `diagnostic_centre_id` int DEFAULT NULL,
  PRIMARY KEY (`assoc_staff_diagnostic_id`),
  KEY `assoc_staff_diag_staff_idx` (`staff_id`),
  KEY `assoc_staff_diag_diag_idx` (`diagnostic_centre_id`),
  CONSTRAINT `assoc_staff_diag_diag` FOREIGN KEY (`diagnostic_centre_id`) REFERENCES `diagnostic_centre` (`dg_centre_id`),
  CONSTRAINT `assoc_staff_diag_staff` FOREIGN KEY (`staff_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assoc_staff_diagnonstic`
--

LOCK TABLES `assoc_staff_diagnonstic` WRITE;
/*!40000 ALTER TABLE `assoc_staff_diagnonstic` DISABLE KEYS */;
/*!40000 ALTER TABLE `assoc_staff_diagnonstic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assoc_staff_hospital`
--

DROP TABLE IF EXISTS `assoc_staff_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assoc_staff_hospital` (
  `assoc_staff_hosp_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `hosp_id` int DEFAULT NULL,
  PRIMARY KEY (`assoc_staff_hosp_id`),
  KEY `assoc_staff_hosp_staff_idx` (`staff_id`),
  KEY `assoc_staff_hosp_hosp_idx` (`hosp_id`),
  CONSTRAINT `assoc_staff_hosp_hosp` FOREIGN KEY (`hosp_id`) REFERENCES `hospital_details` (`hospital_id`),
  CONSTRAINT `assoc_staff_hosp_staff` FOREIGN KEY (`staff_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assoc_staff_hospital`
--

LOCK TABLES `assoc_staff_hospital` WRITE;
/*!40000 ALTER TABLE `assoc_staff_hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `assoc_staff_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic_centre`
--

DROP TABLE IF EXISTS `diagnostic_centre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_centre` (
  `dg_centre_id` int NOT NULL AUTO_INCREMENT,
  `dg_centre_name` varchar(45) DEFAULT NULL,
  `dg_centre_address` varchar(45) DEFAULT NULL,
  `dg_centre_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dg_centre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic_centre`
--

LOCK TABLES `diagnostic_centre` WRITE;
/*!40000 ALTER TABLE `diagnostic_centre` DISABLE KEYS */;
INSERT INTO `diagnostic_centre` VALUES (1,'Raj Diag Centre','kukatpally','741852963');
/*!40000 ALTER TABLE `diagnostic_centre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_additional_details`
--

DROP TABLE IF EXISTS `doctor_additional_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_additional_details` (
  `doc_additional_detail_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `doc_specialization` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doc_additional_detail_id`),
  KEY `doc_add_dtls_user_idx` (`user_id`),
  CONSTRAINT `doc_add_dtls_user` FOREIGN KEY (`user_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_additional_details`
--

LOCK TABLES `doctor_additional_details` WRITE;
/*!40000 ALTER TABLE `doctor_additional_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_additional_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_presc_detail`
--

DROP TABLE IF EXISTS `doctor_presc_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_presc_detail` (
  `doc_presc_detail_id` int NOT NULL AUTO_INCREMENT,
  `doc_presc_main_id` int DEFAULT NULL,
  `what_medication` varchar(45) DEFAULT NULL,
  `when_medication` varchar(45) DEFAULT NULL,
  `how_medication` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doc_presc_detail_id`),
  KEY `doc_presc_dtl_main_idx` (`doc_presc_main_id`),
  CONSTRAINT `doc_presc_dtl_main` FOREIGN KEY (`doc_presc_main_id`) REFERENCES `doctor_presc_main` (`doc_presc_main_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_presc_detail`
--

LOCK TABLES `doctor_presc_detail` WRITE;
/*!40000 ALTER TABLE `doctor_presc_detail` DISABLE KEYS */;
INSERT INTO `doctor_presc_detail` VALUES (1,3,'Paracetamol','Daily one tab','with hot milk'),(2,3,'sinarest','Daily two tab','with water'),(3,4,'Paracetamol','Daily one tab','with hot milk'),(4,4,'sinarest','Daily two tab','with water'),(5,5,'dolo650','Daily two tab','with hot milk'),(6,5,'sinarest','Daily two tab','with water');
/*!40000 ALTER TABLE `doctor_presc_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_presc_lab_report`
--

DROP TABLE IF EXISTS `doctor_presc_lab_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_presc_lab_report` (
  `doctor_presc_lab_report_id` int NOT NULL AUTO_INCREMENT,
  `doc_presc_main_id` int DEFAULT NULL,
  `report_id` int DEFAULT NULL,
  `report_notes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doctor_presc_lab_report_id`),
  KEY `dc_pr_lb_rt_lab_rep_idx` (`report_id`),
  KEY `dc_pr_lb_rt_pres_idx` (`doc_presc_main_id`),
  CONSTRAINT `dc_pr_lb_rt_lab_rep` FOREIGN KEY (`report_id`) REFERENCES `master_lab_report` (`lab_report_id`),
  CONSTRAINT `dc_pr_lb_rt_pres` FOREIGN KEY (`doc_presc_main_id`) REFERENCES `doctor_presc_main` (`doc_presc_main_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_presc_lab_report`
--

LOCK TABLES `doctor_presc_lab_report` WRITE;
/*!40000 ALTER TABLE `doctor_presc_lab_report` DISABLE KEYS */;
INSERT INTO `doctor_presc_lab_report` VALUES (1,4,1,'do a chest CT scan'),(2,4,2,'Blood himoglobin test'),(3,5,3,'do a sugar test'),(4,5,2,'Blood himoglobin test');
/*!40000 ALTER TABLE `doctor_presc_lab_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_presc_main`
--

DROP TABLE IF EXISTS `doctor_presc_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_presc_main` (
  `doc_presc_main_id` int NOT NULL AUTO_INCREMENT,
  `pt_hosp_visit_id` int DEFAULT NULL,
  `doc_presc_main_notes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doc_presc_main_id`),
  KEY `doc_pres_main_visit_id_idx` (`pt_hosp_visit_id`),
  CONSTRAINT `doc_pres_main_visit_id` FOREIGN KEY (`pt_hosp_visit_id`) REFERENCES `patient_hospital_visits` (`pt_hosp_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_presc_main`
--

LOCK TABLES `doctor_presc_main` WRITE;
/*!40000 ALTER TABLE `doctor_presc_main` DISABLE KEYS */;
INSERT INTO `doctor_presc_main` VALUES (2,1,'my notes'),(3,1,'my notes'),(4,1,'my notes'),(5,2,'my notes updated');
/*!40000 ALTER TABLE `doctor_presc_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_details`
--

DROP TABLE IF EXISTS `hospital_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_details` (
  `hospital_id` int NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(45) DEFAULT NULL,
  `hospital_phone_number` varchar(45) DEFAULT NULL,
  `hospital_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_details`
--

LOCK TABLES `hospital_details` WRITE;
/*!40000 ALTER TABLE `hospital_details` DISABLE KEYS */;
INSERT INTO `hospital_details` VALUES (1,'Raj clinic','741852963','kukatpally');
/*!40000 ALTER TABLE `hospital_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_addictions`
--

DROP TABLE IF EXISTS `master_addictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_addictions` (
  `addiction_id` int NOT NULL AUTO_INCREMENT,
  `addiction_name` varchar(45) DEFAULT NULL,
  `addiction_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`addiction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_addictions`
--

LOCK TABLES `master_addictions` WRITE;
/*!40000 ALTER TABLE `master_addictions` DISABLE KEYS */;
INSERT INTO `master_addictions` VALUES (1,'Smoking','cigerattes'),(2,'Alcoholic','whiskey');
/*!40000 ALTER TABLE `master_addictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_diseases`
--

DROP TABLE IF EXISTS `master_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_diseases` (
  `disease_id` int NOT NULL AUTO_INCREMENT,
  `disease_name` varchar(45) DEFAULT NULL,
  `disease_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_diseases`
--

LOCK TABLES `master_diseases` WRITE;
/*!40000 ALTER TABLE `master_diseases` DISABLE KEYS */;
INSERT INTO `master_diseases` VALUES (1,'High Blood Pressure','High BP'),(2,'Low Blood Pressure','Low BP');
/*!40000 ALTER TABLE `master_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_lab_report`
--

DROP TABLE IF EXISTS `master_lab_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_lab_report` (
  `lab_report_id` int NOT NULL AUTO_INCREMENT,
  `lab_report_name` varchar(45) DEFAULT NULL,
  `lab_report_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`lab_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_lab_report`
--

LOCK TABLES `master_lab_report` WRITE;
/*!40000 ALTER TABLE `master_lab_report` DISABLE KEYS */;
INSERT INTO `master_lab_report` VALUES (1,'CT Scan','chest CT scan'),(2,'Himoglobin test','test himoglobin level'),(3,'Sugar test','Random blood sugar');
/*!40000 ALTER TABLE `master_lab_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_user_types`
--

DROP TABLE IF EXISTS `master_user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_user_types` (
  `user_type_id` int NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(45) DEFAULT NULL,
  `user_type_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_user_types`
--

LOCK TABLES `master_user_types` WRITE;
/*!40000 ALTER TABLE `master_user_types` DISABLE KEYS */;
INSERT INTO `master_user_types` VALUES (1,'Doctor','doctor'),(2,'Hospital Staff','receptionist, nurse'),(3,'Diagnostic Staff','lab staff'),(4,'Patient','patient'),(5,'Ambulance Driver','driver');
/*!40000 ALTER TABLE `master_user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_addictions`
--

DROP TABLE IF EXISTS `patient_addictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_addictions` (
  `patient_addiction_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `addiction_id` int DEFAULT NULL,
  `notes` varchar(45) DEFAULT NULL,
  `still_addicted` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patient_addiction_id`),
  KEY `fk_pk_adcn_adcn_idx` (`addiction_id`),
  KEY `fk_pt_adcn_patient_id_idx` (`patient_id`),
  CONSTRAINT `fk_pk_adcn_adcn` FOREIGN KEY (`addiction_id`) REFERENCES `master_addictions` (`addiction_id`),
  CONSTRAINT `fk_pt_adcn_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_addictions`
--

LOCK TABLES `patient_addictions` WRITE;
/*!40000 ALTER TABLE `patient_addictions` DISABLE KEYS */;
INSERT INTO `patient_addictions` VALUES (1,2,2,'drinking notes added','yes'),(2,2,2,'drinking notes','yes'),(3,2,1,'smoking notes','yes'),(4,2,2,'drinking notes','yes'),(5,2,1,'smoking notes','yes'),(6,2,2,'drinking notes','yes');
/*!40000 ALTER TABLE `patient_addictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_diagnostic_trans_detail`
--

DROP TABLE IF EXISTS `patient_diagnostic_trans_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_diagnostic_trans_detail` (
  `patient_diagnostic_trans_detail_id` int NOT NULL AUTO_INCREMENT,
  `patient_diagnostic_trans_main_id` int DEFAULT NULL,
  `report_id` int DEFAULT NULL,
  `notes` varchar(45) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_diagnostic_trans_detail_id`),
  KEY `pt_dg_tr_dt_main_idx` (`patient_diagnostic_trans_main_id`),
  KEY `pt_dg_tr_dt_rep_idx` (`report_id`),
  CONSTRAINT `pt_dg_tr_dt_main` FOREIGN KEY (`patient_diagnostic_trans_main_id`) REFERENCES `patient_diagnostic_trans_main` (`patient_diagnostic_trans_main_id`),
  CONSTRAINT `pt_dg_tr_dt_rep` FOREIGN KEY (`report_id`) REFERENCES `master_lab_report` (`lab_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_diagnostic_trans_detail`
--

LOCK TABLES `patient_diagnostic_trans_detail` WRITE;
/*!40000 ALTER TABLE `patient_diagnostic_trans_detail` DISABLE KEYS */;
INSERT INTO `patient_diagnostic_trans_detail` VALUES (1,1,3,'Sugar test Completed',''),(2,1,2,'Blood test completed','');
/*!40000 ALTER TABLE `patient_diagnostic_trans_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_diagnostic_trans_main`
--

DROP TABLE IF EXISTS `patient_diagnostic_trans_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_diagnostic_trans_main` (
  `patient_diagnostic_trans_main_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `doc_presc_main_id` int DEFAULT NULL,
  `dg_centre_id` int DEFAULT NULL,
  `date_visited` date DEFAULT NULL,
  `collect_reports_on` date DEFAULT NULL,
  `notes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patient_diagnostic_trans_main_id`),
  KEY `pt_dg_tr_mn_pt_id_idx` (`patient_id`),
  KEY `pt_db_tr_mn_presc_idx` (`doc_presc_main_id`),
  KEY `pt_db_tr_mn_dg_id_idx` (`dg_centre_id`),
  CONSTRAINT `pt_db_tr_mn_dg_id` FOREIGN KEY (`dg_centre_id`) REFERENCES `diagnostic_centre` (`dg_centre_id`),
  CONSTRAINT `pt_db_tr_mn_presc` FOREIGN KEY (`doc_presc_main_id`) REFERENCES `doctor_presc_main` (`doc_presc_main_id`),
  CONSTRAINT `pt_dg_tr_mn_pt` FOREIGN KEY (`patient_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_diagnostic_trans_main`
--

LOCK TABLES `patient_diagnostic_trans_main` WRITE;
/*!40000 ALTER TABLE `patient_diagnostic_trans_main` DISABLE KEYS */;
INSERT INTO `patient_diagnostic_trans_main` VALUES (1,2,5,1,'2020-07-26','2020-07-27','All reports');
/*!40000 ALTER TABLE `patient_diagnostic_trans_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_hospital_visits`
--

DROP TABLE IF EXISTS `patient_hospital_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_hospital_visits` (
  `pt_hosp_visit_id` int NOT NULL AUTO_INCREMENT,
  `date_visited` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  `next_visit_date` date DEFAULT NULL,
  PRIMARY KEY (`pt_hosp_visit_id`),
  KEY `pt_visit_hospital_idx` (`hospital_id`),
  KEY `pt_visit_patient_idx` (`user_id`),
  KEY `pt_visit_doctor_idx` (`doctor_id`),
  CONSTRAINT `pt_visit_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `application_user_detail` (`user_detail_id`),
  CONSTRAINT `pt_visit_hospital` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_details` (`hospital_id`),
  CONSTRAINT `pt_visit_patient` FOREIGN KEY (`user_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_hospital_visits`
--

LOCK TABLES `patient_hospital_visits` WRITE;
/*!40000 ALTER TABLE `patient_hospital_visits` DISABLE KEYS */;
INSERT INTO `patient_hospital_visits` VALUES (1,'2020-07-23',2,1,1,'2020-08-23'),(2,'2020-07-26',2,1,1,'2020-08-26');
/*!40000 ALTER TABLE `patient_hospital_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_medical_history`
--

DROP TABLE IF EXISTS `patient_medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_medical_history` (
  `patient_medical_history_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `disease_id` int DEFAULT NULL,
  `existig_from` date DEFAULT NULL,
  `is_current` tinyint DEFAULT NULL,
  `notes` varchar(45) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_medical_history_id`),
  KEY `med_hstry_disease_idx` (`disease_id`),
  KEY `med_hstry_patient_id_idx` (`patient_id`),
  CONSTRAINT `med_hstry_disease` FOREIGN KEY (`disease_id`) REFERENCES `master_diseases` (`disease_id`),
  CONSTRAINT `med_hstry_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_medical_history`
--

LOCK TABLES `patient_medical_history` WRITE;
/*!40000 ALTER TABLE `patient_medical_history` DISABLE KEYS */;
INSERT INTO `patient_medical_history` VALUES (1,2,1,'2020-11-21',0,'my notes cleared','My folder'),(2,2,2,'2020-01-22',0,'my notes2 clared','My folder2'),(3,2,1,'2020-11-21',1,'my notes','My folder'),(4,2,2,'2020-01-22',1,'my notes2','My folder2'),(5,2,1,'2020-11-21',1,'my notes','My folder'),(6,2,2,'2020-01-22',1,'my notes2','My folder2');
/*!40000 ALTER TABLE `patient_medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
  `user_address_id` int NOT NULL AUTO_INCREMENT,
  `user_detail_id` int DEFAULT NULL,
  `address_line1` varchar(45) DEFAULT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `post_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_address_id`),
  KEY `fk_address_user_detail_idx` (`user_detail_id`),
  CONSTRAINT `fk_address_user_detail` FOREIGN KEY (`user_detail_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login` (
  `user_login_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_login_id`),
  KEY `user_login_idx` (`user_id`),
  CONSTRAINT `user_login` FOREIGN KEY (`user_id`) REFERENCES `application_user_detail` (`user_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (1,1,'raj','password'),(2,2,'rizwan','password');
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-26 22:14:50
