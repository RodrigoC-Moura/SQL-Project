CREATE DATABASE  IF NOT EXISTS `Loja` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Loja`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 52.20.63.110    Database: Loja
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.24.04.1

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
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Desporto'),(2,'Campismo'),(3,'Natação'),(4,'Ginasio');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Telefone` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Novo Nome','novo@email.com',987654321),(2,'Cliente 2','cliente2@exemplo.com',1234567890),(3,'Cliente 3','cliente3@exemplo.com',1234567890);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fabricantes`
--

DROP TABLE IF EXISTS `Fabricantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fabricantes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fabricantes`
--

LOCK TABLES `Fabricantes` WRITE;
/*!40000 ALTER TABLE `Fabricantes` DISABLE KEYS */;
INSERT INTO `Fabricantes` VALUES (1,'Fabricante X'),(2,'Fabricante Y'),(3,'Fabricante Z');
/*!40000 ALTER TABLE `Fabricantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionarios`
--

DROP TABLE IF EXISTS `Funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `PosicaoID` int NOT NULL,
  `Salario` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Funcionarios_Posicao1_idx` (`PosicaoID`),
  CONSTRAINT `fk_Funcionarios_Posicao1` FOREIGN KEY (`PosicaoID`) REFERENCES `Posicao` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionarios`
--

LOCK TABLES `Funcionarios` WRITE;
/*!40000 ALTER TABLE `Funcionarios` DISABLE KEYS */;
INSERT INTO `Funcionarios` VALUES (1,'Funcionario 1',1,3000),(2,'Funcionario 2',2,2000),(3,'Funcionario 3',3,1500);
/*!40000 ALTER TABLE `Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItensPedido`
--

DROP TABLE IF EXISTS `ItensPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItensPedido` (
  `PedidoID` int NOT NULL,
  `ProdutoID` int NOT NULL,
  `Quantidade` int NOT NULL,
  `Preco` int NOT NULL,
  PRIMARY KEY (`PedidoID`,`ProdutoID`),
  KEY `fk_ItensPedido_Produtos1_idx` (`ProdutoID`),
  CONSTRAINT `fk_ItensPedido_Pedidos1` FOREIGN KEY (`PedidoID`) REFERENCES `Pedidos` (`ID`),
  CONSTRAINT `fk_ItensPedido_Produtos1` FOREIGN KEY (`ProdutoID`) REFERENCES `Produtos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItensPedido`
--

LOCK TABLES `ItensPedido` WRITE;
/*!40000 ALTER TABLE `ItensPedido` DISABLE KEYS */;
INSERT INTO `ItensPedido` VALUES (1,4,1,12),(1,6,1,200),(2,3,2,6),(2,7,1,150),(3,1,1,15),(3,5,1,100),(4,4,1,12),(4,6,1,200),(5,3,1,6),(5,7,1,150),(6,1,1,15),(6,5,1,100),(7,6,1,200),(8,6,1,200),(9,5,1,100);
/*!40000 ALTER TABLE `ItensPedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `VerificarStoque` BEFORE INSERT ON `ItensPedido` FOR EACH ROW BEGIN
    DECLARE quantidadeEmStoque INT;

    -- Obter a quantidade em estoque do produto
    SELECT QuantidadeEmStock
    INTO quantidadeEmStoque
    FROM Produtos
    WHERE ID = NEW.ProdutoID;

    -- Verificar se há estoque suficiente
    IF quantidadeEmStoque < NEW.`Quantidade` THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Estoque insuficiente do produto.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AtualizarStock` AFTER INSERT ON `ItensPedido` FOR EACH ROW BEGIN
    UPDATE Produtos
    SET QuantidadeEmStock = QuantidadeEmStock - NEW.Quantidade
    WHERE ID = NEW.ProdutoID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Pedidos`
--

DROP TABLE IF EXISTS `Pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedidos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ClienteID` int NOT NULL,
  `FuncionarioID` int NOT NULL,
  `DataPedido` date NOT NULL,
  `TotalPedido` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Pedidos_Clientes_idx` (`ClienteID`),
  KEY `fk_Pedidos_Funcionarios1_idx` (`FuncionarioID`),
  CONSTRAINT `fk_Pedidos_Clientes` FOREIGN KEY (`ClienteID`) REFERENCES `Clientes` (`ID`),
  CONSTRAINT `fk_Pedidos_Funcionarios1` FOREIGN KEY (`FuncionarioID`) REFERENCES `Funcionarios` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedidos`
--

LOCK TABLES `Pedidos` WRITE;
/*!40000 ALTER TABLE `Pedidos` DISABLE KEYS */;
INSERT INTO `Pedidos` VALUES (1,1,1,'2024-06-15',212),(2,2,2,'2024-06-16',162),(3,3,3,'2024-06-14',115),(4,1,1,'2024-06-13',212),(5,2,2,'2024-06-12',156),(6,3,3,'2024-06-11',115),(7,1,1,'2024-07-15',200),(8,1,1,'2024-07-16',100),(9,1,1,'2024-07-16',100);
/*!40000 ALTER TABLE `Pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posicao`
--

DROP TABLE IF EXISTS `Posicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Posicao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posicao`
--

LOCK TABLES `Posicao` WRITE;
/*!40000 ALTER TABLE `Posicao` DISABLE KEYS */;
INSERT INTO `Posicao` VALUES (1,'Gerente'),(2,'Vendedor'),(3,'Caixa');
/*!40000 ALTER TABLE `Posicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProdutoCategoria`
--

DROP TABLE IF EXISTS `ProdutoCategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProdutoCategoria` (
  `Produtos_ID` int NOT NULL,
  `Categorias_ID` int NOT NULL,
  PRIMARY KEY (`Produtos_ID`,`Categorias_ID`),
  KEY `fk_ProdutoCategoria_Categorias1_idx` (`Categorias_ID`),
  CONSTRAINT `fk_ProdutoCategoria_Categorias1` FOREIGN KEY (`Categorias_ID`) REFERENCES `Categorias` (`ID`),
  CONSTRAINT `fk_ProdutoCategoria_Produtos1` FOREIGN KEY (`Produtos_ID`) REFERENCES `Produtos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProdutoCategoria`
--

LOCK TABLES `ProdutoCategoria` WRITE;
/*!40000 ALTER TABLE `ProdutoCategoria` DISABLE KEYS */;
INSERT INTO `ProdutoCategoria` VALUES (1,1),(6,1),(2,2),(5,2),(4,3),(7,3),(3,4);
/*!40000 ALTER TABLE `ProdutoCategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProdutoMarca`
--

DROP TABLE IF EXISTS `ProdutoMarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProdutoMarca` (
  `Produtos_ID` int NOT NULL,
  `Fabricantes_ID` int NOT NULL,
  PRIMARY KEY (`Produtos_ID`,`Fabricantes_ID`),
  KEY `fk_ProdutoMarca_Fabricantes1_idx` (`Fabricantes_ID`),
  CONSTRAINT `fk_ProdutoMarca_Fabricantes1` FOREIGN KEY (`Fabricantes_ID`) REFERENCES `Fabricantes` (`ID`),
  CONSTRAINT `fk_ProdutoMarca_Produtos1` FOREIGN KEY (`Produtos_ID`) REFERENCES `Produtos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProdutoMarca`
--

LOCK TABLES `ProdutoMarca` WRITE;
/*!40000 ALTER TABLE `ProdutoMarca` DISABLE KEYS */;
INSERT INTO `ProdutoMarca` VALUES (4,1),(6,1),(2,2),(5,2),(1,3),(3,3),(7,3);
/*!40000 ALTER TABLE `ProdutoMarca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produtos`
--

DROP TABLE IF EXISTS `Produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produtos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Preco` int NOT NULL,
  `QuantidadeEmStock` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produtos`
--

LOCK TABLES `Produtos` WRITE;
/*!40000 ALTER TABLE `Produtos` DISABLE KEYS */;
INSERT INTO `Produtos` VALUES (1,'Bola',15,3),(2,'tenda',50,0),(3,'oculos natação',6,10),(4,'dumbbell',12,2),(5,'Produto A',100,0),(6,'Produto B',200,29),(7,'Produto C',150,20);
/*!40000 ALTER TABLE `Produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Loja'
--

--
-- Dumping routines for database 'Loja'
--
/*!50003 DROP PROCEDURE IF EXISTS `AtualizarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AtualizarCliente`(
    IN `cliente_id` INT,
    IN `novo_nome` VARCHAR(45),
    IN `novo_email` VARCHAR(45),
    IN `novo_telefone` INT
)
BEGIN
    -- Update Clientes table
    UPDATE Clientes
    SET Nome = novo_nome,
        Email = novo_email,
        Telefone = novo_telefone
    WHERE ID = cliente_id;

    -- Optionally, you can return a message indicating success or any other information
    SELECT CONCAT('Cliente ', cliente_id, ' atualizado com sucesso.') AS Resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarItensPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RegistrarItensPedido`(
    IN `pedido_id` INT,
    IN `produto_id` INT,
    IN `quantidade` INT,
    IN `preco` INT
)
BEGIN
    -- Insert into ItensPedido table
    INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade, Preco)
    VALUES (pedido_id, produto_id, quantidade, preco);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RegistrarPedido`(
    IN `cliente_id` INT,
    IN `funcionario_id` INT,
    IN `data_pedido` DATE,
    IN `total_pedido` INT
)
BEGIN
    DECLARE pedido_id INT;

    -- Insert into Pedidos table
    INSERT INTO Pedidos (ClienteID, FuncionarioID, DataPedido, TotalPedido)
    VALUES (cliente_id, funcionario_id, data_pedido, total_pedido);

    -- Get the last inserted ID
    SET pedido_id = LAST_INSERT_ID();

    -- Return the pedido_id or any other information if needed
    SELECT pedido_id AS PedidoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RelatorioProdutosVendidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RelatorioProdutosVendidos`(
    IN `data_inicio` DATE,
    IN `data_fim` DATE
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE produto_id INT;
    DECLARE produto_nome VARCHAR(45);
    DECLARE quantidade_vendida INT;

    DECLARE cursor_produtos CURSOR FOR
    SELECT p.ID, p.Nome, SUM(ip.Quantidade) AS QuantidadeVendida
    FROM Produtos p
    JOIN ItensPedido ip ON p.ID = ip.ProdutoID
    JOIN Pedidos pdi ON ip.PedidoID = pdi.ID
    WHERE pdi.DataPedido BETWEEN data_inicio AND data_fim
    GROUP BY p.ID, p.Nome;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    CREATE TEMPORARY TABLE IF NOT EXISTS RelatorioTemp (
        ProdutoID INT,
        ProdutoNome VARCHAR(45),
        QuantidadeVendida INT
    );

    OPEN cursor_produtos;

    read_loop: LOOP
        FETCH cursor_produtos INTO produto_id, produto_nome, quantidade_vendida;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO RelatorioTemp (ProdutoID, ProdutoNome, QuantidadeVendida)
        VALUES (produto_id, produto_nome, quantidade_vendida);
    END LOOP;

    CLOSE cursor_produtos;

    SELECT * FROM RelatorioTemp;

    DROP TEMPORARY TABLE IF EXISTS RelatorioTemp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalPedidosPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `TotalPedidosPeriodo`(
    IN `data_inicio` DATE,
    IN `data_fim` DATE,
    OUT `total_pedidos` INT
)
BEGIN
    -- Declare a variable to hold the total count
    DECLARE total INT;

    -- Calculate the total number of orders within the specified period
    SELECT COUNT(*) INTO total
    FROM Pedidos
    WHERE DataPedido BETWEEN data_inicio AND data_fim;

    -- Set the output parameter
    SET total_pedidos = total;
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

-- Dump completed on 2024-07-17  9:03:21
