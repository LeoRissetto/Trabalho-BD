-- 1. Total Investido, Número de Patrocinadores e Nomes dos Patrocinadores por Torneio
SELECT 
    t.nome AS torneio_nome,
    t.data_inicio AS inicio_torneio,
    COUNT(i.patrocinador_cnpj) AS numero_patrocinadores,
    SUM(i.valor_investido) AS total_investido,
    string_agg(DISTINCT p.nome, ', ') AS patrocinadores_nomes
FROM 
    Torneios t
LEFT OUTER JOIN Investe i
ON 
    t.nome = i.torneio_nome AND t.data_inicio = i.torneio_data_inicio
LEFT OUTER JOIN Patrocinadores p
ON 
    i.patrocinador_cnpj = p.cnpj
GROUP BY 
    t.nome, t.data_inicio
ORDER BY 
    t.nome ASC, t.data_inicio DESC;


-- 2. Lista de árbitros com número de partidas apitadas e a última partida apitada
SELECT 
    ar.cpf AS arbitro_cpf,
    ar.nome AS arbitro_nome,
    COALESCE(COUNT(a.arbitro_cpf), 0) AS num_partidas_apitadas,
    COALESCE(MAX(p.data_hora)::text, 'Sem partidas') AS ultima_partida_apitada
FROM 
    Arbitros ar
LEFT OUTER JOIN Apita a
    ON ar.cpf = a.arbitro_cpf
LEFT OUTER JOIN Partidas p
    ON a.partida_id = p.id
GROUP BY 
    ar.cpf, ar.nome
ORDER BY 
    num_partidas_apitadas DESC, ar.nome ASC;

-- 3. Média de idade dos jogadores por esporte
SELECT 
    T.nome_esporte, 
    AVG(EXTRACT(YEAR FROM AGE(J.Data_Nascimento))) AS Media_Idade
FROM 
    Jogadores J
JOIN 
    Joga_Por JP ON J.CPF = JP.Jogador_CPF
JOIN 
    Times T ON JP.Time_Esporte = T.nome_esporte AND JP.Time_Nome = T.Nome
GROUP BY 
    T.nome_esporte
ORDER BY 
    Media_Idade;

-- 4. Locais que receberam mais partidas no torneio "COPA NACIONAL"
SELECT 
    L.Nome AS Local, 
    L.Cidade, 
    L.Estado, 
    COUNT(P.ID) AS Total_Partidas
FROM 
    Locais L
JOIN 
    Partidas P ON L.ID = P.Local_ID
WHERE 
    P.Torneio_Nome = 'COPA NACIONAL'
    AND P.Torneio_Data_Inicio = '2023-03-01'
GROUP BY 
    L.ID, 
    L.Nome, 
    L.Cidade, 
    L.Estado
ORDER BY 
    Total_Partidas DESC;

-- 5. Patrocinadores que investiram em todos os torneios de "BASQUETE"
SELECT 
    P.CNPJ, 
    P.Nome
FROM 
    Patrocinadores P
JOIN 
    Investe I ON P.CNPJ = I.Patrocinador_CNPJ
JOIN 
    Torneios T ON I.Torneio_Nome = T.Nome AND I.Torneio_Data_Inicio = T.Data_Inicio
WHERE 
    T.Esporte_Nome = 'BASQUETE'
GROUP BY 
    P.CNPJ, 
    P.Nome
HAVING 
    COUNT(*) = (
        SELECT COUNT(*)
        FROM Torneios
        WHERE Esporte_Nome = 'BASQUETE'
    );