CREATE TABLE public.meteo (
sk_DATA DATE,
Hora_UTC varchar(10),
PRECIPITACAO_TOTAL_mm float,
PRESSAO_ATM_mB float,
PRESSAO_ATM_MAX_HORA_ANT_mB float,
PRESSAO_ATM_MIN_HORA_ANT_mB float,
RADIACAO_GLOBAL_Kj_m2 float,
TEMPERATURA_AR_oC float,
TEMPERATURA_PONTO_ORVALHO_oC float,
TEMPERATURA_MAX_HORA_ANT_oC float,
TEMPERATURA_MIN_HORA_ANT_oC float,
TEMPERATURA_ORVALHO_MAX_HORA_ANT_oC float,
TEMPERATURA_ORVALHO_MIN_HORA_ANT_oC float,
UMIDADE_REL_MAX_HORA_ANT_percent float,
UMIDADE_REL_MIN_HORA_ANT_percent float,
UMIDADE_REL_AR_percent float,
VENTO_DIRECAO_HORARIA_gr float,
VENTO_RAJADA_MAX_m_s float,
VENTO_VELOCIDADE_HORARIA_m_s float,
nome_arquivo varchar(300),
nome_cidade varchar(300),
codigo_ibge INT NOT NULL,
FOREIGN KEY (codigo_ibge) REFERENCES municipios (codigo_ibge)
);

select * from meteo