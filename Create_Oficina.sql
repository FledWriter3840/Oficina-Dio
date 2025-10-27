create database OficinaMecanica;

USE OficinaMecanica;

-- ======================================================
-- TABELA: Cliente
-- ======================================================

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150)
);

-- ======================================================
-- TABELA: Veiculo
-- ======================================================

CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    ano INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ======================================================
-- TABELA: Funcionario
-- ======================================================

CREATE TABLE Funcionario (
    idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100),
    salario DECIMAL(10,2)
);

-- ======================================================
-- TABELA: Servico
-- ======================================================

CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- ======================================================
-- TABELA: Peca
-- ======================================================

CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);

-- ======================================================
-- TABELA: Ordem de Serviço
-- ======================================================

CREATE TABLE Ordem_Servico (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    idVeiculo INT NOT NULL,
    idFuncionario INT,
    dataEmissao DATE NOT NULL,
    dataConclusao DATE,
    status ENUM('Aberta', 'Em andamento', 'Concluída', 'Cancelada') DEFAULT 'Aberta',
    valorTotal DECIMAL(10,2),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ======================================================
-- TABELA ASSOCIATIVA: OS_Servico
-- ======================================================

CREATE TABLE OS_Servico (
    idOS INT NOT NULL,
    idServico INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor DECIMAL(10,2),
    PRIMARY KEY (idOS, idServico),
    FOREIGN KEY (idOS) REFERENCES Ordem_Servico(idOS)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idServico) REFERENCES Servico(idServico)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ======================================================
-- TABELA ASSOCIATIVA: OS_Peca
-- ======================================================

CREATE TABLE OS_Peca (
    idOS INT NOT NULL,
    idPeca INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor DECIMAL(10,2),
    PRIMARY KEY (idOS, idPeca),
    FOREIGN KEY (idOS) REFERENCES Ordem_Servico(idOS)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
