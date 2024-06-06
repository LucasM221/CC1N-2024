USE BDEX4_ESTOQUE;
#1. Exibir todas as informações da tabela `PRODUTOS`.
select *
from produtos;
#2. Mostrar os nomes e preços dos produtos que custam mais de 50,00.
select nome_pro, preco
from produtos
where preco > 50;
#3. Listar os nomes e cidades dos fornecedores.
select nome_for, cidade
from fornecedores;
#4. Exibir os detalhes dos pedidos de compra: ID do pedido, data, hora e nome do fornecedor.
select id_pedido, data_pedido, hora_pedido, nome_for as nome_fornecedor
from pedidos_compra as pc
join fornecedores as f on pc.fornecedor = f.id_fornecedor;
#5. Listar o nome dos produtos e a quantidade disponível em cada armazém.
select nome_pro, pa.quantidade, id_armazem
from produtos as p
join produtos_armazens as pa on p.id_produto = pa.produto
join armazens as a on pa.produto = a.id_armazem;
#6. Mostrar os nomes dos fornecedores que têm produtos no armazém de "São Paulo".
select nome_for, id_produto, pa.produto, pa.armazem, uf_armazem
from fornecedores as f
join produtos_fornecedores as pf on f.id_fornecedor = pf.produto
join produtos as p on pf.produto = p.id_produto
join produtos_armazens as pa on p.id_produto = pa.produto
join armazens as a on pa.produto = a.id_armazem
where a.uf_armazem like '%SP';
#7. Listar todos os armazéns, ordenados pelo nome do armazém de A a Z.
select id_armazem, nome_armazem
from armazens
order by nome_armazem ASC;
#8. Mostrar os nomes dos produtos que têm a palavra "Premium" na descrição.
select p.nome_pro, p.descricao
from produtos as p
where p.descricao like '%Premium%';
#9. Exibir os detalhes dos produtos: ID do produto, nome, descrição, preço e nome dos fornecedores.
select id_produto, nome_pro, descricao, p.preco, nome_for as nome_fornecedor
from produtos as p
join produtos_fornecedores as pf on p.id_produto = pf.produto
join fornecedores as f on pf.produto = f.id_fornecedor;
#10. Para cada pedido de compra, mostrar o ID do pedido e a quantidade total de produtos solicitados.
select id_pedido, quantidade
from pedidos_compra as pc;
#11. Contar quantos produtos cada fornecedor oferece.
select f.nome_for, count(pf.produto)
from fornecedores as f
join produtos_fornecedores as pf on f.id_fornecedor = pf.produto
group by f.nome_for;
#12. Listar os nomes dos produtos e a quantidade disponível no armazém "Rio de Janeiro".
select p.nome_pro, pa.quantidade
from produtos as p
join produtos_armazens as pa on p.id_produto = pa.produto
join armazens as a on pa.produto = a.id_armazem
where uf_armazem like 'RJ';
#13. Mostrar o nome dos fornecedores e a data e hora do último pedido de compra que eles receberam.
select nome_for, id_pedido, concat(max(pc.DATA_PEDIDO),("/"),max(pc.hora_pedido)) as ultima_data_hora
from fornecedores as f
join pedidos_compra as pc on f.id_fornecedor = pc.id_pedido
group by nome_for;
#14. Contar quantos pedidos de compra cada fornecedor recebeu.
select pc.id_pedido, f.nome_for, f.id_fornecedor, count(pc.fornecedor) as quantidade_pedidos
from fornecedores as f
join pedidos_compra as pc on f.id_fornecedor = pc.id_pedido
group by nome_for;
#15. Para cada armazém, exibir o nome do armazém e a quantidade total de produtos armazenados nele.
select a.nome_armazem, sum(pa.quantidade) as qtd_produtos_armazenados
from armazens as a
join produtos_armazens as pa on a.id_armazem = pa.armazem
group by a.nome_armazem;

use BDEX5_EVENTOS;
#1. Exibir todas as informações da tabela PARTICIPANTES.

#2. Mostrar os nomes e empresas dos participantes que nasceram depois do ano 1990.
#3. Listar os nomes dos eventos e as entidades organizadoras.
#4. Exibir os detalhes das atividades: ID da atividade, nome da atividade, data, hora, nome do evento.
#5. Listar o nome dos participantes e quantas atividades cada um participou.
#6. Mostrar os nomes dos eventos realizados em 2023.
#7. Listar todos os locais, ordenados pelo nome da cidade de A a Z.
#8. Mostrar os nomes e CPFs dos participantes que não têm empresa cadastrada.
#9. Exibir os nomes dos participantes que estão inscritos em eventos realizados no local com nome 'Centro de Convenções'.
#10. Para cada entidade organizadora, mostrar o nome da entidade e a média de eventos realizados.
#11. Contar quantos participantes têm uma empresa cadastrada.
#12. Listar os nomes dos participantes que participaram de mais de 5 atividades.
#13. Mostrar o nome dos participantes e a data da última atividade que eles participaram.
#14. Contar quantas atividades cada evento possui.
#15. Para cada participante que participou de um evento, mostrar o CPF, o nome e a porcentagem de eventos em relação ao total de eventos realizados.


