create database GaiaDB;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE NOTIFICACAO_COMPRA (
  NOC_COD         SERIAL NOT NULL, 
  NOC_FUNPESSOA   int4 NOT NULL, 
  NOC_PRODUTO     int4 NOT NULL, 
  NOC_QTD_PRODUTO int4 NOT NULL, 
  NOC_DATANOTIFIC timestamp NOT NULL, 
  NOC_CONCLUIDO   char(1) NOT NULL, 
  PRIMARY KEY (NOC_COD));
 
ALTER TABLE NOTIFICACAO_COMPRA ADD CONSTRAINT FKNOTIFICACA13836 FOREIGN KEY (NOC_FUNPESSOA) REFERENCES FUNCIONARIO (FUN_PESSOA);
ALTER TABLE NOTIFICACAO_COMPRA ADD CONSTRAINT FKNOTIFICACA240939 FOREIGN KEY (NOC_PRODUTO) REFERENCES PRODUTO (PRO_COD);
 
COMMENT ON TABLE NOTIFICACAO_COMPRA IS 'Notificações de compra.';
COMMENT ON COLUMN NOTIFICACAO_COMPRA.NOC_COD IS 'Código da notificação de compra.';
COMMENT ON COLUMN NOTIFICACAO_COMPRA.NOC_FUNPESSOA IS 'Funcionário que fez a notificação de compra.';
COMMENT ON COLUMN NOTIFICACAO_COMPRA.NOC_PRODUTO IS 'Produto que está sendo notificado a necessidade de compra.';
COMMENT ON COLUMN NOTIFICACAO_COMPRA.NOC_QTD_PRODUTO IS 'Quantidade do produto que está sendo notificado a necessidade de compra.';
COMMENT ON COLUMN NOTIFICACAO_COMPRA.NOC_DATANOTIFIC IS 'Data e hora da notificação de compra.';
COMMENT ON COLUMN NOTIFICACAO_COMPRA.NOC_CONCLUIDO IS 'Campo que indica de a notificação de compra está em aberto ou concluída (A = Aberto, C = Concluído).';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE FUNCIONARIO (
  FUN_PESSOA   int4 NOT NULL, 
  FUN_ADMISSAO date NOT NULL, 
  FUN_DEMISSAO date, 
  COD_CARGO    int4 NOT NULL, 
  PRIMARY KEY (FUN_PESSOA));
 
ALTER TABLE FUNCIONARIO ADD CONSTRAINT FKFUNCIONARI105692 FOREIGN KEY (FUN_PESSOA) REFERENCES PESFISICA (FIS_PESSOA);
ALTER TABLE FUNCIONARIO ADD CONSTRAINT FKFUNCIONARI908073 FOREIGN KEY (COD_CARGO) REFERENCES CARGO (CAR_COD);
 
COMMENT ON TABLE FUNCIONARIO IS 'Cadastro de funcionários.';
COMMENT ON COLUMN FUNCIONARIO.FUN_PESSOA IS 'Código do funcionário.';
COMMENT ON COLUMN FUNCIONARIO.FUN_ADMISSAO IS 'Data de admissão do funcionário.';
COMMENT ON COLUMN FUNCIONARIO.FUN_DEMISSAO IS 'Data de demissão do funcionário.';
COMMENT ON COLUMN FUNCIONARIO.COD_CARGO IS 'Código do cargo vinculado ao funcionário.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PESFISICA (
  FIS_PESSOA         int4 NOT NULL, 
  FIS_CPF            varchar(11) NOT NULL UNIQUE, 
  FIS_DATANASCIMENTO date NOT NULL, 
  FIS_GENERO         char(1), 
  FIS_FUNCIONARIO    char(1) NOT NULL, 
  PRIMARY KEY (FIS_PESSOA));
 
ALTER TABLE PESFISICA ADD CONSTRAINT FKPESFISICA430080 FOREIGN KEY (FIS_PESSOA) REFERENCES PESSOA (PES_COD);
 
