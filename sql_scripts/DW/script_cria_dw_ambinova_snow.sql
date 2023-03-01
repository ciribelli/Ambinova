
CREATE TABLE public.dim_estados (
                sk_codigo_uf INTEGER NOT NULL,
                nk_codigo_uf INTEGER NOT NULL,
                uf VARCHAR(2) NOT NULL,
                nome VARCHAR(100) NOT NULL,
                latitude REAL NOT NULL,
                longitude REAL NOT NULL,
                regiao VARCHAR(12) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_codigo_uf PRIMARY KEY (sk_codigo_uf)
);


CREATE TABLE public.dim_municipios (
                sk_municipios INTEGER NOT NULL,
                nk_codigo_ibge INTEGER NOT NULL,
                nome VARCHAR(100) NOT NULL,
                latitude REAL NOT NULL,
                longitude REAL NOT NULL,
                capital BOOLEAN NOT NULL,
                codigo_uf INTEGER NOT NULL,
                siafi_id VARCHAR(4) NOT NULL,
                ddd INTEGER NOT NULL,
                fuso_horario VARCHAR(32) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                sk_codigo_uf INTEGER NOT NULL,
                CONSTRAINT sk_municipios PRIMARY KEY (sk_municipios)
);


CREATE TABLE public.dim_ambiente (
                sk_ambiente INTEGER NOT NULL,
                nk_codamb INTEGER NOT NULL,
                nomeamb VARCHAR(50) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT dim_ambiente_pk PRIMARY KEY (sk_ambiente)
);


CREATE TABLE public.dim_usuario (
                sk_usuario INTEGER NOT NULL,
                nk_usuario INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                email VARCHAR(50) NOT NULL,
                codigo_ibge INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_usuario PRIMARY KEY (sk_usuario)
);


CREATE TABLE public.ft_monitoramento (
                sk_ambiente INTEGER NOT NULL,
                sk_usuario INTEGER NOT NULL,
                sk_municipios INTEGER NOT NULL,
                sk_data INTEGER DEFAULT nextval('dim_data_sk_data_seq'::regclass) NOT NULL,
                temperatura_in REAL,
                umidade_in REAL,
                temperatura_out REAL,
                umidade_out REAL,
                arcond BOOLEAN
);


ALTER TABLE public.dim_municipios ADD CONSTRAINT dim_estados_dim_municipios_fk
FOREIGN KEY (sk_codigo_uf)
REFERENCES public.dim_estados (sk_codigo_uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_monitoramento ADD CONSTRAINT dim_municipios_ft_monitoramento_fk
FOREIGN KEY (sk_municipios)
REFERENCES public.dim_municipios (sk_municipios)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_monitoramento ADD CONSTRAINT dim_ambiente_ft_monitoramento_fk
FOREIGN KEY (sk_ambiente)
REFERENCES public.dim_ambiente (sk_ambiente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_monitoramento ADD CONSTRAINT dim_usuario_ft_monitoramento_fk
FOREIGN KEY (sk_usuario)
REFERENCES public.dim_usuario (sk_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;