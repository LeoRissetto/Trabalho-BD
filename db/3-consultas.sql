-- 1. Mostrar todos os torneios e, caso haja, os patrocinadores que investiram neles
SELECT 
    t.nome AS torneio_nome,
    t.data_inicio AS inicio_torneio,
    i.patrocinador_cnpj AS patrocinador,
    i.valor_investido AS valor
FROM 
    Torneios t
LEFT OUTER JOIN 
    Investe i ON t.nome = i.torneio_nome AND t.data_inicio = i.torneio_data_inicio
ORDER BY 
    t.nome, t.data_inicio;

-- 2. Jogadores que participaram de partidas no local "ESTÁDIO NACIONAL"
SELECT DISTINCT 
    J.CPF, 
    J.Nome, 
    L.Nome AS Local
FROM 
    Jogadores J
JOIN 
    Joga_Por JP ON J.CPF = JP.Jogador_CPF
JOIN 
    Joga JO ON JP.Time_Esporte = JO.Time_Esporte AND JP.Time_Nome = JO.Time_Nome
JOIN 
    Partidas P ON JO.Partida_ID = P.ID
JOIN 
    Locais L ON P.Local_ID = L.ID
WHERE 
    L.Nome = 'ESTÁDIO NACIONAL';

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