COMMENT ON TABLE PESFISICA IS 'Cadastro de informações de pessoas físicas.';
COMMENT ON COLUMN PESFISICA.FIS_PESSOA IS 'Código da pessoa física.';
COMMENT ON COLUMN PESFISICA.FIS_CPF IS 'CPF da pessoa física.';
COMMENT ON COLUMN PESFISICA.FIS_DATANASCIMENTO IS 'Data de nascimento da pessoa física.';
COMMENT ON COLUMN PESFISICA.FIS_GENERO IS 'Genêro da pessoa física (M = Masculino, F = Femininio, O = Outro).';
COMMENT ON COLUMN PESFISICA.FIS_FUNCIONARIO IS 'Campo que indica se a pessoa é funcionário ou não (S = Sim, N = Não).';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PESSOA (
  PES_COD          SERIAL NOT NULL, 
  PES_NOME         varchar(60) NOT NULL, 
  PES_TIPO         char(1) NOT NULL, 
  PES_STATUS       char(1) NOT NULL, 
  PES_DATACADASTRO date NOT NULL, 
  PRIMARY KEY (PES_COD));
 
COMMENT ON TABLE PESSOA IS 'Cadastro de pessoas.';
COMMENT ON COLUMN PESSOA.PES_COD IS 'Código da pessoa.';
COMMENT ON COLUMN PESSOA.PES_NOME IS 'Nome/Razão Social da pessoa.';
COMMENT ON COLUMN PESSOA.PES_TIPO IS 'Tipo de Pessoa (J = Jurídica, F = Física).';
COMMENT ON COLUMN PESSOA.PES_STATUS IS 'Campo que indica se o cadastro da pessoa está inativo ou ativo (I = Inativo, A = Ativo).';
COMMENT ON COLUMN PESSOA.PES_DATACADASTRO IS 'Data de cadastro da pessoa no sistema.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CARGO (
  CAR_COD       SERIAL NOT NULL, 
  CAR_DESCRICAO varchar(50) NOT NULL, 
  CAR_SALARIO   numeric(10, 2) NOT NULL, 
  PRIMARY KEY (CAR_COD));
 
COMMENT ON TABLE CARGO IS 'Cadastro de cargos para os funcionários.';
COMMENT ON COLUMN CARGO.CAR_COD IS 'Código do cargo.';
COMMENT ON COLUMN CARGO.CAR_DESCRICAO IS 'Descrição (Nome) do cargo.';
COMMENT ON COLUMN CARGO.CAR_SALARIO IS 'Salário do cargo.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUTO (
  PRO_COD            SERIAL NOT NULL, 
  PRO_NOME           varchar(40) NOT NULL, 
  PRO_DESCRICAO      varchar(70), 
  PRO_PRECO          numeric(10, 2) NOT NULL, 
  PRO_QUANTIDADE     int4 NOT NULL, 
  PRO_ESTOQUE_MINIMO int4, 
  PRO_STATUS         char(1) NOT NULL, 
  PRO_PRINCIPIOATIVO int4 NOT NULL, 
  PRO_TIPMEDICAMENTO int4 NOT NULL, 
  PRO_TIPTARJA       int4 NOT NULL, 
  PRIMARY KEY (PRO_COD));
 
ALTER TABLE PRODUTO ADD CONSTRAINT FKPRODUTO839667 FOREIGN KEY (PRO_PRINCIPIOATIVO) REFERENCES PRINCIPIO_ATIVO (PRA_COD);
ALTER TABLE PRODUTO ADD CONSTRAINT FKPRODUTO500339 FOREIGN KEY (PRO_TIPMEDICAMENTO) REFERENCES TIPO_MEDICAMENTO (TIM_COD);
ALTER TABLE PRODUTO ADD CONSTRAINT FKPRODUTO745900 FOREIGN KEY (PRO_TIPTARJA) REFERENCES TIPO_TARJA (TIT_COD);
 
COMMENT ON TABLE PRODUTO IS 'Cadastro de produtos/medicamentos.';
COMMENT ON COLUMN PRODUTO.PRO_COD IS 'Código do produto.';
COMMENT ON COLUMN PRODUTO.PRO_NOME IS 'Nome do produto.';
COMMENT ON COLUMN PRODUTO.PRO_DESCRICAO IS 'Descrição do produto.';
COMMENT ON COLUMN PRODUTO.PRO_PRECO IS 'Preço de venda do produto.';
COMMENT ON COLUMN PRODUTO.PRO_QUANTIDADE IS 'Quantidade em estoque do produto.';
COMMENT ON COLUMN PRODUTO.PRO_ESTOQUE_MINIMO IS 'Quantidade de estoque mínimo para o produto.';
COMMENT ON COLUMN PRODUTO.PRO_STATUS IS 'Campo que indica se o cadastro do produto está inativo ou ativo (I = Inativo, A = Ativo).';
COMMENT ON COLUMN PRODUTO.PRO_PRINCIPIOATIVO IS 'Princípio ativo do produto.';
COMMENT ON COLUMN PRODUTO.PRO_TIPMEDICAMENTO IS 'Tipo de medicamento do produto.';
COMMENT ON COLUMN PRODUTO.PRO_TIPTARJA IS 'Tipo de tarja do produto.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRINCIPIO_ATIVO (
  PRA_COD       SERIAL NOT NULL, 
  PRA_DESCRICAO varchar(40) NOT NULL, 
  PRIMARY KEY (PRA_COD));
 
