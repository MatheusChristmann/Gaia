
/*   CRIAÇÃO DA BASE DE DADOS DO SISTEMA GAIA   */
create database gaiadb;
comment on database "gaiadb" is 'Banco de Dados do sistema Gaia';

-----------------------------------------------------------------------------------------------------------------------------

/*   CRIAÇÃO DAS TABELAS DA BASE DE DADOS DO SISTEMA GAIA   */

create table estado(
	est_cod serial constraint estado_pk primary key,
	est_nome varchar(25) not null
);

comment on table estado is 'Cadastro de unidades federativas (Estados).';
comment on column estado.est_cod is 'Código do estado.';
comment on column estado.est_nome is 'Nome do estado.';

-----------------------------------------------------------------------------------------------------------------------------

create table municipio(
	mun_cod serial constraint municipio_pk primary key,
	mun_nome varchar(40) not null,
	mun_estado integer constraint mun_estado_fk references estado(est_cod) not null
);
 
comment on table municipio is 'Cadastro de municípios.';
comment on column municipio.mun_cod is 'Código do município.';
comment on column municipio.mun_nome is 'Nome do município.';
comment on column municipio.mun_estado is 'Código do estado do município.';

-----------------------------------------------------------------------------------------------------------------------------

create table tipo_endereco(
	ten_cod serial constraint tipo_endereco_pk primary key,
	ten_descricao varchar(25) not null
);
 
comment on table tipo_endereco is 'Cadastro de tipos de endereço.';
comment on column tipo_endereco.ten_cod is 'Código do tipo de endereço.';
comment on column tipo_endereco.ten_descricao is 'Descrição do tipo de endereço.';

-----------------------------------------------------------------------------------------------------------------------------

create table principio_ativo(
	pra_cod serial constraint principio_ativo_pk primary key,
	pra_descricao varchar(40) not null
);

comment on table principio_ativo is 'Cadastro de princípio ativo.';
comment on column principio_ativo.pra_cod is 'Código do princípio ativo.';
comment on column principio_ativo.pra_descricao is 'Descrição/nome do princípio ativo.';

-----------------------------------------------------------------------------------------------------------------------------

create table tipo_medicamento(
	tim_cod serial constraint tipo_medicamento_pk primary key,
	tim_descricao varchar(20) not null
);
 
comment on table tipo_medicamento is 'Cadastro de tipos de medicamentos.';
comment on column tipo_medicamento.tim_cod is 'Código do tipo de medicamento.';
comment on column tipo_medicamento.tim_descricao is 'Descrição do tipo de medicamento.';

-----------------------------------------------------------------------------------------------------------------------------

create table tipo_tarja(
	tit_cod serial constraint tipo_tarja_pk primary key,
	tit_descricao varchar(20) not null
);
 
comment on table tipo_tarja is 'Cadastro de tipos de tarja.';
comment on column tipo_tarja.tit_cod is 'Código do tipo de tarja.';
comment on column tipo_tarja.tit_descricao is 'Descrição do tipo de tarja.';

-----------------------------------------------------------------------------------------------------------------------------

create table produto(
	pro_cod serial constraint produto_pk primary key,
	pro_nome varchar(40) not null,
	pro_descricao varchar(70),
	pro_preco numeric(10,2) not null,
	pro_quantidade integer not null,
	pro_status char(1) constraint pro_status_ck check (pro_status in ('A', 'I')) not null,	
	pro_principioativo integer constraint pro_principio_ativo_fk references principio_ativo(pra_cod) not null,
	pro_tipmedicamento integer constraint pro_tipo_medicamento_fk references tipo_medicamento(tim_cod) not null,
	pro_tiptarja integer constraint pro_tipo_tarja_fk references tipo_tarja(tit_cod) not null
);
 
comment on table produto is 'Cadastro de produtos/medicamentos.';
comment on column produto.pro_cod is 'Código do produto.';
comment on column produto.pro_nome is 'Nome do produto.';
comment on column produto.pro_descricao is 'Descrição do produto.';
comment on column produto.pro_preco is 'Preço de venda do produto.';
comment on column produto.pro_quantidade is 'Quantidade em estoque do produto.';
comment on column produto.pro_status is 'Campo que indica se o cadastro do produto está inativo ou ativo (I = inativo, A = ativo).';
comment on column produto.pro_principioativo is 'Princípio ativo do produto.';
comment on column produto.pro_tipmedicamento is 'Tipo de medicamento do produto.';
comment on column produto.pro_tiptarja is 'Tipo de tarja do produto.';

-----------------------------------------------------------------------------------------------------------------------------

