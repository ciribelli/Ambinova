CREATE TABLE public.usuario (
                codusuario INTEGER PRIMARY KEY,
                nome VARCHAR(50) NOT NULL,
                email VARCHAR(50) NOT NULL,
                codigo_ibge INT NOT NULL,
                FOREIGN KEY (codigo_ibge) REFERENCES municipios (codigo_ibge)
);

CREATE TABLE public.ambiente (
                codamb INTEGER PRIMARY KEY,
                nomeamb VARCHAR(50) NOT NULL
);

CREATE TABLE public.monitoramento (
				pk_monitor SERIAL,
                fk_usuario INTEGER NOT NULL,
                fk_ambiente INTEGER NOT NULL,
                dataregistro TIMESTAMP NOT NULL,
                temperatura REAL NOT NULL,
                umidade REAL NOT NULL,
                arcond BOOLEAN NOT NULL,
				FOREIGN KEY (fk_usuario)REFERENCES usuario(codusuario),
				FOREIGN KEY (fk_ambiente)REFERENCES ambiente(codamb),
                PRIMARY KEY (pk_monitor, fk_usuario)
);


