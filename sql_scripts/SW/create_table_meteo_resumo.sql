CREATE TABLE "public".meteo_resumo
(
  codigo_ibge INTEGER
, nome_cidade VARCHAR(300)
, data_completa TIMESTAMP
, temperatura_ar_oc DOUBLE PRECISION
, umidade_rel_ar_percent DOUBLE PRECISION
, FOREIGN KEY (codigo_ibge) REFERENCES municipios (codigo_ibge)
)
;