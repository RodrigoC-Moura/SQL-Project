# Loja Database Project

## Table of Contents

- [Project Overview](#project-overview)
- [Installation](#installation)
- [Database Schema](#database-schema)
  - [Creating the Schema](#creating-the-schema)
  - [Creating Tables](#creating-tables)
- [Triggers](#triggers)
- [Stored Procedures](#stored-procedures)
- [Usage Examples](#usage-examples)

## Project Overview

This project involves creating and managing a database schema for a store (`Loja`). The schema includes tables for categories, customers, manufacturers, positions, employees, orders, products, order items, and product categories and brands. Additionally, the project includes stored procedures to register orders, register order items, calculate total orders within a period, and generate a report listing all products sold and their quantities within a specified period using cursors.

## Table of Contents

- [Project Overview](#project-overview)
- [Installation](#installation)
- [Database Schema](#database-schema)
  - [Creating the Schema](#creating-the-schema)
  - [Creating Tables](#creating-tables)
- [Triggers](#triggers)
- [Stored Procedures](#stored-procedures)
- [Usage Examples](#usage-examples)

## Installation

1. Clone the repository to your local machine:
    ```sh
    git clone https://github.com/yourusername/loja-database-project.git
    cd loja-database-project
    ```

2. Open your MySQL Workbench or preferred MySQL client.

3. Run the provided SQL scripts to set up the database schema and objects.

## Database Schema

### Creating the Schema

```sql
CREATE SCHEMA IF NOT EXISTS `Loja` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `Loja`;
