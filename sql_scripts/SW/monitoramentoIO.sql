CREATE TABLE public.monitoramentoIO (
				pk_monitor SERIAL PRIMARY KEY,
                fk_usuario INTEGER NOT NULL,
                fk_ambiente INTEGER NOT NULL,
                temperatura_in REAL,
                umidade_in REAL,
                temperatura_out REAL,
                umidade_out REAL,
                arcond BOOLEAN NOT NULL,
                data_registro TIMESTAMP NOT NULL,
				FOREIGN KEY (fk_usuario)REFERENCES usuario(codusuario),
				FOREIGN KEY (fk_ambiente)REFERENCES ambiente(codamb)
);