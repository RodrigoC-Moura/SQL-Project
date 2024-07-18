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

Replace this with your SQL schema creation code.

### Tables

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
### VerificarStoque


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
