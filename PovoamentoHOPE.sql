USE HOPE;

#INSERINDO INSTITUIÇÕES

INSERT INTO instituicao (id_doador,CNPJ,ramo_atuacao,razao_social,email,nome_contato,data_entrada,telefone_1,telefone_2,num_doacoes,nome_fantasia,tipo) VALUES ('00000','01234567890000','asilos','IHelp','contato@ihelp.org','AAA','01/01/2017','90000234','98765432',30,'Ihelp','RECEPTORA');
INSERT INTO instituicao (id_doador,CNPJ,ramo_atuacao,razao_social,email,nome_contato,data_entrada,telefone_1,telefone_2,num_doacoes,nome_fantasia,tipo) VALUES ('00001','01234567890011','creches','JoinIT','contato@joinit.org','BBB','02/11/2015','90007864','93725130',15,'JI','RECEPTORA');
INSERT INTO instituicao (id_doador,CNPJ,ramo_atuacao,razao_social,email,nome_contato,data_entrada,telefone_1,telefone_2,num_doacoes,nome_fantasia,tipo) VALUES ('00002','01234567890022','creches','LittleJoy','contato@littlejoy.org','CCC','14/05/2016','90320000','96775839',40,'LT','RECEPTORA');
INSERT INTO instituicao (id_doador,CNPJ,ramo_atuacao,razao_social,email,nome_contato,data_entrada,telefone_1,telefone_2,num_doacoes,nome_fantasia,tipo) VALUES ('00003','01234567890033','asilos','Hang on','contato@hangon.org','DDD','01/08/2014','90024500','99902345',25,'HngON','RECEPTORA');
INSERT INTO instituicao (id_doador,CNPJ,ramo_atuacao,razao_social,email,nome_contato,data_entrada,telefone_1,telefone_2,num_doacoes,nome_fantasia,tipo) VALUES ('00004','01234567890044','hospitais','MakeItHappen','contato@makeithappen.org','EEE','14/08/2012','97560010','96465872',30,'MkIH','DOADORA');
INSERT INTO instituicao (id_doador,CNPJ,ramo_atuacao,razao_social,email,nome_contato,data_entrada,telefone_1,telefone_2,num_doacoes,nome_fantasia,tipo) VALUES ('00005','01234567890055','hospitais','Lovebuilders','contato@lovebuilders.org','FFF','22/09/2010','90005890','95465762',30,'LuvBldrs','DOADORA');
INSERT INTO instituicao (id_doador,CNPJ,ramo_atuacao,razao_social,email,nome_contato,data_entrada,telefone_1,telefone_2,num_doacoes,nome_fantasia,tipo) VALUES ('00006','01234567890066','rua','PeaceonStreets','contato@pconstreets.org','GGG','20/10/2011','82802300','92365442',50,'POS','DOADORA');
INSERT INTO instituicao (id_doador,CNPJ,ramo_atuacao,razao_social,email,nome_contato,data_entrada,telefone_1,telefone_2,num_doacoes,nome_fantasia,tipo) VALUES ('00007','01234567890077','rua','GoodFood','contato@goodfood.org','HHH','28/06/2013','90099900','91265342',70,'GF','DOADORA');

#INSERINDO DOADORES FÍSICOS

INSERT INTO pf_doadora (cod_pf_doadora) VALUES ('1111111110');
INSERT INTO pf_doadora (cod_pf_doadora) VALUES ('1111111111');
INSERT INTO pf_doadora (cod_pf_doadora) VALUES ('1111111112');
INSERT INTO pf_doadora (cod_pf_doadora) VALUES ('1111111113');
INSERT INTO pf_doadora (cod_pf_doadora) VALUES ('1111111114');

#INSERINDO DONATIVOS

INSERT INTO donativo_produto (id_donativo,data_doacao,ja_em_estoque,id_instituicao_doadora,id_pf_doadora) VALUES ('DP00','25/03/2017','SIM','null','1111111110');
INSERT INTO donativo_produto (id_donativo,data_doacao,ja_em_estoque,id_instituicao_doadora,id_pf_doadora) VALUES ('DP01','13/04/2016','SIM','null','1111111113');
INSERT INTO donativo_produto (id_donativo,data_doacao,ja_em_estoque,id_instituicao_doadora,id_pf_doadora) VALUES ('DP02','22/06/2017','NAO','00005','null');
INSERT INTO donativo_produto (id_donativo,data_doacao,ja_em_estoque,id_instituicao_doadora,id_pf_doadora) VALUES ('DP03','08/07/2017','SIM','00004','null');
INSERT INTO donativo_produto (id_donativo,data_doacao,ja_em_estoque,id_instituicao_doadora,id_pf_doadora) VALUES ('DP04','18/08/2017','NAO','null','1111111112');
INSERT INTO donativo_produto (id_donativo,data_doacao,ja_em_estoque,id_instituicao_doadora,id_pf_doadora) VALUES ('DP05','21/10/2015','NAO','null','1111111111');
INSERT INTO donativo_produto (id_donativo,data_doacao,ja_em_estoque,id_instituicao_doadora,id_pf_doadora) VALUES ('DP06','30/01/2017','SIM','00006','null');

#INSERINDO PRODUTO_REF

INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP000','arroz','8249717-1039412','Rampinelli');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP001','camisa','1203988-1713487','null');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP002','colchonete','1027510-0213572','Ortobom');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP003','feijao','9846729-5092732','Turquesa');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP004','refrigerante','3310974-98272812','Sukita');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP005','agasalho','0859272-7326722','null');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP006','sapato','0789567-1239456','nike');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP007','boneca','8345476-2149301','estrela');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP008','bola','8555037-1999414','estrela');
INSERT INTO produto_ref (cod_prod,descricao,cod_barra,marca) VALUES ('CP009','fubá','3339747-1234198','Nutrivita');

#INSERINDO PEDIDOS

INSERT INTO pedido_produto (id_pedido,data_pedido,data_atendimento,status_pedido,id_receptora) VALUES ('PDD00','15/07/2017','20/07/2017','ENTREGUE','00001');
INSERT INTO pedido_produto (id_pedido,data_pedido,data_atendimento,status_pedido,id_receptora) VALUES ('PDD01','03/08/2017','25/08/2017','NÃO ENTREGUE','00003');
INSERT INTO pedido_produto (id_pedido,data_pedido,data_atendimento,status_pedido,id_receptora) VALUES ('PDD02','28/07/2017','04/08/2017','NÃO ENTREGUE','00002');
INSERT INTO pedido_produto (id_pedido,data_pedido,data_atendimento,status_pedido,id_receptora) VALUES ('PDD03','04/08/2017','17/08/2017','NÃO ENTREGUE','00004');

#INSERINDO PRODUTOS PEDIDOS

INSERT INTO item_produto_pedido (data_validade,qte_pedida,num_seq,cod_prod) VALUES ('30/12/2018',20.0,'IP0','CP000');
INSERT INTO item_produto_pedido (data_validade,qte_pedida,num_seq,cod_prod) VALUES ('27/11/2018',40.0,'IP1','CP003');
INSERT INTO item_produto_pedido (data_validade,qte_pedida,num_seq,cod_prod) VALUES ('01/12/2021',10.0,'IP3','CP002');
INSERT INTO item_produto_pedido (data_validade,qte_pedida,num_seq,cod_prod) VALUES ('02/02/2018',25.0,'IP4','CP009');
INSERT INTO item_produto_pedido (data_validade,qte_pedida,num_seq,cod_prod) VALUES ('05/08/2018',15.0,'IP5','CP004');

#INSERINDO PRODUTOS DOADOS

INSERT INTO item_produto_doado (num_seq,data_entrada,data_validade,data_entrada_estoque,qte_doada,cod_prod) VALUES ('E00','20/07/2017','30/12/2018','10/07/2017',20.0,'CP000');

#INSERINDO ADMINISTRADORES

INSERT INTO administrador (CPF,nome,data_nascimento,data_inicio,data_fim) VALUES ('00000000000','Chico','20/04/1985','13/05/2017','null');
INSERT INTO administrador (CPF,nome,data_nascimento,data_inicio,data_fim) VALUES ('00000000012','João','02/06/1980','01/02/2015','10/04/2017');
INSERT INTO administrador (CPF,nome,data_nascimento,data_inicio,data_fim) VALUES ('00000000034','José','15/03/1994','31/05/2013','10/01/2015');

#INSERINDO ESTOQUE

INSERT INTO estoque (codigo,descricao,data_ultima_entrada,cod_administrador) VALUES (ESTK00,'ESTOQUE 1','04/08/2017','00000000000');

#INSERINDO PRODUTOS_ESTOQUE

INSERT INTO item_produto_estoque () VALUES ();

#INSERINDO ENTREGA

INSERT INTO entrega () VALUES ();

#INSERINDO DOADORA

INSERT INTO doadora () VALUES ();

#INSERINDO RECEPTORA


#INSERINDO ITENS_ENTREGA

#INSERINDO ENDERECO

INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0000','Rua A','Boa Vista','Recife','Pernambuco','57192-120','casa');
INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0001','Rua B','Bongi','Recife','Pernambuco','31235-112','casa');
INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0002','Rua C','Rosarinho','Recife','Pernambuco','12410-437','Codomínio');
INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0003','Rua D','Bomba do Hemeterio','Recife','Pernambuco','43345-542','casa');
INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0004','Rua E','Dois Irmãos','Recife','Pernambuco','52171-900','casa');
INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0005','Rua F','Apipucos','Recife','Pernambuco','93843-000','casa');
INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0006','Rua G','Jd Brasil','Olinda','Pernambuco','56750-123','casa');
INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0007','Rua H','Peixinhos','Olinda','Pernambuco','43596-478','casa');
INSERT INTO endereco (num_seq,nome,bairro,cidade,estado,CEP,tipo_logradouro) VALUES ('END0008','Rua I','Jd Atlantico','Olinda','Pernambuco','92834-520','Condomínio');

#INSERINDO PESSOA_FISICA

#INSERINDO CATEGORIA_PRODUTO

#INSERINDO LOCALIZAÇÃO_CATEGORIA

#INSERINDO ATIVIDADE

#INSERINDO CAMPANHA

#INSERINDO ATIVIDADE_PF

#INSERINDO VOLUNTARIO

#INSERINDO VOLUNTÁRIO_VEICULO

#INSERINDO VOLUNTÁRIO_SEM_VEICULO

#INSERINDO ENDERECO_INSTITUIÇÃO 

#INSERINDO HORARIO

#INSERINDO HORARIO_VOLUNTARIO

#INSERINDO BANCOS

#INSERINDO TRANSFERENCIAS

#INSERINDO CARTÕES

#INSERINDO DONATIVOS_FINANCEIROS

#INSERINDO COMPROVANTES_DOAÇÃO 

#INSERINDO DOC_PROTOCOLOS