create table pessoa(
	pes_cod serial constraint pessoa_pk primary key,
	pes_nome varchar(60) not null,
	pes_tipo char(1) constraint pes_tipo_ck check (pes_tipo in ('J', 'F')) not null,
	pes_status char(1) constraint pes_status_ck check (pes_status in ('A', 'I')) not null,
	pes_datacadastro date not null
);
 
comment on table pessoa is 'Cadastro de pessoas.';
comment on column pessoa.pes_cod is 'Código da pessoa.';
comment on column pessoa.pes_nome is 'Nome/razão social da pessoa.';
comment on column pessoa.pes_tipo is 'Tipo de pessoa (J = jurídica, F = física).';
comment on column pessoa.pes_status is 'Campo que indica se o cadastro da pessoa está inativo ou ativo (I = inativo, A = ativo).';
comment on column pessoa.pes_datacadastro is 'Data de cadastro da pessoa no sistema.';

-----------------------------------------------------------------------------------------------------------------------------

create table endereco(
	end_cod serial constraint endereco_pk primary key,
	end_tipendereco integer constraint end_tipo_endereco_fk references tipo_endereco(ten_cod) not null,
	end_pessoa integer constraint end_pessoa_fk references pessoa(pes_cod) not null,
	end_municipio integer constraint end_municipio_fk references municipio(mun_cod) not null,
	end_bairro varchar(40),
	end_rua varchar(40),
	end_numresid integer,
	end_numtelefone char(8),
	end_numcelular varchar(13),
	end_email varchar(40)	
);

alter table endereco add constraint end_pessoatipendereco_uk unique (end_pessoa, end_tipendereco);
 
comment on table endereco is 'Cadastro de endereços.';
comment on column endereco.end_cod is 'Código do endereço.';
comment on column endereco.end_tipendereco is 'Código do tipo de endereço.';
comment on column endereco.end_pessoa is 'Código da pessoa detentora do endereço.';
comment on column endereco.end_municipio is 'Município do endereço.';
comment on column endereco.end_bairro is 'Nome do bairro do endereço.';
comment on column endereco.end_rua is 'Nome da rua do endereço.';
comment on column endereco.end_numresid is 'Número da residência do endereço.';
comment on column endereco.end_numtelefone is 'Número de telefone fixo do endereço (Armazenado sem máscara).';
comment on column endereco.end_numcelular is 'Número de celular do endereço (Armazenado sem máscara e espaço suficiente para o DDI e o DDD).';
comment on column endereco.end_email is 'Endereço de email.';

-----------------------------------------------------------------------------------------------------------------------------

create table pesfisica(
	fis_pessoa integer constraint pesfisica_pk primary key,
	fis_cpf char(11) constraint fis_cpf_uk unique not null,
	fis_datanascimento date not null,
	fis_genero char(1) constraint fis_genero_ck check (fis_genero in ('M', 'F', 'O')),
	fis_funcionario char(1) constraint fis_funcionario_ck check (fis_funcionario in ('S', 'N')) not null
);
 
alter table pesfisica add constraint fis_pessoa_fk foreign key (fis_pessoa) references pessoa(pes_cod);

comment on table pesfisica is 'Cadastro de informações de pessoas físicas.';
comment on column pesfisica.fis_pessoa is 'Código da pessoa física.';
comment on column pesfisica.fis_cpf is 'CPF da pessoa física.';
comment on column pesfisica.fis_datanascimento is 'Data de nascimento da pessoa física.';
comment on column pesfisica.fis_genero is 'Gênero da pessoa física (M = Masculino, F = Femininio, O = Outro).';
comment on column pesfisica.fis_funcionario is 'Campo que indica se a pessoa é funcionário ou não (S = Sim, N = Não).';

-----------------------------------------------------------------------------------------------------------------------------

create table pesjuridica(
	jur_pessoa integer constraint pesjuridica_pk primary key,
	jur_cnpj char(14) constraint jur_cnpj_uk unique not null,
	jur_datafundacao date
);
 
alter table pesjuridica add constraint jur_pessoa_fk foreign key (jur_pessoa) references pessoa(pes_cod);
 
comment on table pesjuridica is 'Cadastro de informações de pessoas jurídicas.';
comment on column pesjuridica.jur_pessoa is 'Código da pessoa jurídica.';
comment on column pesjuridica.jur_cnpj is 'CNPJ  da pessoa jurídica.';
comment on column pesjuridica.jur_datafundacao is 'Data de fundação da empresa.';

-----------------------------------------------------------------------------------------------------------------------------

