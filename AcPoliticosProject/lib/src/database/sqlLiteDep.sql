CREATE TABLE 'uf' (
	'id_uf' TINYINT NOT NULL,
	'sigla' VARCHAR(4),
	'nome_uf' VARCHAR(50),
	PRIMARY KEY ('id_uf') 
); 

CREATE TABLE 'partido' (
	'id_partido' TINYINT NOT NULL,
	'sigla' VARCHAR(10),
	'nome_partido' VARCHAR(100),
	'uri_partido' VARCHAR(200),
	'id_legislatura' TINYINT NOT NULL,
	PRIMARY KEY ('id_partido')
);
CREATE TABLE 'deputado' (
	'id_dep' TINYINT NOT NULL,
	'sigla_partido' VARCHAR(10),
	'nome_dep' VARCHAR(100),
	'uri_dep' VARCHAR(200),
	'sigla_uf' INT(5),
	'id_legislatura' TINYINT,
	'url_foto' VARCHAR(200),
	'email' VARCHAR(200),
	PRIMARY KEY ('id_dep') 
);

CREATE TABLE 'legislatura' (
	'id_legis' TINYINT NOT NULL,
	'uri_legis' VARCHAR(200),
	'data_inicio' VARCHAR(30),
	'data_fim' VARCHAR(30),
	PRIMARY KEY ('id_legis')
);

CREATE TABLE 'legis_dep' (
	'id_legis' TINYINT NOT NULL,
	'id_dep' VARCHAR(200),
	PRIMARY KEY ('id_legis','id_dep')
);