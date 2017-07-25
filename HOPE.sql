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
    id_voluntario varchar(10),
    data_doacao_voluntario datetime,
    constraint doacao_voluntario_pk primary key(id_voluntario),
    constraint voluntario_id_voluntario_fk foreign key(id_voluntario) REFERENCES doacao(id_doacao),
    constraint data_doacao_volutario_fk foreign key (data_doacao_voluntario) references doacao(data_doacao)
);
    
create table doacao_financeiro(
	id_financeiro varchar(10),
    data_doacao_financeiro datetime,
    constraint doacao_finandeiro_pk primary key(id_financeiro),
    constraint doacao_financeiro_fk foreign key (id_financeiro) references doacao(id_doacao),
    constraint data_doacao_financeiro_fk foreign key (data_doacao_financeiro) references doacao(data_doacao)
);

create table doacao_produto(
	id_produto varchar(10),
    data_doacao_produto datetime,
    constraint doacao_produto_pk primary key(id_produto),
    constraint doacao_produto_fk foreign key (id_produto) references doacao(id_doacao),
    constraint data_doacao_produto_fk foreign key (data_doacao_produto) references doacao(data_doacao)
);

create table doacao_alimento(
	id_alimento varchar(10),
    validade date,
    data_doacao_alimento datetime, 
    tipo_almento varchar(13),
    constraint doacao_alimento_pk primary key(id_alimento),
    constraint doacao_alimento_fk foreign key (id_alimento) references doacao(id_doacao),
    constraint doacao_alimento_tipo_alimento_ck check(tipo_alimento in ('NÃO PERECIVEL', 'PERECIVEL')),
    constraint data_doacao_alimento_fk foreign key (data_doacao_alimento) references doacao(data_doacao)
    
); 

-- Tem que olhar isso aqui depois pra ver se as entidades relacionadas com ela não dão pra ser atributos
create table doacao_vestimenta(
	id_vestimenta varchar(10),
    data_doacao_vestimenta datetime,
    constraint doacao_vestimenta_pk primary key(id_vestimenta),
    constraint doacao_vestimenta_fk foreign key (id_vestimenta) references doacao(id_doacao),
    constraint data_doacao_vestimenta_fk foreign key (data_doacao_vestimenta) references doacao(data_doacao)
);

create table doacao_higiene(
	id_higiene varchar(10),
    tipo_higiene varchar(7),
    data_doacao_higiene datetime,
    constraint doacao_higiene_pk primary key(id_higiene),
    constraint doacao_higiene_fk foreign key (id_higiene) references doacao(id_doacao),
    constraint doacao_higiene_tipo_higiene_ck check(tipo_higiene in ('LIMPEZA', 'PESSOAL')),
    constraint data_doacao_higiene_fk foreign key (data_doacao_higiene) references doacao(data_doacao)
);

create table doacao_diversos(
	id_diversos varchar(10),
    descricao varchar(140),
    data_doacao_diversos datetime,
	constraint doacao_diversos_pk primary key(id_diversos),
    constraint doacao_diversos_fk foreign key(id_diversos) references doacao(id_doacao),
    constraint data_doacao_diversos_fk foreign key (data_doacao_diversos) references doacao(data_doacao)
);

create table doador(
	num_doacoes int,
    id_doador varchar(10),
    constraint doador_pk primary key(id_doador)
);

create table doador_juridica(
	id_doador_juridica varchar(10),
    num_doacoes_dj int,
    nome varchar(20), 
    CNPJ varchar(14),   
	endereco_dj varchar(8), 
    constraint doador_juridica_pk primary key (id_doador_juridica), 
    constraint doador_juridica_fk foreign key (id_doador_juridica) references doador(id_doador),
    constraint endereco_dj_fk foreign key (endereco_dj) references endereco(CEP),
    constraint num_doacoes_dj_fk foreign key (num_doacoes_dj) references doador(num_doacoes)
);

create table doador_fisica(
	num_doacoes_pf int,
    id_doador_fisica varchar(10),
    nome varchar(50),
    CPF varchar(11),
    endereco_pf varchar(8),
    constraint id_doador_fisica_pk primary key (id_doador_fisica),
    constraint id_doador_fisica_fk foreign key (id_doador_fisica) references doador(id_doador),
    constraint endereco_pf_fk foreign key (endereco_pf) references endereco(CEP)
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