COMMENT ON TABLE PRINCIPIO_ATIVO IS 'Cadastro de Princípio Ativo.';
COMMENT ON COLUMN PRINCIPIO_ATIVO.PRA_COD IS 'Código do princípio ativo.';
COMMENT ON COLUMN PRINCIPIO_ATIVO.PRA_DESCRICAO IS 'Descrição/nome do princípio ativo.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIPO_MEDICAMENTO (
  TIM_COD       SERIAL NOT NULL, 
  TIM_DESCRICAO varchar(20) NOT NULL, 
  PRIMARY KEY (TIM_COD));
 
COMMENT ON TABLE TIPO_MEDICAMENTO IS 'Cadastro de tipos de medicamentos (Genérico, Similar ou Referência).';
COMMENT ON COLUMN TIPO_MEDICAMENTO.TIM_COD IS 'Código do tipo de medicamento.';
COMMENT ON COLUMN TIPO_MEDICAMENTO.TIM_DESCRICAO IS 'Descrição do tipo de medicamento.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIPO_TARJA (
  TIT_COD       SERIAL NOT NULL, 
  TIT_DESCRICAO varchar(20) NOT NULL, 
  PRIMARY KEY (TIT_COD));
 
COMMENT ON TABLE TIPO_TARJA IS 'Cadastro de tipos de tarja (Sem tarja, Vermelha, Amarela e Preta).';
COMMENT ON COLUMN TIPO_TARJA.TIT_COD IS 'Código do tipo de tarja.';
COMMENT ON COLUMN TIPO_TARJA.TIT_DESCRICAO IS 'Descrição do tipo de tarja.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PESJURIDICA (
  JUR_PESSOA       int4 NOT NULL, 
  JUR_CNPJ         varchar(14) NOT NULL UNIQUE, 
  JUR_DATAFUNDACAO date, 
  PRIMARY KEY (JUR_PESSOA));
 
ALTER TABLE PESJURIDICA ADD CONSTRAINT FKPESJURIDIC29305 FOREIGN KEY (JUR_PESSOA) REFERENCES PESSOA (PES_COD);
 
COMMENT ON TABLE PESJURIDICA IS 'Cadastro de informações de pessoas jurídicas.';
COMMENT ON COLUMN PESJURIDICA.JUR_PESSOA IS 'Código da pessoa jurídica.';
COMMENT ON COLUMN PESJURIDICA.JUR_CNPJ IS 'CNPJ  da pessoa jurídica.';
COMMENT ON COLUMN PESJURIDICA.JUR_DATAFUNDACAO IS 'Data de fundação da empresa.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUTO_MOVIMENTO (
  MOV_COD         SERIAL NOT NULL, 
  MOV_DATA        timestamp NOT NULL, 
  MOV_FUNCIONARIO int4 NOT NULL, 
  MOV_PRODUTO     int4 NOT NULL, 
  MOV_QTD_PRODUTO int4 NOT NULL, 
  PRIMARY KEY (MOV_COD));
 
ALTER TABLE PRODUTO_MOVIMENTO ADD CONSTRAINT FKPRODUTO_MO455038 FOREIGN KEY (MOV_FUNCIONARIO) REFERENCES FUNCIONARIO (FUN_PESSOA);
ALTER TABLE PRODUTO_MOVIMENTO ADD CONSTRAINT FKPRODUTO_MO548923 FOREIGN KEY (MOV_PRODUTO) REFERENCES PRODUTO (PRO_COD);
 
