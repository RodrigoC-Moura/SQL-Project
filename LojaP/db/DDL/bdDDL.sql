-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Loja
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Loja
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Loja` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Loja` ;

-- -----------------------------------------------------
-- Table `Loja`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`Categorias` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`Clientes` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefone` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`Fabricantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`Fabricantes` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`Posicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`Posicao` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`Funcionarios` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `PosicaoID` INT NOT NULL,
  `Salario` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Funcionarios_Posicao1_idx` (`PosicaoID` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionarios_Posicao1`
    FOREIGN KEY (`PosicaoID`)
    REFERENCES `Loja`.`Posicao` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`Pedidos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ClienteID` INT NOT NULL,
  `FuncionarioID` INT NOT NULL,
  `DataPedido` DATE NOT NULL,
  `TotalPedido` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Pedidos_Clientes_idx` (`ClienteID` ASC) VISIBLE,
  INDEX `fk_Pedidos_Funcionarios1_idx` (`FuncionarioID` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Clientes`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `Loja`.`Clientes` (`ID`),
  CONSTRAINT `fk_Pedidos_Funcionarios1`
    FOREIGN KEY (`FuncionarioID`)
    REFERENCES `Loja`.`Funcionarios` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`Produtos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Preco` INT NOT NULL,
  `QuantidadeEmStock` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`ItensPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`ItensPedido` (
  `PedidoID` INT NOT NULL,
  `ProdutoID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Preco` INT NOT NULL,
  PRIMARY KEY (`PedidoID`, `ProdutoID`),
  INDEX `fk_ItensPedido_Produtos1_idx` (`ProdutoID` ASC) VISIBLE,
  CONSTRAINT `fk_ItensPedido_Pedidos1`
    FOREIGN KEY (`PedidoID`)
    REFERENCES `Loja`.`Pedidos` (`ID`),
  CONSTRAINT `fk_ItensPedido_Produtos1`
    FOREIGN KEY (`ProdutoID`)
    REFERENCES `Loja`.`Produtos` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`ProdutoCategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`ProdutoCategoria` (
  `Produtos_ID` INT NOT NULL,
  `Categorias_ID` INT NOT NULL,
  PRIMARY KEY (`Produtos_ID`, `Categorias_ID`),
  INDEX `fk_ProdutoCategoria_Categorias1_idx` (`Categorias_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ProdutoCategoria_Categorias1`
    FOREIGN KEY (`Categorias_ID`)
    REFERENCES `Loja`.`Categorias` (`ID`),
  CONSTRAINT `fk_ProdutoCategoria_Produtos1`
    FOREIGN KEY (`Produtos_ID`)
    REFERENCES `Loja`.`Produtos` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Loja`.`ProdutoMarca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loja`.`ProdutoMarca` (
  `Produtos_ID` INT NOT NULL,
  `Fabricantes_ID` INT NOT NULL,
  PRIMARY KEY (`Produtos_ID`, `Fabricantes_ID`),
  INDEX `fk_ProdutoMarca_Fabricantes1_idx` (`Fabricantes_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ProdutoMarca_Fabricantes1`
    FOREIGN KEY (`Fabricantes_ID`)
    REFERENCES `Loja`.`Fabricantes` (`ID`),
  CONSTRAINT `fk_ProdutoMarca_Produtos1`
    FOREIGN KEY (`Produtos_ID`)
    REFERENCES `Loja`.`Produtos` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `Loja` ;

-- -----------------------------------------------------
-- procedure AtualizarCliente
-- -----------------------------------------------------

DELIMITER $$
USE `Loja`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RegistrarItensPedido
-- -----------------------------------------------------

DELIMITER $$
USE `Loja`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RegistrarPedido
-- -----------------------------------------------------

DELIMITER $$
USE `Loja`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RelatorioProdutosVendidos
-- -----------------------------------------------------

DELIMITER $$
USE `Loja`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure TotalPedidosPeriodo
-- -----------------------------------------------------

DELIMITER $$
USE `Loja`$$
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
END$$

DELIMITER ;
USE `Loja`;

DELIMITER $$
USE `Loja`$$
CREATE
DEFINER=`root`@`%`
TRIGGER `Loja`.`AtualizarStock`
AFTER INSERT ON `Loja`.`ItensPedido`
FOR EACH ROW
BEGIN
    UPDATE Produtos
    SET QuantidadeEmStock = QuantidadeEmStock - NEW.Quantidade
    WHERE ID = NEW.ProdutoID;
END$$

USE `Loja`$$
CREATE
DEFINER=`root`@`%`
TRIGGER `Loja`.`VerificarStoque`
BEFORE INSERT ON `Loja`.`ItensPedido`
FOR EACH ROW
BEGIN
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
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
