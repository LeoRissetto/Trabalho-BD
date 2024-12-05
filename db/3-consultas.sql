-- Quantidade de jogadores por time
SELECT JP.Time_Esporte, JP.Time_Nome, COUNT(JP.Jogador_CPF) AS Total_Jogadores
FROM Joga_Por JP
GROUP BY JP.Time_Esporte, JP.Time_Nome
ORDER BY Total_Jogadores DESC;

-- Jogadores que participaram de partidas no local "Estádio Nacional"
SELECT DISTINCT J.CPF, J.Nome, L.Nome AS Local
FROM Jogador J
JOIN Joga_Por JP ON J.CPF = JP.Jogador_CPF
JOIN Joga JO ON JP.Time_Esporte = JO.Time_Esporte AND JP.Time_Nome = JO.Time_Nome
JOIN Partida P ON JO.Partida_ID = P.ID
JOIN Local L ON P.Local_ID = L.ID
WHERE L.Nome = 'Estádio Nacional';

-- Média de idade dos jogadores por esporte
SELECT T.Esporte_Nome, AVG(EXTRACT(YEAR FROM AGE(J.Data_Nascimento))) AS Media_Idade
FROM Jogador J
JOIN Joga_Por JP ON J.CPF = JP.Jogador_CPF
JOIN Time T ON JP.Time_Esporte = T.Esporte_Nome AND JP.Time_Nome = T.Nome
GROUP BY T.Esporte_Nome
ORDER BY Media_Idade;

-- Locais que receberam mais partidas no torneio "Copa Brasil"
SELECT L.Nome AS Local, L.Cidade, L.Estado, COUNT(P.ID) AS Total_Partidas
FROM Local L
JOIN Partida P ON L.ID = P.Local_ID
WHERE P.Torneio_Nome = 'Copa Brasil'
  AND P.Torneio_Data_Início = '2024-03-01' -- Data de início do torneio
GROUP BY L.ID, L.Nome, L.Cidade, L.Estado
ORDER BY Total_Partidas DESC;


-- Patrocinadores que investiram em todos os torneios de "Basquete"
SELECT P.CNPJ, P.Nome
FROM Patrocinador P
WHERE NOT EXISTS (
    SELECT T.Nome, T.Data_Início
    FROM Torneio T
    WHERE T.Esporte_Nome = 'Basquete'
    AND NOT EXISTS (
        SELECT I.Patrocinador_CNPJ
        FROM Investe I
        WHERE I.Patrocinador_CNPJ = P.CNPJ
        AND I.Torneio_Nome = T.Nome
        AND I.Torneio_Data_Início = T.Data_Início
    )
);



