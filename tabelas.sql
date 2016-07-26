CREATE TABLE Banco (
nome varchar(60),
data_fundacao date,
id_banco int PRIMARY KEY not null,
endereco varchar(100)
);

CREATE TABLE ContaCorrente (
cheque_especial number,
numero_conta int not null
);

CREATE TABLE ContaPoupanca (
taxa_juros number,
numero_conta int not null
);

CREATE TABLE PessoaJuridica (
cnpj varchar(18),
nome_fantasia varchar(80),
id_cliente int not null
);

CREATE TABLE PessoaFisica (
cpf varchar(14),
sexo char(1),
rg number,
estado_civil varchar(8),
id_cliente int not null
);

CREATE TABLE Funcionario (
id_funcionario int PRIMARY KEY not null,
cpf varchar(14),
nome varchar(60),
data_inicio date,
telefone varchar(15),
numero_agencia number
);

CREATE TABLE Emprestimo (
id_emprestimo int PRIMARY KEY,
valor number,
valor_restante number,
taxa_juros number,
data_quitacao date
);

CREATE TABLE Conta (
numero_conta int PRIMARY KEY,
saldo number,
numero_agencia int not null
);

CREATE TABLE Cliente (
id_cliente int PRIMARY KEY not null,
numero_conta int not null,
telefone varchar(15),
nome varchar(60),
data_nascimento date
);

CREATE TABLE Pagamento (
data_pagamento number,
valor number,
id_pagamento int PRIMARY KEY not null,
id_emprestimo int not null
);

CREATE TABLE Agencia (
telefone varchar(15),
cpf_gerente varchar(14),
nome varchar(60),
endereco varchar(100),
numero_agencia int PRIMARY KEY not null,
id_banco int not null
);


CREATE TABLE realiza (
data_emprestimo date,
id_cliente int not null,
id_emprestimo int not null
);

ALTER TABLE ContaCorrente ADD FOREIGN KEY(numero_conta) REFERENCES Conta (numero_conta);
ALTER TABLE ContaPoupanca ADD FOREIGN KEY(numero_conta) REFERENCES Conta (numero_conta);
ALTER TABLE PessoaJuridica ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente);
ALTER TABLE PessoaFisica ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente);
ALTER TABLE Funcionario ADD FOREIGN KEY(numero_agencia) REFERENCES Agencia (numero_agencia);
ALTER TABLE Conta ADD FOREIGN KEY(numero_agencia) REFERENCES Agencia (numero_agencia);
ALTER TABLE Agencia ADD FOREIGN KEY(id_banco) REFERENCES Banco (id_banco);
ALTER TABLE Pagamento ADD FOREIGN KEY(id_emprestimo) REFERENCES Emprestimo (id_emprestimo);
ALTER TABLE Cliente ADD FOREIGN KEY(numero_conta) REFERENCES Conta (numero_conta);
ALTER TABLE realiza ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente);
ALTER TABLE realiza ADD FOREIGN KEY(id_emprestimo) REFERENCES Emprestimo (id_emprestimo);