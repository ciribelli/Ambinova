---dim_estados
INSERT INTO public.dim_estados (sk_codigo_uf, nk_codigo_uf, uf, nome, latitude, longitude, regiao, etl_dt_inicio, etl_dt_fim, etl_versao)
VALUES (0, 0, 'NA', 'N/A', 0, 0, 'N/A', '1900-01-01', '2199-12-31', 0);

INSERT INTO public.dim_ambiente (sk_ambiente, nk_codamb, nomeamb, etl_dt_inicio, etl_dt_fim, etl_versao)
VALUES (0, 0, 'N/A', '1900-01-01', '2199-12-31', 0);

INSERT INTO public.dim_usuario (sk_usuario, nk_usuario, nome, email, codigo_ibge, etl_dt_inicio, etl_dt_fim, etl_versao)
VALUES (0, 0, 'N/A', 'N/A', 0, '1900-01-01', '2199-12-31', 0);

INSERT INTO public.dim_municipios (sk_municipios, nk_codigo_ibge, nome, latitude, longitude, capital, codigo_uf, siafi_id, ddd, fuso_horario, etl_dt_inicio, etl_dt_fim, etl_versao, sk_codigo_uf)
VALUES (0, 0, 'N/A', 0, 0, FALSE, 0, 'N/A', 0, 'N/A', '1900-01-01', '2199-12-31', 0, 0);
