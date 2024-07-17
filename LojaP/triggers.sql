-- trigger para atualizar a quantidade em stock de um produto apos um pedido 

DROP TRIGGER IF EXISTS `AtualizarStock`;
DROP TRIGGER IF EXISTS `VerificarStoque`;

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


-- trigger para impedir a inserção  de um pedido se nao houver stock suficiente


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

    IF quantidadeEmStoque < NEW.`Quantidade` THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Estoque insuficiente do produto.';
    END IF;
END //

DELIMITER ;