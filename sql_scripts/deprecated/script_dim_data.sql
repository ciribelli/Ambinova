CREATE TABLE dim_data (
    sk_data SERIAL PRIMARY KEY,
    nk_data TIMESTAMP NOT NULL,
    hora INTEGER NOT NULL,
    dia INTEGER NOT NULL,
    mes INTEGER NOT NULL,
    ano INTEGER NOT NULL,
    dia_semana INTEGER NOT NULL,
    feriado BOOLEAN NOT NULL,
    etl_dt_inicio TIMESTAMP NOT NULL,
    etl_dt_fim TIMESTAMP NOT NULL,
    etl_versao TEXT NOT NULL
);

-- Populando a tabela com dados de tempo
INSERT INTO dim_data (nk_data, hora, dia, mes, ano, dia_semana, feriado, etl_dt_inicio, etl_dt_fim, etl_versao)
SELECT 
    data,
    EXTRACT(hour FROM data),
    EXTRACT(day FROM data),
    EXTRACT(month FROM data),
    EXTRACT(year FROM data),
    EXTRACT(dow FROM data),
    FALSE,
    '2018-01-01',
    '2027-12-31',
    '1'
FROM (
    SELECT generate_series('2020-01-01 01:00:00'::timestamp, '2021-12-31 23:00:00', '1 hour'::interval) AS data
) as horas;

-- Índice na coluna nk_data para melhor performance em joins
CREATE INDEX dim_data_nk_data_idx ON dim_data (nk_data);