create table cargo(
	car_cod serial constraint cargo_pk primary key,
	car_descricao varchar(50) not null,
	car_salario numeric(10,2) not null
);
 
comment on table cargo is 'Cadastro de cargos para os funcionários.';
comment on column cargo.car_cod is 'Código do cargo.';
comment on column cargo.car_descricao is 'Descrição (nome) do cargo.';
comment on column cargo.car_salario is 'Salário do cargo.';

-----------------------------------------------------------------------------------------------------------------------------

create table funcionario(
	fun_pessoa integer constraint funcionario_pk primary key,
	fun_admissao date not null,
	fun_demissao date,
	fun_cargo integer constraint fun_cargo_fk references cargo(car_cod) not null
);
 
comment on table funcionario is 'Cadastro de funcionários.';
comment on column funcionario.fun_pessoa is 'Código do funcionário.';
comment on column funcionario.fun_admissao is 'Data de admissão do funcionário.';
comment on column funcionario.fun_demissao is 'Data de demissão do funcionário.';
comment on column funcionario.fun_cargo is 'Código do cargo vinculado ao funcionário.';

-----------------------------------------------------------------------------------------------------------------------------

create table notificacao_compra(
	noc_cod serial constraint notificacao_compra_pk primary key,
	noc_funcionario integer constraint noc_funcionario_fk references funcionario(fun_pessoa) not null,
	noc_produto integer constraint noc_produto_fk references produto(pro_cod) not null,
	noc_qtd_produto integer not null,
	noc_data timestamp not null,
	noc_status char(1) constraint noc_status_ck check (noc_status in ('A', 'C')) not null
);
 
comment on table notificacao_compra is 'Notificações de compra.';
comment on column notificacao_compra.noc_cod is 'Código da notificação de compra.';
comment on column notificacao_compra.noc_funcionario is 'Funcionário que fez a notificação de compra.';
comment on column notificacao_compra.noc_produto is 'Produto que está sendo notificado a necessidade de compra.';
comment on column notificacao_compra.noc_qtd_produto is 'Quantidade do produto que está sendo notificado a necessidade de compra.';
comment on column notificacao_compra.noc_data is 'Data e hora da notificação de compra.';
comment on column notificacao_compra.noc_status is 'Status da notificação de compra (A = Aberto, C = Concluído).';

-----------------------------------------------------------------------------------------------------------------------------

create table produto_movimento(
	mov_cod serial constraint produto_movimento_pk primary key,
	mov_data timestamp not null,
	mov_pessoa integer constraint mov_pessoa_fk references pessoa(pes_cod) not null,
	mov_produto integer constraint mov_produto_fk references produto(pro_cod) not null,
	mov_qtd_produto integer not null
);
 
comment on table produto_movimento is 'Movimentações (entrada e saída) de produtos. utilizada no controle de estoque.';
comment on column produto_movimento.mov_cod is 'Código de identificação da movimentação de um produto.';
comment on column produto_movimento.mov_data is 'Data em que foi realizada a movimentação(entrada/saída) de um produto.';
comment on column produto_movimento.mov_pessoa is 'Código da pessoa envolvida na movimentação do produto.';
comment on column produto_movimento.mov_produto is 'Código do produto que sofreu movimentação.';
comment on column produto_movimento.mov_qtd_produto is 'Código do produto que sofreu movimentação. (Um valor maior que 0 representa uma "entrada" e um valor menor que 0 representa uma "saída").';

-----------------------------------------------------------------------------------------------------------------------------

create table tipo_pagamento(
	pag_cod serial constraint tipo_pagamento_pk primary key,
	pag_descricao varchar(40) not null
);
 
comment on table tipo_pagamento is 'Cadastro de tipos de pagamento.';
comment on column tipo_pagamento.pag_cod is 'Código do tipo de pagamento.';
comment on column tipo_pagamento.pag_descricao is 'Descrição do tipo de pagamento.';

-----------------------------------------------------------------------------------------------------------------------------

create table venda(
	ven_numero serial constraint venda_pk primary key,
	ven_data timestamp not null,
	ven_pessoa integer constraint ven_pessoa_fk references pessoa(pes_cod) not null,
	ven_pagamento integer constraint ven_tipo_pagamento_fk references tipo_pagamento(pag_cod) not null,
	ven_funcionario integer constraint ven_funcionario_fk references funcionario(fun_pessoa) not null,
	ven_receita bytea
);
 
