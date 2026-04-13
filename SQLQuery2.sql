use Pizzaria_Apple_Rose_Grille;

/* a. Listagem dos 5 pedidos mais caros */
SELECT valor_total
FROM tb_pedido
ORDER BY valor_total DESC
LIMIT 5;



/* b. Quais os 5 (cinco) ingredientes mais utilizados em pizzas */

SELECT descricao_ingrediente
FROM cad_ingredientes
INNER JOIN tb_pizzas ON tb_pizzas.id_pizzas + cad_ingrediente.pizzas_id





 /* c. Quais os 5 (cinco) sabores de pizzas mais vendidos */

 SELECT sabor_id, SUM(quantidade) AS total_vendido
 FROM tb_pedido
 GROUP BY pizzas_sabores
 ORDER BY total_vendidos DESC
 LIMIT 5;

  /* d. Consulta dos 5 (cinco) melhores clientes */
  SELECT cliente_id, SUM(valor_total) AS Valor_total
  FROM tb_pedido
  LEFT JOIN tb_clientes ON id_pedido = cliente_id
  GROUP BY  cliente_id
  ORDER BY Valor_total DESC


  /* e. Consulta do funcionário do mês (aquele que mais vendeu) */

  SELECT funcionario_id, SUM(valor_total) AS Valor_Total
  FROM tb_pedido
  WHERE MONTH(data_compra) = MONTH(CURRENT_DATE) AND YEAR (data_compra) = YEAR (CURRENT_DATE)
  GROUP BY funcionario_id
  ORDER BY Valor_Total DESC

 /* f. Quais os 3 (três) produtos (não pizzas) menos vendidos */

 SELECT 
 FROM tb_pedido 
/*  g. Qual gênero fez mais compras */



