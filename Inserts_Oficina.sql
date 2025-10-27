use OficinaMecanica;

INSERT INTO Cliente (nome, telefone, email, endereco) VALUES
('Carlos Silva', '11988887777', 'carlos@gmail.com', 'Rua A, 123, São Paulo'),
('Ana Pereira', '11977776666', 'ana@hotmail.com', 'Av. B, 456, São Paulo'),
('João Souza', '11966665555', 'joao@gmail.com', 'Rua C, 789, São Paulo'),
('Mariana Lima', '11955554444', 'mariana@yahoo.com', 'Av. D, 321, São Paulo'),
('Pedro Gomes', '11944443333', 'pedro@gmail.com', 'Rua E, 654, São Paulo'),
('Lucas Ferreira', '11999998888', 'lucas@gmail.com', 'Rua F, 987, São Paulo'),
('Sofia Martins', '11988887777', 'sofia@hotmail.com', 'Av. G, 654, São Paulo'),
('Bruno Oliveira', '11977776666', 'bruno@gmail.com', 'Rua H, 321, São Paulo'),
('Carla Souza', '11966665555', 'carla@yahoo.com', 'Av. I, 159, São Paulo'),
('Gustavo Lima', '11955554444', 'gustavo@gmail.com', 'Rua J, 753, São Paulo');

INSERT INTO Veiculo (idCliente, placa, modelo, marca, ano) VALUES
(1, 'ABC1234', 'Civic', 'Honda', 2018),
(2, 'DEF5678', 'Corolla', 'Toyota', 2020),
(3, 'GHI9012', 'Onix', 'Chevrolet', 2019),
(4, 'JKL3456', 'Fiesta', 'Ford', 2017),
(5, 'MNO7890', 'Renegade', 'Jeep', 2021),
(6, 'PQR1234', 'Civic', 'Honda', 2017),
(7, 'STU5678', 'Fiesta', 'Ford', 2018),
(8, 'VWX9012', 'Gol', 'Volkswagen', 2019),
(9, 'YZA3456', 'Corolla', 'Toyota', 2020),
(10, 'BCD7890', 'Renegade', 'Jeep', 2021);

INSERT INTO Funcionario (nome, cargo, telefone, email, salario) VALUES
('Lucas Santos', 'Mecânico', '11933332222', 'lucas@oficina.com', 2500.00),
('Fernanda Alves', 'Atendente', '11922221111', 'fernanda@oficina.com', 1800.00),
('Rafael Costa', 'Mecânico', '11911110000', 'rafael@oficina.com', 2600.00),
('Marcos Almeida', 'Mecânico', '11944445555', 'marcos@oficina.com', 2700.00),
('Patrícia Ribeiro', 'Atendente', '11933334444', 'patricia@oficina.com', 1800.00);

INSERT INTO Peca (descricao, preco, estoque) VALUES
('Óleo 5W30', 80.00, 50),
('Pastilha de freio dianteira', 120.00, 30),
('Filtro de ar', 45.00, 40),
('Bateria 60Ah', 350.00, 20),
('Amortecedor dianteiro', 400.00, 10),
('Pneu 205/55 R16', 500.00, 25),
('Correia dentada', 200.00, 15),
('Velas de ignição', 30.00, 60),
('Radiador', 450.00, 5),
('Filtro de combustível', 60.00, 35);

INSERT INTO Servico (descricao, valor) VALUES
('Troca de óleo', 150.00),
('Alinhamento e balanceamento', 120.00),
('Revisão completa', 500.00),
('Substituição de pastilhas de freio', 200.00),
('Troca de filtro de ar', 50.00),
('Troca de filtro de combustível', 80.00),
('Reparo de suspensão', 350.00),
('Troca de correia dentada', 450.00),
('Instalação de acessórios', 100.00),
('Diagnóstico eletrônico', 120.00);

INSERT INTO Ordem_Servico (idVeiculo, idFuncionario, dataEmissao, dataConclusao, status, valorTotal) VALUES
(1, 1, '2025-10-01', '2025-10-03', 'Concluída', 470.00),
(2, 2, '2025-10-05', NULL, 'Em andamento', 120.00),
(3, 3, '2025-10-07', '2025-10-08', 'Concluída', 545.00),
(4, 4, '2025-10-10', NULL, 'Aberta', 0.00),
(5, 5, '2025-10-12', '2025-10-13', 'Concluída', 750.00),
(6, 1, '2025-10-14', '2025-10-15', 'Concluída', 320.00),
(7, 2, '2025-10-16', NULL, 'Em andamento', 210.00),
(8, 3, '2025-10-18', '2025-10-19', 'Concluída', 480.00),
(9, 4, '2025-10-20', NULL, 'Aberta', 0.00),
(10, 5, '2025-10-22', '2025-10-23', 'Concluída', 650.00),
(1, 3, '2025-10-24', NULL, 'Aberta', 0.00),
(2, 1, '2025-10-25', NULL, 'Aberta', 0.00),
(3, 2, '2025-10-26', NULL, 'Aberta', 0.00),
(4, 3, '2025-10-27', NULL, 'Aberta', 0.00),
(5, 4, '2025-10-28', NULL, 'Aberta', 0.00);

INSERT INTO OS_Servico (idOS, idServico, quantidade, valor) VALUES
(1, 1, 1, 150.00),
(1, 2, 1, 120.00),
(1, 4, 1, 200.00),

(2, 2, 1, 120.00),

(3, 3, 1, 500.00),
(3, 5, 1, 45.00),

(4, 7, 1, 350.00),

(5, 8, 1, 450.00),
(5, 10, 1, 300.00),

(6, 1, 1, 150.00),
(6, 5, 1, 45.00),

(7, 2, 1, 120.00),
(7, 4, 1, 200.00),

(8, 3, 1, 500.00),
(8, 6, 1, 80.00),

(10, 8, 1, 450.00),
(10, 9, 1, 100.00);

INSERT INTO OS_Peca (idOS, idPeca, quantidade, valor) VALUES
(1, 1, 1, 80.00),
(1, 2, 1, 120.00),

(3, 3, 1, 45.00),
(3, 4, 1, 350.00),

(5, 7, 1, 200.00),
(5, 9, 1, 450.00),

(6, 1, 1, 80.00),
(6, 3, 1, 45.00),

(7, 2, 1, 120.00),
(7, 4, 1, 350.00),

(8, 5, 1, 400.00),
(8, 6, 1, 500.00),

(10, 7, 1, 200.00),
(10, 9, 1, 450.00);
