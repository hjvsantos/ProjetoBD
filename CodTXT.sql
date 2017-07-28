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
    nome_fantasia varchar(20),
    tipo enum('DOADORA', 'RECEPTORA'),
    constraint intituicao_pk primary key (id_doador, CNPJ)
);

create table donativo_produto(
	id_donativo varchar(10),
    data_doacao datetime,
    ja_em_estoque boolean,
    id_instituicao_doadora varchar(19),
    constraint donativo_procuto_id_donativo primary key(id_donativo),
    constraint donativo_produto_id_instituaicao_doadora foreign key (id_instituicao_doadora) references instituicao(instituicao_pk),
    constraint donativo_produto_id_pf_doadora foreign key (id_pf_doadora) references pf_doadora(pf_doadora_pk)
);

-- Falta fazer a relação N pra N com categoria_prod
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

create table administrador(
	data_inicio datetime,
    nome varchar(20),
    data_fim datetime,
    CPF varchar(11),
    data_nascimento datetime,
    constraint administrador_pk primary key (CPF, data_inicio)
);

create table estoque(
	codigo varchar(10),
    descricao varchar(140),
    data_ultima_entrada datetime,
    cod_administrador varchar(20),
    constraint estoque_pk primary key (codigo),
    constraint estoque_administrador_fk foreign key (cod_administrador) references administrdor(administrador_pk)
);

create table item_prod_estoque(
	qte_minima double, 
    data_entrada datetime,
    data_validade datetime,
    qte_atual double,
    num_seq varchar(5),
    cod_prod varchar(10),
    cod_estoque varchar(10),
    constraint item_prod_estoque_pk primary key (cod_prod, num_seq),
    constraint item_prod_estoque_fk foreign key (cod_prod) references produto_ref(produto_ref_pk),
    constraint item_prod_estoque_estoque_fk foreign key(codigo_estoque) references estoque(estoque_pk)
);

create table entrega(
	id_entrega varchar(10),
    data_entrega datetime, 
    status_entrega enum('ENTREGUE', 'NÃO ENTREGUE'),
    hora_agendada time,
    data_agendada datetime,
    obs varchar(140),
    id_voluntario varchar(10),
    constraint entrega_pk primary key (ed_entrega),
    constraint entrega_id_voluntario foreign key (id_voluntario) references voluntario_com_veiculo(voluntario_com_veiculo_pk)
);

create table doadora(
	data_ultima_doacao datetime
);

create table receptora(
	data_ultima_recepcao datetime,
    cod_entrega varchar(10),
    constraint receptora_cod_entrega_fk foreign key (cod_entrega) references entrega(id_entrega)
);

create table item_produto_entrega(
	num_seq varchar(10),
    qte_entregue double,
    cod_entrega varchar(10),
    cod_produto varchar(10),
    constraint item_produto_entrega_cod_entrega foreign key (cod_entregue) references entrega(id_entrega),
    constraint item_produto_entrega_cod_produto foreign key (cod_produto) references produto_ref(cod_produto)
);

-- Falta fazer relacionamento N pra N com instituição
create table endereco(
	CEP varchar(8),
    bairro varchar(15),
    cidade varchar(10),
    tipo_logradouro varchar(12),
    nome varchar(10),
    num_seq varchar(10),
    estado varchar(15),
    constraint endereco_pk primary key (num_seq)
);

-- Falta fazer o relacionamento N pra N com atividade
create table pessoa_fisica(
	CPF varchar(11),
    primeiro_nome varchar(10),
    meio_nome varchar(10),
    ultimo_nome varchar(10),
    anonimato boolean,
    data_nasc datetime,
    cep_endereco varchar(8),
    constraint pessoa_fisica_pk primary key (CPF),
    constraint pessoa_fisica_endereco foreign key (cep_endereco) references endereco(endereco_pk)    
);

create table pf_doadora(
	cod_pf_doadora varchar(10),
    constraint pf_doadora_fk foreign key (cod_pf_doadora) references pessoa_fisica(pessoa_fisica_pk)
);

-- Falta fazer o auto relacionamento dessa entidade
create table categoria_prod(
	id varchar(10),
    obs varchar(140),
    descricao varchar(200),
    caracteristicas varchar(100),
    constraint categoria_prod_pk primary key (id)
);

create table produto_ref_esta_em_categoria_prod(
	cod_produto_ref varchar(10),
    id_categoria_produto varchar(10),
    constraint produto_ref_esta_em_categoria_prod_pk primary key (cod_produro_ref, id_categoria_produto),
    constraint cod_produto_ref_fk foreign key (cod_produto_ref) references produto_ref(produto_ref_pk),
    constraint id_categoria_produto_fk foreign key (id_categoria_produto) references categoria_prod(categoria_prod_pk)
);

