/*   USUÁRIOS E GRUPOS DO BANCO DE DADOS GAIADB   */

-----------------------------------------------------------------------------------------------------------------------------

/* USUÁRIOS */
create user gaiadba with superuser password '_#@gaiadba@#_';

create user otilia with password '@otilia123';
create user roberson with password '@roberson123';
create user franciele with password '@franciele123';

create user matheus with password '@matheus123';
create user michell with  password '@michell123';
create user jean with password '@jean123';

-----------------------------------------------------------------------------------------------------------------------------

/* GRUPOS */
create group atendente;
create group comprador;
create group gerente;

-----------------------------------------------------------------------------------------------------------------------------

/* PERMISSÕES PARA GRUPO GERENTE */
grant select, insert, update 
on funcionario to gerente

grant select, insert, update, delete 
on cargo to gerente

grant select 
on tipo_pagamento to gerente


/* PERMISSÕES PARA O GRUPO ATENDENTE */






-- Anotações sobre alterações no Caso de Uso
Adicionar no Caso de Uso:
Retirar no Caso de Uso:


-- Lista de Tabelas:
estado,
municipio,
cep,
principio_ativo,
produto,
tipo_medicamento,
tipo_tarja,
pessoa,
tipo_endereco,
endereco,
pesfisica,
pesjuridica,
cargo,
funcionario,
notificacao_compra,
produto_movimento,
venda,
tipo_pagamento,
venda_item,
compra,
compra_item,
auditoria,



