CREATE TABLE public.monitoramento (
				pk_monitor SERIAL PRIMARY KEY,
                fk_usuario INTEGER NOT NULL,
                fk_ambiente INTEGER NOT NULL,
                temperatura REAL NOT NULL,
                umidade REAL NOT NULL,
                arcond BOOLEAN NOT NULL,
                data_registro TIMESTAMP NOT NULL,
				FOREIGN KEY (fk_usuario)REFERENCES usuario(codusuario),
				FOREIGN KEY (fk_ambiente)REFERENCES ambiente(codamb)
);