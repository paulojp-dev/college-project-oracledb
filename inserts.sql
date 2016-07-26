--Inserts da tabela Banco
insert into banco(data_fundacao, nome, endereco) values('24/08/1995', 'Banco Generico', 'Graciliano Ramos'); 
select * from banco;
--delete banco where id_banco = 2;

--Inserts da tabela Agencia
insert into agencia (cpf_gerente, endereco, nome, telefone,id_banco) values(39955665444, 'Graciliano Ramos','SA Banco',996633221,1); 
select * from agencia;

--Inserts da tabela Funcionario
insert into funcionario(nome, telefone, data_inicio, cpf, numero_agencia) values('Valter', 998898745,sysdate -365,996633221,1); 
insert into funcionario(nome, telefone, data_inicio, cpf, numero_agencia) values('Douglas', 898898785,sysdate -200,1966339984,1); 
insert into funcionario(nome, telefone, data_inicio, cpf, numero_agencia) values('Henrich', 966554112,sysdate -199,6655411554,1); 
insert into funcionario(nome, telefone, data_inicio, cpf, numero_agencia) values('Carol', 99885447,sysdate -600,669988554,1); 
select * from funcionario;

--Inserts da tabela Conta
insert into conta(saldo,numero_agencia) values(10000000000.0,1);
insert into conta(saldo,numero_agencia) values(1,1);
insert into conta(saldo,numero_agencia) values(1000.0,1);
--Inserts da tabela Conta Corrente que esta atrelada a tabela conta
insert into contacorrente(cheque_especial,numero_conta) values (0,1);
insert into contacorrente(cheque_especial,numero_conta) values (500.0,2);
--Inserts da tabela Conta Poupança que esta atrelada a tabela conta
insert into contapoupanca(taxa_juros,numero_conta) values(5,1);
insert into contapoupanca(taxa_juros,numero_conta) values(10,2);
select * from CONTAPOUPANCA;
select * from contacorrente;
select * from conta;


--Inserts da tabela Cliente
insert into cliente(data_nascimento, nome, telefone, numero_conta) values(sysdate - 3000, 'Samuel', 966554321,2);
insert into cliente(data_nascimento, nome, telefone, numero_conta) values(sysdate - 3000, 'Dilma', 6988878722,3);
insert into cliente(data_nascimento, nome, telefone, numero_conta) values(sysdate - 10000, 'Roberio', 6988754,1);
--Inserts da tabela Pessoa Fisica que esta atrelada a tabela Cliente
insert into PESSOAFISICA(cpf, estado_civil, rg, sexo, id_cliente) values(54987894,'solteiro', 989465464834,'f',3);
insert into PESSOAFISICA(cpf, estado_civil, rg, sexo, id_cliente) values(6669987,'casado', 9966554411,'m',2);
--Inserts da tabela Pessoa Juridica que esta atrelada a tabela Cliente
insert into PESSOAJURIDICA(cnpj, nome_fantasia,id_cliente) values(6666998,'Açougue SLA',1);
select * from cliente;
select * from pessoafisica;
select * from PESSOAJURIDICA;

--Inserts da tabela Emprestimo que esta atrelada a tabela Realiza e tabela Pagamento obs: esta faltando a trigger daqui
insert into EMPRESTIMO(valor, valor_restante, taxa_juros, data_quitacao) values(1000.0 ,1000.0 , 5, sysdate-30);
insert into EMPRESTIMO(valor, valor_restante, taxa_juros, data_quitacao) values(500.0 ,500.0, 5, sysdate+30);
insert into EMPRESTIMO(valor, valor_restante, taxa_juros, data_quitacao) values(400.0 ,400.0, 5, sysdate-30);
select * from emprestimo;

--Inserts da tabela Realiza que esta atrelada a tabela Cliente e tabela Emprestimo
insert into REALIZA(data_emprestimo, id_cliente, id_emprestimo) values(sysdate,1,1);
insert into REALIZA(data_emprestimo, id_cliente, id_emprestimo) values(sysdate,2,2);
insert into REALIZA(data_emprestimo, id_cliente, id_emprestimo) values(sysdate,3,3);
select * from realiza;

--Inserts da tabela Pagamento que esta atrelada a tabela Emprestimo
insert into pagamento(data_pagamento, valor, id_emprestimo) values(sysdate+60,1000.0,1);
insert into pagamento(data_pagamento, valor, id_emprestimo) values(sysdate+35,500.0,2);
insert into pagamento(data_pagamento, valor, id_emprestimo) values(sysdate-60,400.0,3);
select * from pagamento;
--Delete pagamento;