COMMENT ON TABLE PRODUTO_MOVIMENTO IS 'Movimentações (Entrada e Saída) de produtos. Utilizada no controle de estoque.';
COMMENT ON COLUMN PRODUTO_MOVIMENTO.MOV_COD IS 'Código de identificação da movimentação de um produto.';
COMMENT ON COLUMN PRODUTO_MOVIMENTO.MOV_DATA IS 'Data em que foi realizada a movimentação(Entrada/Saída) de um produto.';
COMMENT ON COLUMN PRODUTO_MOVIMENTO.MOV_FUNCIONARIO IS 'Código do funcionário envolvido na movimentação do produto.';
COMMENT ON COLUMN PRODUTO_MOVIMENTO.MOV_PRODUTO IS 'Código do produto que sofreu movimentação.';
COMMENT ON COLUMN PRODUTO_MOVIMENTO.MOV_QTD_PRODUTO IS 'Quantidade do produto que sofreu movimentação.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ENDERECO (
  END_COD         SERIAL NOT NULL, 
  END_TIPENDERECO int4 NOT NULL, 
  END_PESSOA      int4 NOT NULL, 
  END_CEP         char(8) NOT NULL, 
  END_BAIRRO      varchar(40), 
  END_RUA         varchar(40), 
  END_NUMRESID    int4, 
  END_NUMTELEFONE char(8), 
  END_NUMCELULAR  varchar(13), 
  END_EMAIL       varchar(40), 
  CONSTRAINT "ENF_ID	int4	0	true	false	false" 
    PRIMARY KEY (END_COD));
   
ALTER TABLE ENDERECO ADD CONSTRAINT FKENDERECO230566 FOREIGN KEY (END_TIPENDERECO) REFERENCES TIPO_ENDERECO (TEN_COD);
ALTER TABLE ENDERECO ADD CONSTRAINT FKENDERECO815785 FOREIGN KEY (END_PESSOA) REFERENCES PESSOA (PES_COD);
ALTER TABLE ENDERECO ADD CONSTRAINT FKENDERECO727135 FOREIGN KEY (END_CEP) REFERENCES CEP (CEP_NUMERO);
   
COMMENT ON TABLE ENDERECO IS 'Cadastro de endereços.';
COMMENT ON COLUMN ENDERECO.END_COD IS 'Código do endereço.';
COMMENT ON COLUMN ENDERECO.END_TIPENDERECO IS 'Código do tipo de endereço.';
COMMENT ON COLUMN ENDERECO.END_PESSOA IS 'Código da pessoa detentora do endereço.';
COMMENT ON COLUMN ENDERECO.END_CEP IS 'CEP do endereço.';
COMMENT ON COLUMN ENDERECO.END_BAIRRO IS 'Nome do bairro do endereço.';
COMMENT ON COLUMN ENDERECO.END_RUA IS 'Nome da rua do endereço.';
COMMENT ON COLUMN ENDERECO.END_NUMRESID IS 'Número da residência do endereço.';
COMMENT ON COLUMN ENDERECO.END_NUMTELEFONE IS 'Número de telefone fixo do endereço.';
COMMENT ON COLUMN ENDERECO.END_NUMCELULAR IS 'Número de celular do endereço.';
COMMENT ON COLUMN ENDERECO.END_EMAIL IS 'Endereço de email.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIPO_ENDERECO (
  TEN_COD       SERIAL NOT NULL, 
  TEN_DESCRICAO varchar(25) NOT NULL, 
  PRIMARY KEY (TEN_COD));
 
COMMENT ON TABLE TIPO_ENDERECO IS 'Cadastro de tipos de endereço.';
COMMENT ON COLUMN TIPO_ENDERECO.TEN_COD IS 'Código do tipo de endereço.';
COMMENT ON COLUMN TIPO_ENDERECO.TEN_DESCRICAO IS 'Descrição do tipo de endereço.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CEP (
  CEP_NUMERO    char(8) NOT NULL, 
  COD_MUNICIPIO int4 NOT NULL, 
  PRIMARY KEY (CEP_NUMERO));
 
ALTER TABLE CEP ADD CONSTRAINT FKCEP601831 FOREIGN KEY (COD_MUNICIPIO) REFERENCES MUNICIPIO (MUN_COD);
 
COMMENT ON TABLE CEP IS 'Cadastro de CEP''s.';
COMMENT ON COLUMN CEP.CEP_NUMERO IS 'CEP.';
COMMENT ON COLUMN CEP.COD_MUNICIPIO IS 'Código do município do CEP.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE MUNICIPIO (
  MUN_COD    SERIAL NOT NULL, 
  MUN_NOME   varchar(40) NOT NULL, 
  COD_ESTADO int4 NOT NULL, 
  PRIMARY KEY (MUN_COD));
 
ALTER TABLE MUNICIPIO ADD CONSTRAINT FKMUNICIPIO56174 FOREIGN KEY (COD_ESTADO) REFERENCES ESTADO (EST_COD);
 
