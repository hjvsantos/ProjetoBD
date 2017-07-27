create database HOPEatualizado;
use HOPEatualizado;

create table instituicao(
	id_doador varchar(5),
    CNPJ varchar(14),
    ramo_atuacao varchar(10),
    razao_social varchar(10),
    email varchar(20),
    nome_contato varchar(40),
    data_entrada datetime,
    telefone_1 varchar(10),
    telefone_2 varchar(10),
    num_doacoes int,
    data_entrada datetime, 
    nome_fantasia varchar(20),
    tipo enum('DOADORA', 'RECEPTORA'),
    constraint intituicao_pk primary key (id_doador, CNPJ)
);

create table doadora(
	data_ultima_doacao datetime
);

create table receptora(
	data_ultima_recepcao datetime
);

create table donativo_produto(
	id_donativo varchar(10),
    data_doacao datetime,
    ja_em_estoque boolean,
    id_instituicao_doadora varchar(19),
    constraint donativo_procuto_id_donativo primary key(id_donativo),
    constraint donativo_produto_id_instituaicao_doadora foreign key (id_instituicao_doadora) references instituicao(instituicao_pk)
);

create table produto_ref(
	cod_prod varchar (10),
    descricao varchar(140),
    cod_barra varchar(30),
    marca varchar(10),
    constraint produto_ref_pk primary key (cod_prod)
);

create table pedido_produto(
	id_pedido varchar(10),
    data_pedido datetime, 
    data_atendimento datetime,
    status_pedido enum('ENTREGUE', 'NÃO ENTREGUE'),
    id_receptora varchar(19),
    constraint pedido_produto_id_pedido primary key (id_pedido),
    constraint pedido_produto_id_receptora foreign key (id_receptora) references instituicao(instituicao_pk)
);

-- Nessa parte, como faz pra entidade ser fraca? Questão da pk e fk
create table item_produto_pedido(
	data_validade datetime,
    qte_pedida double,
    num_seq varchar(5),
    cod_prod varchar(10),
    constraint item_produto_pedido_pk primary key (cod_prod, num_seq),
    constraint item_produto_pedido_cod_prod_fk foreign key (cod_prod) references produto_ref(produto_ref_pk)
);

create table item_produto_doado(
	num_seq varchar(5),
    data_entrada datetime,
    data_validade datetime,
    data_entrada_estoque datetime,
    qte_doada double,
    cod_prod varchar(19),
    constraint item_produto_doado_pk primary key (cod_prod, num_seq),
    constraint item_produto_doado_cod_prod_fk foreign key (cod_prod) references produto_ref(produto_ref_pk)
);

create table item_prod_estoque(
	qte_minima double, 
    data_entrada datetime,
    data_validade datetime,
    qte_atual double,
    num_seq varchar(5),
    cod_prod varchar(10),
    constraint item_prod_estoque_pk primary key (cod_prod, num_seq),
    constraint item_prod_estoque_fk foreign key (cod_prod) references produto_ref(produto_ref_pk)
);

create table estoque(
	codigo varchar(10),
    descricao varchar(140),
    data_ultima_entrada datetime,
    constraint estoque_pk primary key (codigo)
);










