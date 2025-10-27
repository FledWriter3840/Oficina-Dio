# Oficina Mecânica SQL

Projeto desenvolvido para praticar **modelagem de banco de dados** e **consultas SQL** em um sistema de oficina mecânica.  

O objetivo é simular o cadastro de clientes, veículos, funcionários, ordens de serviço, serviços realizados e peças utilizadas, permitindo consultas e análises complexas.

---

## 🗂 Estrutura do Projeto

- **create_tables.sql** → Script para criação das tabelas com chaves primárias e estrangeiras.
- **inserts.sql** → Script com dados de exemplo para popular o banco.
- **consultas.sql** → Consultas de exemplo utilizando SELECT, WHERE, ORDER BY, HAVING e JOIN.
- **README.md** → Este arquivo explicativo.

---

## 💾 Banco de Dados

O banco de dados utilizado é **MySQL** e contém as seguintes tabelas principais:

- **Cliente** → Cadastro de clientes da oficina.
- **Veiculo** → Veículos associados a clientes.
- **Funcionario** → Funcionários e seus cargos.
- **Servico** → Serviços oferecidos pela oficina.
- **Peca** → Peças disponíveis e estoque.
- **Ordem_Servico** → Ordens de serviço registradas.
- **OS_Servico** → Associação entre ordens e serviços realizados.
- **OS_Peca** → Associação entre ordens e peças utilizadas.

---

## 🔍 Consultas de Exemplo

O projeto inclui consultas que cobrem:

1. **Recuperação simples de dados**:
   ```sql
   SELECT * FROM Cliente;
````

> Retorna todos os clientes cadastrados.

2. **Filtros com WHERE**:

   ```sql
   SELECT placa, modelo FROM Veiculo WHERE modelo = 'Civic';
   ```

   > Retorna veículos do modelo Civic.

3. **Atributos derivados e cálculos**:

   ```sql
   SELECT v.placa, YEAR(CURDATE()) - v.ano AS idadeVeiculo FROM Veiculo v;
   ```

   > Calcula a idade de cada veículo.

4. **Ordenações com ORDER BY**:

   ```sql
   SELECT nome FROM Cliente ORDER BY nome ASC;
   ```

   > Lista clientes em ordem alfabética.

5. **Filtragem de grupos com HAVING**:

   ```sql
   SELECT idOS, COUNT(idServico) AS totalServicos
   FROM OS_Servico
   GROUP BY idOS
   HAVING totalServicos > 2;
   ```

   > Mostra ordens de serviço com mais de 2 serviços.

6. **Junções entre tabelas (JOINs)**:

   ```sql
   SELECT c.nome AS Cliente, v.modelo, v.placa
   FROM Cliente c
   INNER JOIN Veiculo v ON c.idCliente = v.idCliente;
   ```

   > Lista clientes com seus respectivos veículos.

---

## 🎯 Objetivo do Projeto

* Praticar **modelagem relacional** e **integridade referencial**.
* Criar **consultas SQL complexas** com filtros, agregações e junções.
* Preparar material para **portfólio de estudos ou entrevistas**.

---

## 🛠 Tecnologias Utilizadas

* **MySQL** → Banco de dados relacional.
* **VS Code** → Edição de scripts SQL e integração com Git/GitHub.
* **Git & GitHub** → Versionamento e publicação do projeto.

