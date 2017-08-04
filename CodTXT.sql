drop database HOPE;
-- Tentar colocar as primary keys nas constraints como nome_da_tabela_pk
-- e as foreign key como nome_da_tabela_nome_atributo_fk
-- Porque assim fica padrão e mais fácil de pegar de outras tabelas.

create database HOPE;
use HOPE;

-- AQUI SÃO AS TABELAS QUE SÓ POSSUEM PK
create table instituicao(
	id_doador varchar(5) not null unique,
    CNPJ varchar(14) not null unique,
    ramo_atuacao varchar(10),
    razao_social varchar(10),
    email varchar(20) not null,
    nome_contato varchar(40),
    data_entrada datetime not null,
    telefone_1 varchar(10)not null,
    telefone_2 varchar(10),
    num_doacoes int,
    nome_fantasia varchar(20),
    tipo enum('DOADORA', 'RECEPTORA') not null,
    constraint intituicao_pk primary key (id_doador, CNPJ)
);

create table produto_ref(
	cod_prod varchar (10) not null unique,
    descricao varchar(140) not null,
    cod_barra varchar(30) not null,
    marca varchar(10),
    constraint produto_ref_pk primary key (cod_prod)
);

create table administrador(
	data_inicio datetime not null,
    nome varchar(20) not null,
    data_fim datetime not null,
    CPF varchar(11) not null unique,
    data_nascimento datetime,
    constraint administrador_pk primary key (CPF, data_inicio)
);

create table endereco(
	CEP varchar(8) not null,
    bairro varchar(15) not null,
    cidade varchar(10) not null,
    tipo_logradouro varchar(12) not null,
    nome varchar(10) not null,
    num_seq varchar(10) not null unique,
    estado varchar(15) not null,
    constraint endereco_pk primary key (num_seq)
);

create table categoria_produto(
	id_categoria_produto varchar(10) not null unique,
    obs_categoria_produto varchar(140),
    descricao_categoria_produto varchar(200) not null,
    caracteristicas_categoria_produto varchar(100) not null,
    constraint categoria_produto_pk primary key (id_categoria_produto)
);

create table voluntario(
    data_inicio datetime not null,
    data_fim datetime not null,
    id_voluntario varchar(10) not null unique,
    constraint voluntario_pk primary key (id_voluntario, data_inicio)
);

create table voluntario_sem_veiculo(
    id_voluntario varchar(10) not null,
    constraint voluntario_sem_veiculo_pk primary key (id_voluntario)
);

create table horario(
    confirmacao_dia boolean not null,
    hora_inicio datetime not null,
    periodo_dia enum('MANHÃ', 'TARDE', 'NOITE') not null,
    num_seq varchar(10) not null unique,
    hora_fim datetime not null,
    ind_feriado varchar(10) not null, -- queria saber o que é isso
    dia_semana enum('SEGUNDA', 'TERÇA', 'QUARTA', 'QUINTA', 'SEXTA', 'SABADO', 'DOMINGO') not null,
    constraint horario_pk primary key (num_seq)
);

create table comprovante_doacao(
	num_doc varchar(10) not null unique,
    descricao varchar(30) not null,
    arquivo_doc varchar(10) not null,
    constraint comprovante_doacao_pk primary key (num_doc)
);

create table doc_protocolo(
	num_protocolo varchar(10) not null unique,
    arquivo varchar(10) not null,
    descricao varchar(30) not null,
    constraint doc_protocolo_pk primary key (num_protocolo)

);
-- AQUI SÃO AS TABELAS QUE POSSUEM FK E PK
create table donativo_produto(
	id_donativo varchar(10) not null,
    data_doacao datetime not null,
    ja_em_estoque boolean not null,
    id_instituicao_doadora varchar(19) not null,
    id_pf_doadora varchar(10) not null,
    constraint donativo_produto_pk primary key(id_donativo),
    constraint donativo_produto_id_instituaicao_doadora_fk foreign key (id_instituicao_doadora) references instituicao(instituicao_pk),
    constraint donativo_produto_id_pf_doadora_fk foreign key (id_pf_doadora) references pf_doadora(pf_doadora_pk)
);

create table pedido_produto(
	id_pedido varchar(10)not null unique,
    data_pedido datetime not null, 
    data_atendimento datetime not null,
    status_pedido enum('ENTREGUE', 'NÃO ENTREGUE') not null,
    id_receptora varchar(19) not null,
    constraint pedido_produto_pk primary key (id_pedido),
    constraint pedido_produto_id_receptora_fk foreign key (id_receptora) references instituicao(instituicao_pk)
);

create table item_produto_pedido(
	data_validade datetime,
    qte_pedida double,
    num_seq varchar(5) not null unique,
    cod_prod varchar(10) not null,
    constraint item_produto_pedido_pk primary key (cod_prod, num_seq),
    constraint item_produto_pedido_cod_prod_fk foreign key (cod_prod) references produto_ref(produto_ref_pk)
);