COMMENT ON TABLE MUNICIPIO IS 'Cadastro de municípios.';
COMMENT ON COLUMN MUNICIPIO.MUN_COD IS 'Código do munícipio.';
COMMENT ON COLUMN MUNICIPIO.MUN_NOME IS 'Nome do munícipio.';
COMMENT ON COLUMN MUNICIPIO.COD_ESTADO IS 'Código do estado do munícipio.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ESTADO (
  EST_COD  SERIAL NOT NULL, 
  EST_NOME varchar(25) NOT NULL, 
  PRIMARY KEY (EST_COD));
 
COMMENT ON TABLE ESTADO IS 'Cadastro de unidades federativas (Estados).';
COMMENT ON COLUMN ESTADO.EST_COD IS 'Código do estado.';
COMMENT ON COLUMN ESTADO.EST_NOME IS 'Nome do estado.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE VENDA_ITEM (
  VEI_ID         SERIAL NOT NULL, 
  VEI_NUMVENDA   int4 NOT NULL, 
  VEI_PRODUTO    int4 NOT NULL, 
  VEI_QTD_ITEM   int4 NOT NULL, 
  VEI_UNITARIO   numeric(10, 2) NOT NULL, 
  VEI_TOTAL_ITEM numeric(10, 2) NOT NULL, 
  PRIMARY KEY (VEI_ID));
 
ALTER TABLE VENDA_ITEM ADD CONSTRAINT FKVENDA_ITEM107704 FOREIGN KEY (VEI_PRODUTO) REFERENCES PRODUTO (PRO_COD);
ALTER TABLE VENDA_ITEM ADD CONSTRAINT FKVENDA_ITEM74577 FOREIGN KEY (VEI_NUMVENDA) REFERENCES VENDA (VEN_NUMERO);
 
COMMENT ON TABLE VENDA_ITEM IS 'Itens(Produtos) da venda.';
COMMENT ON COLUMN VENDA_ITEM.VEI_ID IS 'Código de identificação do item da venda.';
COMMENT ON COLUMN VENDA_ITEM.VEI_NUMVENDA IS 'Número da venda a qual o item pertence.';
COMMENT ON COLUMN VENDA_ITEM.VEI_PRODUTO IS 'Código do item(produto) na venda.';
COMMENT ON COLUMN VENDA_ITEM.VEI_QTD_ITEM IS 'Quantidade do item na venda.';
COMMENT ON COLUMN VENDA_ITEM.VEI_UNITARIO IS 'Preço unitário utilizado na venda.';
COMMENT ON COLUMN VENDA_ITEM.VEI_TOTAL_ITEM IS 'Valor total do item na venda.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE VENDA (
  VEN_NUMERO      SERIAL NOT NULL, 
  VEN_DATA        timestamp NOT NULL, 
  COD_PESSOA      int4 NOT NULL, 
  COD_PAGAMENTO   int4 NOT NULL, 
  COD_FUNCIONARIO int4 NOT NULL, 
  VEN_TOTAL       numeric(10, 2) NOT NULL, 
  VEN_RECEITA     bytea, 
  PRIMARY KEY (VEN_NUMERO));
 
ALTER TABLE VENDA ADD CONSTRAINT FKVENDA624268 FOREIGN KEY (COD_PESSOA) REFERENCES PESSOA (PES_COD);
ALTER TABLE VENDA ADD CONSTRAINT FKVENDA668055 FOREIGN KEY (COD_PAGAMENTO) REFERENCES TIPO_PAGAMENTO (PAG_COD);
ALTER TABLE VENDA ADD CONSTRAINT FKVENDA496588 FOREIGN KEY (COD_FUNCIONARIO) REFERENCES FUNCIONARIO (FUN_PESSOA);
 
COMMENT ON TABLE VENDA IS 'Tabela com registro de vendas.';
COMMENT ON COLUMN VENDA.VEN_NUMERO IS 'Número da venda.';
COMMENT ON COLUMN VENDA.VEN_DATA IS 'Data e hora da efetivação da venda.';
COMMENT ON COLUMN VENDA.COD_PESSOA IS 'Código da pessoa a qual está sendo realizada a venda.';
COMMENT ON COLUMN VENDA.COD_PAGAMENTO IS 'Código do tipo de pagamento da venda.';
COMMENT ON COLUMN VENDA.COD_FUNCIONARIO IS 'Código do funcionário que efetuou a venda.';
COMMENT ON COLUMN VENDA.VEN_TOTAL IS 'Valor total da venda (Somatório dos valores totais dos Itens).';
COMMENT ON COLUMN VENDA.VEN_RECEITA IS 'Receita apresentada durante a venda.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIPO_PAGAMENTO (
  PAG_COD       SERIAL NOT NULL, 
  PAG_DESCRICAO varchar(40) NOT NULL, 
  PRIMARY KEY (PAG_COD));
 
