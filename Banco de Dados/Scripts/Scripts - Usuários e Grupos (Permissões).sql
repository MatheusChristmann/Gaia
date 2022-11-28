/*   USUÁRIOS, GRUPOS E PERMISSÕES DO BANCO DE DADOS GAIADB   */


/* - O Dono da base e super usuário será o gaiadba.

- Os usuários otilia, roberson e franciele terão permissões de gerente
para realizarem as avaliações do Banco de Dados caso necessário.

- O usuário matheus será atendente, o usuário michell será comprador e 
o usuário jean será gerente. */

-----------------------------------------------------------------------------------------------------------------------------

/* USUÁRIOS */
create user gaiadba with superuser password '@gaiadba2022@';

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
on funcionario to gerente;

grant select, insert, update, delete 
on cargo to gerente;

grant select on relatorio04_vw
to gerente;


/* PERMISSÕES PARA O GRUPO ATENDENTE */

grant select, insert, update
on pessoa, pesfisica, pesjuridica to atendente;

grant select, insert, update, delete
on endereco to atendente;

grant select on estado, municipio
to atendente;

grant select, insert on venda, venda_item
to atendente;

grant select on produto, principio_ativo
to atendente;

grant select, insert, delete on notificacao_compra
to atendente;

grant select on relatorio01_vw, relatorio02_vw
to atendente;


/* PERMISSÕES PARA O GRUPO COMPRADOR */

grant select on relatorio01_vw, relatorio02_vw, relatorio03_vw
to comprador;

grant select, insert, update, delete on principio_ativo
to comprador;

grant select, insert, update on produto 
to comprador;

grant select, insert on compra, compra_item
to comprador;

grant select on pessoa 
to comprador;

grant select, insert, update on notificacao_compra
to comprador;

grant select on tipo_pagamento
to comprador;

-----------------------------------------------------------------------------------------------------------------------------

/* ATRIBUIÇÃO DE GRUPOS E PERMISSÕES PARA OS USUÁRIOS */

alter database "gaiadb" owner to gaiadba;

grant gerente to otilia, roberson, franciele, jean;

grant atendente to matheus;

grant comprador to michell;

-----------------------------------------------------------------------------------------------------------------------------

/*
 Lista de Tabelas:
estado,
municipio,
principio_ativo,
produto,
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
*/