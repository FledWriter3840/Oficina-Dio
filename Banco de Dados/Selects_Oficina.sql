use OficinaMecanica;

-- Quais são todos os clientes cadastrados na oficina?
SELECT * FROM Cliente;

-- Quais são os nomes e telefones dos funcionários da oficina?
SELECT nome, telefone FROM Funcionario;

--  Quais clientes moram em São Paulo?
SELECT nome, endereco 
FROM Cliente
WHERE endereco LIKE '%São Paulo%';

-- Quais veículos do modelo Civic estão cadastrados na oficina?
SELECT placa, modelo, marca
FROM Veiculo
WHERE modelo = 'Civic';

-- Quais ordens de serviço ainda não foram concluídas?
SELECT idOS, idVeiculo, status, dataEmissao
FROM Ordem_Servico
WHERE status != 'Concluída';

-- Qual é a idade de cada veículo atualmente?
SELECT v.placa, v.modelo, YEAR(CURDATE()) - v.ano AS idadeVeiculo
FROM Veiculo v;

-- Qual é o valor total de cada ordem de serviço considerando serviços e peças?
SELECT os.idOS,
       IFNULL(SUM(oserv.valor), 0) + IFNULL(SUM(op.valor),0) AS valorTotalCalculado
FROM Ordem_Servico os
LEFT JOIN OS_Servico oserv ON os.idOS = oserv.idOS
LEFT JOIN OS_Peca op ON os.idOS = op.idOS
GROUP BY os.idOS;

-- Quais são os clientes da oficina em ordem alfabética?
SELECT nome, telefone
FROM Cliente
ORDER BY nome ASC;

-- Quais são as ordens de serviço mais recentes primeiro?
SELECT idOS, idVeiculo, dataEmissao, status
FROM Ordem_Servico
ORDER BY dataEmissao DESC;

-- Quais ordens de serviço possuem mais de 2 serviços cadastrados?
SELECT idOS, COUNT(idServico) AS totalServicos
FROM OS_Servico
GROUP BY idOS
HAVING totalServicos > 2;

-- Quais ordens de serviço possuem mais de R$500,00 em peças utilizadas?
SELECT idOS, SUM(valor) AS totalPecas
FROM OS_Peca
GROUP BY idOS
HAVING totalPecas > 500;

-- Quais clientes possuem quais veículos na oficina?
SELECT c.nome AS Cliente, v.modelo, v.placa
FROM Cliente c
INNER JOIN Veiculo v ON c.idCliente = v.idCliente;

-- Quais ordens de serviço estão atribuídas a quais funcionários e veículos?
SELECT os.idOS, v.placa, v.modelo, f.nome AS Funcionario, os.status
FROM Ordem_Servico os
INNER JOIN Veiculo v ON os.idVeiculo = v.idVeiculo
INNER JOIN Funcionario f ON os.idFuncionario = f.idFuncionario;

-- Qual é o valor total de cada ordem de serviço (peças + serviços) e quais clientes estão associados a essas ordens?
SELECT os.idOS, c.nome AS Cliente,
       IFNULL(SUM(oserv.valor),0) + IFNULL(SUM(op.valor),0) AS valorTotal
FROM Ordem_Servico os
INNER JOIN Veiculo v ON os.idVeiculo = v.idVeiculo
INNER JOIN Cliente c ON v.idCliente = c.idCliente
LEFT JOIN OS_Servico oserv ON os.idOS = oserv.idOS
LEFT JOIN OS_Peca op ON os.idOS = op.idOS
GROUP BY os.idOS, c.nome
ORDER BY valorTotal DESC;

-- Quais peças foram utilizadas em cada ordem de serviço e em que quantidade?
SELECT os.idOS, p.descricao AS Peca, op.quantidade, op.valor
FROM OS_Peca op
INNER JOIN Ordem_Servico os ON op.idOS = os.idOS
INNER JOIN Peca p ON op.idPeca = p.idPeca
ORDER BY os.idOS;