create table atividade(
	id varchar(10),
    descricao varchar(100),
    tipo varchar(20),
    duracao_media varchar(10),
    id_campanha varchar(10),
    constraint atividade_pk primary key (id),
    constraint atividade_id_campanha_fk foreign key (id_campanha) references campanha(campanha_pk)
);

create table campanha(
	id_campanha varchar(10),
    data_inicio datetime,
    data_fim datetime,
    nome varchar(20),
    qtd_vagas int,
    id_receptora varchar(20),
    constraint campanha_pk primary key (id_campanha),
    constraint campanha_id_receptora foreign key (id_receptora) references instituicao(instituicao_pk)
);

create table atividade_atribuida_pessoa_fisica(
	id_atividade varchar(10),
    id_pessoa_fisica varchar(10),
    constraint atividade_atribuida_pessoa_fisica_pk primary key(id_pessoa_fisica, id_atividade),
    constraint atividade_atribuida_pessoa_fisica_id_atividade foreign key (id_atividade) references atividade(atividade_pk),
    constraint atividade_atribuida_pessoa_fisica_id_pessoa_fisica foreign key (id_pessoa_fisica) references pessoa_fisica(pessoa_fisica_pk)
);

create table voluntario(
    data_inicio datetime,
    data_fim datetime,
    id_voluntario varchar(10),
    constraint voluntario_pk primary key (id_voluntario, data_inicio)
);

create table voluntario_com_veiculo(
    placa_veiculo varchar(8),
    marca_veiculo varchar(10),
    id_voluntario varchar(10),
    constraint voluntario_com_veiculo_pk primary key (id_voluntario, placa_veiculo)
);

create table voluntario_sem_veiculo(
    id_voluntario varchar(10),
    constraint voluntario_sem_veiculo_pk primary key (id_voluntario)
);

create table instituicao_tem_endereco(
    complemento_1 varchar(15),
    complemento_2 varchar(15),
    numero varchar(5),
    id_instituicao varchar(10),
    cep_endereco varchar(8),
    constraint instituicao_tem_endereco_pk primary key (id_instituicao, cep_endereco),
    constraint instituicao_tem_endereco_id_instituicao foreign key (id_instituicao) references instituicao(intituicao_pk),
    constraint instituicao_tem_endereco_cep_endereco foreign key (cep_endereco) references endereco(endereco_pk)
);

create table horario(
    confirmacao_dia boolean,
    hora_inicio datetime,
    periodo_dia enum('MANHÃ', 'TARDE', 'NOITE'),
    num_seq varchar(10),
    hora_fim datetime,
    ind_feriado varhcar(10), -- queria saber o que é isso
    dia_semana enum('SEGUNDA', 'TERÇA', 'QUARTA', 'QUINTA', 'SEXTA', 'SABADO', 'DOMINGO'),
    constraint horario_pk primary key (num_seq)
);

create table voluntario_possui_horario(
    id_voluntario varchar(10),
    horario_num_seq varchar(10),
    constraint voluntario_possui_horario_pk primary key (id_voluntario, horario_num_seq),
    constraint voluntario_possui_horario_id_voluntario_fk foreign key (id_voluntario) references voluntario(voluntario_pk),
    constraint voluntario_possui_horario_num_seq_fk foreign key (horario_num_seq) references horario(horario_pk)
);

create table banco(
    razao_social varchar(10),
    CNPJ varchar(14),
    nome varchar(30),
    codigo_banco varchar(10),
    cep_endereco varchar(8),
    numero varchar(5),
    constraint banco_pk primary key (codigo_banco),
    constraint banco_cep_endereco_fk foreign key (cep_endereco) references endereco(endereco_pk)
);

create table transferencia(
    agencia_destino varchar(10),
    conta_origem varchar(10),
    conta_destino varchar(10),
    agencia_origem varchar(10),
    transferencia_destino_banco varchar(10),
    transferencia_origem_banco varchar(10),
    codigo_transferencia varchar(10),
    constraint transferencia_pk primary key (codigo_transferencia),
    constraint transferencia_origem_banco_fk foreign key (transferencia_origem_banco) references banco(banco_pk),
    constraint transferencia_destino_banco_fk foreign key (transferencia_destino_banco) references banco(banco_pk),
    constraint codigo_transferencia foreign key (codigo_transferencia) references donativo_financeiro(donativo_financeiro_pk)
);

create table cartao(
    cod_seguranca varchar(3),
    validade datetime, 
    bandeira varchar(9),
    numero varchar(20),
    id_transacao varhcar(10),
    constraint cartao_pk primary key 
);