comment on table venda is 'Tabela com registro de vendas.';
comment on column venda.ven_numero is 'Número da venda.';
comment on column venda.ven_data is 'Data e hora da efetivação da venda.';
comment on column venda.ven_pessoa is 'Código da pessoa a qual está sendo realizada a venda.';
comment on column venda.ven_pagamento is 'Código do tipo de pagamento da venda.';
comment on column venda.ven_funcionario is 'Código do funcionário que efetuou a venda.';
comment on column venda.ven_receita is 'Receita apresentada durante a venda.';

-----------------------------------------------------------------------------------------------------------------------------

create table venda_item(
	vei_cod serial constraint venda_item_pk primary key,
	vei_numvenda integer constraint vei_venda_fk references venda(ven_numero) not null,
	vei_produto integer constraint vei_produto_fk references produto(pro_cod) not null,
	vei_qtd_item integer not null,
	vei_unitario numeric(10,2) not null,
	vei_total_item numeric(10,2) not null	
);

alter table venda_item add constraint vei_vendaproduto_uk unique (vei_numvenda, vei_produto);
 
comment on table venda_item is 'Itens(produtos) da venda.';
comment on column venda_item.vei_cod is 'Código de identificação do item da venda.';
comment on column venda_item.vei_numvenda is 'Número da venda a qual o item pertence.';
comment on column venda_item.vei_produto is 'Código do item(produto) na venda.';
comment on column venda_item.vei_qtd_item is 'Quantidade do item na venda.';
comment on column venda_item.vei_unitario is 'Preço unitário utilizado na venda.';
comment on column venda_item.vei_total_item is 'Valor total do item na venda.';

-----------------------------------------------------------------------------------------------------------------------------

create table compra(
	com_numero serial constraint compra_pk primary key,
	com_data timestamp not null,
	com_pessoa integer constraint com_pessoa_fk references pessoa(pes_cod) not null,
	com_pagamento integer constraint com_tipo_pagamento_fk references tipo_pagamento(pag_cod) not null,
	com_funcionario integer constraint com_funcionario_fk references funcionario(fun_pessoa) not null
);
  
 
comment on table compra is 'Tabela com registro de compras.';
comment on column compra.com_numero is 'Número da compra.';
comment on column compra.com_data is 'Data e hora da efetivação da compra.';
comment on column compra.com_pessoa is 'Código da pessoa a qual foi feita a compra.';
comment on column compra.com_pagamento is 'Código do tipo de pagamento da compra.';
comment on column compra.com_funcionario is 'Código do funcionário que efetuou a compra.';

-----------------------------------------------------------------------------------------------------------------------------

create table compra_item(
	coi_cod serial constraint compra_item_pk primary key,
	coi_numcompra integer constraint coi_compra_fk references compra(com_numero) not null,
	coi_produto integer constraint coi_produto_fk references produto(pro_cod) not null,
	coi_qtd_item integer not null,
	coi_unitario numeric(10,2) not null,
	coi_total_item numeric(10,2) not null	
);
 
alter table compra_item add constraint coi_compraproduto_uk unique (coi_numcompra, coi_produto);

comment on table compra_item is 'Itens(produtos) da compra.';
comment on column compra_item.coi_cod is 'Código de identificação do item da compra.';
comment on column compra_item.coi_numcompra is 'Número da compra a qual o item pertence.';
comment on column compra_item.coi_produto is 'Código do produto na compra.';
comment on column compra_item.coi_qtd_item is 'Quantidade do item na compra.';
comment on column compra_item.coi_unitario is 'Valor unitário do item na compra.';
comment on column compra_item.coi_total_item is 'Valor total do item.';

-----------------------------------------------------------------------------------------------------------------------------

create table auditoria(
    aud_cod serial constraint auditoria_pk primary key,
    aud_tabela varchar(50) not null,
    aud_usuario varchar(50) not null,
    aud_data timestamp not null,
    aud_operacao char(1) not null, 
    aud_regnew text,
    aud_regold text
);

comment on table auditoria is 'Tabela de auditoria que armazena os logs de insert, delete e update realizados em qualquer uma das tabelas do banco de dados gaiadb.';
comment on column auditoria.aud_cod is 'Código da auditoria.';
comment on column auditoria.aud_tabela is 'Nome da tabela que sofreu inclusão, exclusão ou alteração.';
comment on column auditoria.aud_usuario is 'Nome do usuário que realizou a inclusão, exclusão ou alteração.';
comment on column auditoria.aud_data is 'Data e hora em que foi realizada a inclusão, exclusão ou alteração.';
comment on column auditoria.aud_operacao is 'Operação que foi realizada na tabela (I = Inclusão, E = Exclusão, A = Alteração).';
comment on column auditoria.aud_regnew is 'Registro novo na tabela.';
comment on column auditoria.aud_regold is 'Registro antigo na tabela.';