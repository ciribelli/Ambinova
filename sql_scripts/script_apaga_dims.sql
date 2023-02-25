-- Desabilita as chaves estrangeiras
ALTER TABLE public.ft_monitoramento DISABLE TRIGGER ALL;

-- Apaga a tabela ft_monitoramento
DROP TABLE IF EXISTS public.ft_monitoramento;

-- Apaga a tabela dim_municipios e suas dependências
DROP TABLE IF EXISTS public.dim_municipios CASCADE;

-- Apaga a tabela dim_estados e suas dependências
DROP TABLE IF EXISTS public.dim_estados CASCADE;

-- Apaga a tabela dim_usuario e suas dependências
DROP TABLE IF EXISTS public.dim_usuario CASCADE;

-- Apaga a tabela dim_ambiente e suas dependências
DROP TABLE IF EXISTS public.dim_ambiente CASCADE;

-- Apaga a tabela dim_ambiente e suas dependências
DROP TABLE IF EXISTS public.dim_data CASCADE;
