create database HOPE;
use HOPE;

create table insituicao(
	ramo_atuacao varchar(20), 
    CNPJ char(14), 
    nome varchar(20), 
    id_instituicao varchar(10), 
    ultima_doacao varchar(20), 
    constraint instituicao_pk primary key(id_instituicao)
    );
    
create table doacao(
	id_doacao char(10),
    data_doacao datetime,
    constraint doacao_pk primary key(id_doacao)
    );
    
create table doacao_voluntario(
	disp_horario varchar(50),
    id_voluntario varchar(10), -- Aqui eu coloquei uma chave pra identificar e não ficar uma entdade sem chave.
    constraint doacao_voluntario_pk primary key(id_voluntario),
    constraint voluntario_id_voluntario_fk foreign key(id_voluntario) REFERENCES doacao(id_doacao)
);
    
create table doacao_financeiro(
	id_financeiro varchar(10),
    constraint doacao_finandeiro_pk primary key(id_financeiro),
    constraint doacao_financeiro_fk foreign key (id_financeiro) references doacao(id_doacao)
);

create table doacao_produto(
	id_produto varchar(10),
    constraint doacao_produto_pk primary key(id_produto),
    constraint doacao_produto_fk foreign key (id_produto) references doacao(id_doacao)
);

create table alimento(
	id_alimento varchar(10),
    validade date, -- Algumas coisas tão sem chave, eu to colocando chave estrangeira, por causa das heranças. 
    tipo_almento varchar(13),
    constraint alimento_pk primary key(id_alimento),
    constraint alimento_fk foreign key (id_alimento) references doacao(id_doacao),
    constraint alimento_tipo_alimento_ck check(tipo_alimento in ('NÃO PERECIVEL', 'PERECIVEL'))
    
); 

create table vestimenta(
	id_vestimenta varchar(10),
    constraint vestimenta_pk primary key(id_vestimenta),
    constraint vestimenta_fk foreign key (id_vestimenta) references doacao(id_doacao)
);

create table higiene(
	id_higiene varchar(10),
    tipo_higiene varchar(7),
    constraint higiene_pk primary key(id_higiene),
    constraint higiene_fk foreign key (id_higiene) references doacao(id_doacao),
    constraint higiene_tipo_higiene_ck check(tipo_higiene in ('LIMPEZA', 'PESSOAL'))
);

create table diversos(
	id_diversos varchar(10),
    descricao varchar(140),
	constraint diversos_pk primary key(id_diversos),
    constraint diversos_fk foreign key(id_diversos) references doacao(id_doacao)
);

create table doador(
	num_doacoes int,
    id_doador varchar(10),
    constraint doador_pk primary key(id_doador)
);

create table doador_juridica(
	nome varchar(30), 
    CNPJ varchar(14)
    

);

create table endereco(
	CEP varchar(8),
    numero varchar(6),
    cidade varchar(20),
    bairro varchar(20),
    logradouro varchar(7),
    constraint endereco_pk primary key(CEP)
);

create table campanha(
	data_inicio datetime,
    data_fim datetime, 
    nome varchar(30),
    id_campanha varchar(10),
    constraint campanha_pk primary key(id_campanha)
);


