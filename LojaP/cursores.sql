DELIMITER $$

CREATE PROCEDURE `RelatorioProdutosVendidos`(
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

-- CALL RelatorioProdutosVendidos('2024-06-015', '2024-07-16');



