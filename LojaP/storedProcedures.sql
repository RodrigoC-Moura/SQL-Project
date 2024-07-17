-- sotored procedure para resistrar um novo pedido

DELIMITER $$

CREATE PROCEDURE `RegistrarPedido`(
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




DELIMITER $$

CREATE PROCEDURE `RegistrarItensPedido`(
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
-- CALL RegistrarItensPedido(1, 1, 10, 100);
-- CALL RegistrarPedido(1, 1, '2024-07-16', 500); exemplo




-- stored procedure para atualizar dados de um cliente


DELIMITER $$

CREATE PROCEDURE `AtualizarCliente`(
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
-- CALL AtualizarCliente(1, 'Novo Nome', 'novo@email.com', 987654321); exemplo



-- Calcular o total de pedidos realizados num determinado periodo


DELIMITER $$

CREATE PROCEDURE `TotalPedidosPeriodo`(
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



-- CALL TotalPedidosPeriodo('2024-06-15', '2024-06-17', @total_pedidos);
-- SELECT @total_pedidos;


