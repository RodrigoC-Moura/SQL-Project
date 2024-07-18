# Loja Database Project

## Table of Contents

- [Project Overview](#project-overview)
- [Database](#database)
  - [Creating the Schema](#creating-the-schema)
- [Tables](#tables)
    - [Categorias](#categorias)
    - [Clientes](#clientes)
    - [Fabricantes](#fabricantes)
    - [Posicao](#posicao)
    - [Funcionarios](#funcionarios)
    - [Pedidos](#pedidos)
    - [Produtos](#produtos)
    - [ItensPedido](#itenspedido)
    - [ProdutoCategoria](#produtocategoria)
    - [ProdutoMarca](#produtomarca)
- [Queries](#queries)
- [Stored Procedures](#stored-procedures)
  - [AtualizarCliente](#atualizarcliente)
  - [RegistrarItensPedido](#registraritenspedido)
  - [RegistrarPedido](#registrarpedido)
  - [RelatorioProdutosVendidos](#relatorioprodutosvendidos)
  - [TotalPedidosPeriodo](#totalpedidosperiodo)
- [Triggers](#triggers)
  - [AtualizarStock](#atualizarstock)
  - [VerificarStoque](#verificarstoque)
- [Cursors](#cursors)
- [Usage Examples](#usage-examples)

## Project Overview

This project involves creating and managing a database schema for a store (`Loja`). The schema includes tables for categories, customers, manufacturers, positions, employees, orders, products, order items, and product categories and brands. Additionally, the project includes stored procedures to register orders, register order items, calculate total orders within a period, and generate a report listing all products sold and their quantities within a specified period using cursors.

## Database

### Creating the Schema

#### Prerequisites
- MySQL Workbench installed on your machine.
- Database export file (LojaP/db/db.sql).

#### Step 1: Open MySQL Workbench
- Launch MySQL Workbench on your machine.

#### Step 2: Connect to the MySQL Server
- **Create a new connection** (if not already set up):
  - Click on the `+` icon next to "MySQL Connections".
  - Enter the connection details (hostname, port, username, password).
  - Click `Test Connection` to verify the connection.
  - Click `OK` to save the connection.
- Select the connection and double-click to connect.

#### Step 3: Create a New Database (Schema)
- In the left sidebar, right-click on the "Schemas" tab and select `Create Schema`.
- Enter the name for the new database.
- Click `Apply`, then `Apply` again in the confirmation dialog, and `Finish`.

#### Step 4: Import the SQL File
- From the menu, select `Server` > `Data Import`.
- In the "Data Import" screen:
  - Select `Import from Self-Contained File`.
  - Click `...` and navigate to your `export.sql` file.
  - Select the file and click `Open`.
- Under "Default Target Schema", select the newly created database.
- Ensure `Dump Structure and Data` is selected.
- Click `Start Import`.

#### Step 5: Verify the Import
- After the import completes, refresh the schemas:
  - Right-click on the "Schemas" tab and select `Refresh All`.
- Expand the newly created database to see the imported tables.
- Verify that the tables and data have been correctly imported.

## Tables

#### Categorias

- **Columns**:
  - `ID` (INT, NOT NULL, AUTO_INCREMENT): Primary key.
  - `Nome` (VARCHAR(45), NOT NULL): Name of the category.
- **Indexes**:
  - `PRIMARY KEY` (`ID`)

#### Clientes

- **Columns**:
  - `ID` (INT, NOT NULL, AUTO_INCREMENT): Primary key.
  - `Nome` (VARCHAR(45), NOT NULL): Name of the client.
  - `Email` (VARCHAR(45), NOT NULL): Email of the client.
  - `Telefone` (INT, NOT NULL): Phone number of the client.
- **Indexes**:
  - `PRIMARY KEY` (`ID`)

#### Fabricantes

- **Columns**:
  - `ID` (INT, NOT NULL, AUTO_INCREMENT): Primary key.
  - `Nome` (VARCHAR(45), NOT NULL): Name of the manufacturer.
- **Indexes**:
  - `PRIMARY KEY` (`ID`)

#### Posicao

- **Columns**:
  - `ID` (INT, NOT NULL, AUTO_INCREMENT): Primary key.
  - `Nome` (VARCHAR(45), NOT NULL): Name of the position.
- **Indexes**:
  - `PRIMARY KEY` (`ID`)

#### Funcionarios

- **Columns**:
  - `ID` (INT, NOT NULL, AUTO_INCREMENT): Primary key.
  - `Nome` (VARCHAR(45), NOT NULL): Name of the employee.
  - `PosicaoID` (INT, NOT NULL): Position ID of the employee.
  - `Salario` (INT, NOT NULL): Salary of the employee.
- **Indexes**:
  - `PRIMARY KEY` (`ID`)
  - `INDEX` (`PosicaoID`)
- **Foreign Keys**:
  - `FOREIGN KEY` (`PosicaoID`) REFERENCES `Posicao`(`ID`)

#### Pedidos

- **Columns**:
  - `ID` (INT, NOT NULL, AUTO_INCREMENT): Primary key.
  - `ClienteID` (INT, NOT NULL): Client ID related to the order.
  - `FuncionarioID` (INT, NOT NULL): Employee ID who handled the order.
  - `DataPedido` (DATE, NOT NULL): Date of the order.
  - `TotalPedido` (INT, NOT NULL): Total amount of the order.
- **Indexes**:
  - `PRIMARY KEY` (`ID`)
  - `INDEX` (`ClienteID`)
  - `INDEX` (`FuncionarioID`)
- **Foreign Keys**:
  - `FOREIGN KEY` (`ClienteID`) REFERENCES `Clientes`(`ID`)
  - `FOREIGN KEY` (`FuncionarioID`) REFERENCES `Funcionarios`(`ID`)

#### Produtos

- **Columns**:
  - `ID` (INT, NOT NULL, AUTO_INCREMENT): Primary key.
  - `Nome` (VARCHAR(45), NOT NULL): Name of the product.
  - `Preco` (INT, NOT NULL): Price of the product.
  - `QuantidadeEmStock` (INT, NOT NULL): Quantity in stock.
- **Indexes**:
  - `PRIMARY KEY` (`ID`)

#### ItensPedido

- **Columns**:
  - `PedidoID` (INT, NOT NULL): Order ID.
  - `ProdutoID` (INT, NOT NULL): Product ID.
  - `Quantidade` (INT, NOT NULL): Quantity of the product.
  - `Preco` (INT, NOT NULL): Price of the product.
- **Indexes**:
  - `PRIMARY KEY` (`PedidoID`, `ProdutoID`)
  - `INDEX` (`ProdutoID`)
- **Foreign Keys**:
  - `FOREIGN KEY` (`PedidoID`) REFERENCES `Pedidos`(`ID`)
  - `FOREIGN KEY` (`ProdutoID`) REFERENCES `Produtos`(`ID`)

#### ProdutoCategoria

- **Columns**:
  - `Produtos_ID` (INT, NOT NULL): Product ID.
  - `Categorias_ID` (INT, NOT NULL): Category ID.
- **Indexes**:
  - `PRIMARY KEY` (`Produtos_ID`, `Categorias_ID`)
  - `INDEX` (`Categorias_ID`)
- **Foreign Keys**:
  - `FOREIGN KEY` (`Categorias_ID`) REFERENCES `Categorias`(`ID`)
  - `FOREIGN KEY` (`Produtos_ID`) REFERENCES `Produtos`(`ID`)

#### ProdutoMarca

- **Columns**:
  - `Produtos_ID` (INT, NOT NULL): Product ID.
  - `Fabricantes_ID` (INT, NOT NULL): Manufacturer ID.
- **Indexes**:
  - `PRIMARY KEY` (`Produtos_ID`, `Fabricantes_ID`)
  - `INDEX` (`Fabricantes_ID`)
- **Foreign Keys**:
  - `FOREIGN KEY` (`Fabricantes_ID`) REFERENCES `Fabricantes`(`ID`)
  - `FOREIGN KEY` (`Produtos_ID`) REFERENCES `Produtos`(`ID`)

## Queries

Replace this with your SQL queries or examples.

## Triggers

### AtualizarStock

This trigger helps in maintaining the correct stock quantities by automatically updating the stock levels in the `Produtos` table whenever a new order item is inserted into the `ItensPedido` table.

```sql
DROP TRIGGER IF EXISTS `AtualizarStock`;

DELIMITER //

CREATE TRIGGER AtualizarStock
AFTER INSERT ON ItensPedido
FOR EACH ROW
BEGIN
    UPDATE Produtos
    SET QuantidadeEmStock = QuantidadeEmStock - NEW.Quantidade
    WHERE ID = NEW.ProdutoID;
END //

DELIMITER ;
```

#### 1. Drop Existing Trigger

The statement `DROP TRIGGER IF EXISTS 'AtualizarStock'` ensures that any existing trigger with the same name is removed before creating a new one. This prevents errors that would occur if a trigger with the same name already exists.

#### 2. Create Trigger

The `CREATE TRIGGER AtualizarStock` command defines a new trigger named `AtualizarStock`.

#### 3. Trigger Timing

The `AFTER INSERT` specification means that the trigger will fire after a new row is inserted into the `ItensPedido` table.

#### 4. Trigger Action

The trigger will perform the following actions for each row inserted:

##### 4.1 BEGIN...END Block

Defines the actions to be taken when the trigger is executed.

##### 4.2 UPDATE Produtos

The `UPDATE Produtos` statement updates the `QuantidadeEmStock` column in the `Produtos` table.

##### 4.3 SET QuantidadeEmStock

The statement `SET QuantidadeEmStock = QuantidadeEmStock - NEW.Quantidade` decreases the stock quantity by the amount of the new order.

##### 4.4 WHERE Clause

The `WHERE ID = NEW.ProdutoID` clause ensures that the update is applied to the correct product based on the `ProdutoID` from the new row in `ItensPedido`.



### VerificarStoque

This trigger (`VerificarStoque`) ensures that before inserting new rows into the `ItensPedido` table, the system checks if there is sufficient stock available in the `Produtos` table for the requested quantity. If there isn't enough stock, it raises an error to prevent the insertion of the order, thereby maintaining data integrity and business rules.

```sql
DROP TRIGGER IF EXISTS `VerificarStoque`;

DELIMITER //

CREATE TRIGGER VerificarStoque
BEFORE INSERT ON ItensPedido
FOR EACH ROW
BEGIN
    DECLARE quantidadeEmStoque INT;

    SELECT QuantidadeEmStock
    INTO quantidadeEmStoque
    FROM Produtos
    WHERE ID = NEW.ProdutoID;

    IF quantidadeEmStoque < NEW.Quantidade THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Estoque insuficiente do produto.';
    END IF;
END //

DELIMITER ;
```

#### 1. Drop Existing Trigger

The statement `DROP TRIGGER IF EXISTS 'VerificarStoque'` ensures that any existing trigger with the same name is removed before creating a new one. This prevents conflicts and ensures that the trigger definition is clean.

#### 2. Create Trigger

The `CREATE TRIGGER VerificarStoque` command defines a new trigger named `VerificarStoque`.

#### 3. Trigger Timing

The `BEFORE INSERT` specification means that the trigger will fire before a new row is inserted into the `ItensPedido` table. This allows us to check and enforce business rules before the data is inserted.

#### 4. Trigger Action

The trigger will perform the following actions for each row to be inserted:

##### 4.1 BEGIN...END Block

Defines the actions to be taken when the trigger is executed.

##### 4.2 DECLARE quantidadeEmStoque INT

The `DECLARE quantidadeEmStoque INT` statement declares a variable `quantidadeEmStoque` to store the current stock quantity.

##### 4.3 SELECT QuantidadeEmStock INTO quantidadeEmStoque

The `SELECT QuantidadeEmStock INTO quantidadeEmStoque` statement retrieves the current stock quantity (`QuantidadeEmStock`) from the `Produtos` table for the product identified by `NEW.ProdutoID`.

##### 4.4 IF Statement

The `IF quantidadeEmStoque < NEW.Quantidade THEN...END IF` statement checks if the current stock (`quantidadeEmStoque`) is less than the quantity (`NEW.Quantidade`) of the new order being inserted.

##### 4.5 SIGNAL Statement

The `SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente do produto.'` statement raises an error with a custom message if there is insufficient stock to fulfill the new order. This prevents the insertion of the new order and notifies the user about the issue.


## Stored Procedures

### AtualizarCliente
### RegistrarItensPedido
### RegistrarPedido
### RelatorioProdutosVendidos
### TotalPedidosPeriodo


## Cursors

Replace this with your SQL cursors if applicable.

## Usage Examples

Replace this with examples of how to use your database or queries.
