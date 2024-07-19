-- listar todos os produtos disponiveis com categorias e preços = Q1

select Produtos.Nome as NomeProduto,Produtos.Preco,Categorias.Nome as Categoria from Produtos,Categorias,ProdutoCategoria
where QuantidadeEmStock > 0
and Produtos.ID =ProdutoCategoria.Produtos_ID
and Categorias.ID=ProdutoCategoria.Categorias_ID;

-- listar pedidos realizados num determinado período = Q2

SELECT * FROM Pedidos
WHERE DataPedido BETWEEN '2024-06-12' AND '2024-06-14';

-- listar os clientes que realizaram mais de um determinado numero de pedidos = Q3

SELECT ClienteID, COUNT(*) AS NumeroDePedidos
FROM Pedidos
GROUP BY ClienteID
HAVING COUNT(*) > 2;

-- listar produtos de uma determinada categoria = Q4

SELECT *
FROM Produtos
JOIN ProdutoCategoria ON Produtos.ID = ProdutoCategoria.Produtos_ID
JOIN Categorias ON ProdutoCategoria.Categorias_ID = Categorias.ID
WHERE Categorias.Nome = 'Desporto';





