-- Retorna os clientes que possuem empréstimos
CREATE OR REPLACE VIEW cliente_emprestimo AS 
	SELECT 
		c.nome "Nome",
		r.data_emprestimo "Data do Empréstimo",
		e.valor "Valor Total"
	FROM cliente c
	INNER JOIN realiza r
		ON r.id_cliente = c.id_cliente	
	INNER JOIN emprestimo e    
		ON r.id_emprestimo = e.id_emprestimo;


-- Retorna os pagamentos que estão atrasados
CREATE OR REPLACE VIEW pag_atrasados AS 
	SELECT 
		c.nome "Nome", 
		e.data_quitacao "Data de Vencimento", 
		SYSDATE "Data Atual", 
		e.valor_restante "Valor Restante"
	FROM cliente c
	INNER JOIN realiza r 
		ON r.id_cliente = c.id_cliente	
	INNER JOIN emprestimo e    
		ON r.id_emprestimo = e.id_emprestimo
	INNER JOIN pagamento p
		ON p.id_emprestimo = e.id_emprestimo		
	WHERE SYSDATE > e.data_quitacao;


-- Retorna quantos funcionários tem em cada agência
CREATE OR REPLACE VIEW func_agencia AS
	SELECT
		a.nome "Nome da Agência", 
		COUNT(f.id_funcionario) "Quantidade de Funcionários"
	FROM agencia a
	INNER JOIN funcionario f
		ON a.numero_agencia = f.numero_agencia
	GROUP BY a.nome;


-- Retorna todo cliente que possui saldo negativo em sua conta corrente
CREATE OR REPLACE VIEW saldo_negativo AS
	SELECT
		cl.nome "Nome do Cliente",
		cc.numero_conta "Número da Conta",
		cc.saldo "Saldo"
	FROM cliente cl
	INNER JOIN conta cc
		ON cl.numero_conta = cc.numero_conta
	WHERE cc.saldo < 0;