create table item_produto_doado(
	num_seq varchar(5) not null unique,
    data_entrada datetime not null,
    data_validade datetime not null,
    data_entrada_estoque datetime not null,
    qte_doada double not null,
    cod_prod varchar(19) not null,
    constraint item_produto_doado_pk primary key (cod_prod, num_seq),
    constraint item_produto_doado_cod_prod_fk foreign key (cod_prod) references produto_ref(produto_ref_pk)
);

create table estoque(
	codigo varchar(10) not null unique,
    descricao varchar(140) not null,
    data_ultima_entrada datetime not null,
    cod_administrador varchar(20) not null,
    constraint estoque_pk primary key (codigo),
    constraint estoque_administrador_fk foreign key (cod_administrador) references administrdor(administrador_pk)
);

create table item_prod_estoque(
	qte_minima double not null, 
    data_entrada datetime not null,
    data_validade datetime not null,
    qte_atual double not null,
    num_seq varchar(5) not null unique,
    cod_prod varchar(10) not null,
    cod_estoque varchar(10) not null,
    constraint item_prod_estoque_pk primary key (cod_prod, num_seq),
    constraint item_prod_estoque_cod_prod_fk foreign key (cod_prod) references produto_ref(produto_ref_pk),
    constraint item_prod_estoque_cod_estoque_fk foreign key(cod_estoque) references estoque(estoque_pk)
);

create table entrega(
	id_entrega varchar(10) not null unique,
    data_entrega datetime not null, 
    status_entrega enum('ENTREGUE', 'NÃO ENTREGUE') not null,
    hora_agendada time not null,
    data_agendada datetime not null,
    obs varchar(140),
    id_voluntario varchar(10) not null,
    constraint entrega_pk primary key (id_entrega),
    constraint entrega_id_voluntario foreign key (id_voluntario) references voluntario_com_veiculo(voluntario_com_veiculo_pk)
);

create table pessoa_fisica(
	CPF varchar(11) not null,
    primeiro_nome varchar(10) not null,
    meio_nome varchar(10),
    ultimo_nome varchar(10) not null,
    anonimato boolean,
    data_nasc datetime,
    cep_endereco varchar(8) not null,
    constraint pessoa_fisica_pk primary key (CPF),
    constraint pessoa_fisica_endereco_fk foreign key (cep_endereco) references endereco(endereco_pk)    
);

create table categoria_secundaria(
	id_categoria varchar(10),
    id_subcategoria varchar(5),
    descricao varchar(200),
    caracteristicas varchar(140), -- Não vou colocar multivalorado pra não ter que criar outra tabela. Não precisa
    constraint categoria_secuntaria_pk primary key(id_categoria, id_subcategoria),
    constraint categoria_secundaria_id_categoria_fk foreign key (id_categoria) references categoria_produto(categoria_produto_pk)
);

create table produto_ref_esta_em_categoria_produto(
	cod_produto_ref varchar(10) not null,
    id_categoria_produto varchar(10) not null,
    constraint produto_ref_esta_em_categoria_produto_pk primary key (cod_produto_ref, id_categoria_produto),
    constraint cod_produto_ref_fk foreign key (cod_produto_ref) references produto_ref(produto_ref_pk),
    constraint id_categoria_produto_fk foreign key (id_categoria_produto) references categoria_prod(categoria_prod_pk)
);

create table atividade(
	id_atividade varchar(10) not null unique,
    descricao varchar(100) not null,
    tipo varchar(20) not null,
    duracao_media varchar(10) not null,
    id_campanha varchar(10) not null,
    constraint atividade_pk primary key (id_atividade),
    constraint atividade_id_campanha_fk foreign key (id_campanha) references campanha(campanha_pk)
);

create table campanha(
	id_campanha varchar(10) not null unique,
    data_inicio datetime not null,
    data_fim datetime not null,
    nome varchar(20) not null,
    qtd_vagas int not null,
    id_receptora varchar(20) not null,
    constraint campanha_pk primary key (id_campanha),
    constraint campanha_id_receptora foreign key (id_receptora) references instituicao(instituicao_pk)
);

create table atividade_atribuida_pessoa_fisica(
	id_atividade varchar(10) not null,
    id_pessoa_fisica varchar(10) not null,
    constraint atividade_atribuida_pessoa_fisica_pk primary key(id_pessoa_fisica, id_atividade),
    constraint atividade_atribuida_pessoa_fisica_id_atividade foreign key (id_atividade) references atividade(atividade_pk),
    constraint atividade_atribuida_pessoa_fisica_id_pessoa_fisica foreign key (id_pessoa_fisica) references pessoa_fisica(pessoa_fisica_pk)
);