COMMENT ON TABLE TIPO_PAGAMENTO IS 'Cadastro de tipos de pagamento.';
COMMENT ON COLUMN TIPO_PAGAMENTO.PAG_COD IS 'Código do tipo de pagamento.';
COMMENT ON COLUMN TIPO_PAGAMENTO.PAG_DESCRICAO IS 'Descrição do tipo de pagamento.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE COMPRA_ITEM (
  COI_ID         SERIAL NOT NULL, 
  COI_NUMCOMPRA  int4 NOT NULL, 
  COI_PRODUTO    int4 NOT NULL, 
  COI_QTD_ITEM   int4 NOT NULL, 
  COI_UNITARIO   numeric(10, 2) NOT NULL, 
  COI_TOTAL_ITEM numeric(10, 2) NOT NULL, 
  PRIMARY KEY (COI_ID));
 
ALTER TABLE COMPRA_ITEM ADD CONSTRAINT FKCOMPRA_ITE485039 FOREIGN KEY (COI_NUMCOMPRA) REFERENCES COMPRA (COM_NUMERO);
ALTER TABLE COMPRA_ITEM ADD CONSTRAINT FKCOMPRA_ITE284884 FOREIGN KEY (COI_PRODUTO) REFERENCES PRODUTO (PRO_COD);
 
COMMENT ON TABLE COMPRA_ITEM IS 'Itens(Produtos) da compra.';
COMMENT ON COLUMN COMPRA_ITEM.COI_ID IS 'Código de identificação do item da compra.';
COMMENT ON COLUMN COMPRA_ITEM.COI_NUMCOMPRA IS 'Número da compra a qual o item pertence.';
COMMENT ON COLUMN COMPRA_ITEM.COI_PRODUTO IS 'Código do produto na compra.';
COMMENT ON COLUMN COMPRA_ITEM.COI_QTD_ITEM IS 'Quantidade do item na compra.';
COMMENT ON COLUMN COMPRA_ITEM.COI_UNITARIO IS 'Valor unitário do item na compra.';
COMMENT ON COLUMN COMPRA_ITEM.COI_TOTAL_ITEM IS 'Valor total do item.';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE COMPRA (
  COM_NUMERO      SERIAL NOT NULL, 
  COM_DATA        timestamp NOT NULL, 
  COD_PESSOA      int4 NOT NULL, 
  COD_PAGAMENTO   int4 NOT NULL, 
  COD_FUNCIONARIO int4 NOT NULL, 
  COM_TOTAL       numeric(10, 2) NOT NULL, 
  PRIMARY KEY (COM_NUMERO));
 
ALTER TABLE COMPRA ADD CONSTRAINT FKCOMPRA555334 FOREIGN KEY (COD_PESSOA) REFERENCES PESSOA (PES_COD);
ALTER TABLE COMPRA ADD CONSTRAINT FKCOMPRA263010 FOREIGN KEY (COD_PAGAMENTO) REFERENCES TIPO_PAGAMENTO (PAG_COD);
ALTER TABLE COMPRA ADD CONSTRAINT FKCOMPRA434477 FOREIGN KEY (COD_FUNCIONARIO) REFERENCES FUNCIONARIO (FUN_PESSOA);
 
COMMENT ON TABLE COMPRA IS 'Tabela com registro de compras.';
COMMENT ON COLUMN COMPRA.COM_NUMERO IS 'Número da compra.';
COMMENT ON COLUMN COMPRA.COM_DATA IS 'Data e hora da efetivação da compra.';
COMMENT ON COLUMN COMPRA.COD_PESSOA IS 'Código da pessoa a qual foi feita a compra.';
COMMENT ON COLUMN COMPRA.COD_PAGAMENTO IS 'Código do tipo de pagamento da compra.';
COMMENT ON COLUMN COMPRA.COD_FUNCIONARIO IS 'Código do funcionário que efetuou a compra.';
COMMENT ON COLUMN COMPRA.COM_TOTAL IS 'Valor total da compra (Somatório dos valores totais dos Itens).';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