create table voluntario_com_veiculo(
    placa_veiculo varchar(8) not null,
    marca_veiculo varchar(10) not null,
    id_voluntario varchar(10) not null,
    constraint voluntario_com_veiculo_pk primary key (id_voluntario, placa_veiculo),
    constraint voluntario_com_veiculo_id_voluntario_fk foreign key (id_voluntario) references voluntario(voluntario_pk)
);
create table instituicao_tem_endereco(
    complemento_1 varchar(15) not null,
    complemento_2 varchar(15) not null,
    numero varchar(5) not null,
    id_instituicao varchar(10) not null,
    cep_endereco varchar(8) not null,
    constraint instituicao_tem_endereco_pk primary key (id_instituicao, cep_endereco),
    constraint instituicao_tem_endereco_id_instituicao foreign key (id_instituicao) references instituicao(intituicao_pk),
    constraint instituicao_tem_endereco_cep_endereco foreign key (cep_endereco) references endereco(endereco_pk)
);

create table voluntario_possui_horario(
    id_voluntario varchar(10) not null,
    horario_num_seq varchar(10) not null,
    constraint voluntario_possui_horario_pk primary key (id_voluntario, horario_num_seq),
    constraint voluntario_possui_horario_id_voluntario_fk foreign key (id_voluntario) references voluntario(voluntario_pk),
    constraint voluntario_possui_horario_num_seq_fk foreign key (horario_num_seq) references horario(horario_pk)
);

create table banco(
    razao_social varchar(10) not null,
    CNPJ varchar(14) not null unique,
    nome varchar(30) not null,
    codigo_banco varchar(10) not null,
    cep_endereco varchar(8) not null,
    numero varchar(5) not null,
    constraint banco_pk primary key (codigo_banco),
    constraint banco_cep_endereco_fk foreign key (cep_endereco) references endereco(endereco_pk)
);

create table transferencia(
    agencia_destino varchar(10) not null,
    conta_origem varchar(10) not null,
    conta_destino varchar(10) not null,
    agencia_origem varchar(10) not null,
    transferencia_destino_banco varchar(10) not null,
    transferencia_origem_banco varchar(10) not null,
    codigo_transferencia varchar(10) not null,
    constraint transferencia_pk primary key (codigo_transferencia),
    constraint transferencia_origem_banco_fk foreign key (transferencia_origem_banco) references banco(banco_pk),
    constraint transferencia_destino_banco_fk foreign key (transferencia_destino_banco) references banco(banco_pk),
    constraint codigo_transferencia foreign key (codigo_transferencia) references donativo_financeiro(donativo_financeiro_pk)
);


-- AQUI SÃO AS TABELAS QUE POSSUEM FK E NÃO TEM PK

create table receptora(
	data_ultima_recepcao datetime not null,
    cod_entrega varchar(10)not null,
    constraint receptora_cod_entrega_fk foreign key (cod_entrega) references entrega(entrega_pk)
);

create table item_produto_entrega(
	num_seq varchar(10) not null unique,
    qte_entregue double not null,
    cod_entrega varchar(10) not null,
    cod_produto varchar(10) not null,
    constraint item_produto_entrega_cod_entrega_fk foreign key (cod_entrega) references entrega(entrega_pk),
    constraint item_produto_entrega_cod_produto_fk foreign key (cod_produto) references produto_ref(cod_produto_pk)
);

create table pf_doadora(
	cod_pf_doadora varchar(10) not null,
    constraint pf_doadora_fk foreign key (cod_pf_doadora) references pessoa_fisica(pessoa_fisica_pk)
);

create table donativo_financeiro(
    id_financeiro varchar(4) not null,
    data_doacao datetime not null,
    id_instituicao_doadora varchar(10) not null,
    tipo_doacao enum('CARTAO', 'TRANSFERENCIA'),
    constraint id_instituicao_doadora_fk foreign key (id_instituicao_doadora) references instituicao(instituicao_pk)
);
-- AQUI SÃO AS TABELAS QUE NÃO POSSUEM PK E FK. MUITO ESTRANHO, MAS VAMO

create table doadora(
	data_ultima_doacao datetime not null
);

-- Aqui falta colocar a pk, que eu não sei qual que é. Nem as fk. Tá muito estranho isso aqui
create table cartao(
    cod_seguranca varchar(3) not null,
    validade datetime not null, 
    bandeira varchar(9) not null,
    numero varchar(20) not null unique,
    id_transacao varchar(10)
);


-- Isso aqui é aleatório, que eu não entendi o motivo de ter no projeto, mas mandaram colocar, então tô colocando.
create table calendario(
	num_seq varchar(10) not null unique,
    data_d datetime not null,
    fim_de_semana datetime not null,
    feriado datetime not null,
    todo_list varchar(500),
    lembrete_do_dia varchar(200),
    observacao varchar(200),
    constraint calendario_pk primary key (num_seq)
);




