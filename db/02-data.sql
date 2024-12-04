-- Inserindo dados na tabela Jogador
INSERT INTO Jogador (CPF, Nome, Data_Nascimento, Genero, Altura, Peso) VALUES
('12345678901', 'João Silva', '1990-05-15', 'Masculino', 1.80, 75.5),
('23456789012', 'Maria Oliveira', '1992-08-22', 'Feminino', 1.65, 60.2),
('34567890123', 'Carlos Pereira', '1985-03-10', 'Masculino', 1.75, 80.0);

-- Inserindo dados na tabela Treinador
INSERT INTO Treinador (CPF, Nome, Data_Nascimento, Genero) VALUES
('12312312312', 'Ricardo Souza', '1980-01-25', 'Masculino'),
('23423423423', 'Ana Costa', '1983-06-30', 'Feminino'),
('34534534534', 'José Almeida', '1978-11-14', 'Masculino');

-- Inserindo dados na tabela Árbitro
INSERT INTO Arbitro (CPF, Nome, Data_Nascimento, Genero) VALUES
('45645645645', 'Lucas Martins', '1986-07-10', 'Masculino'),
('56756756756', 'Juliana Ramos', '1990-12-01', 'Feminino'),
('67867867867', 'Felipe Oliveira', '1982-04-17', 'Masculino');

-- Inserindo dados na tabela Narrador
INSERT INTO Narrador (CPF, Nome, Data_Nascimento, Genero) VALUES
('78978978978', 'Gustavo Pereira', '1975-09-13', 'Masculino'),
('89089089089', 'Patrícia Lima', '1989-01-05', 'Feminino'),
('90190190190', 'Carlos Silva', '1981-03-28', 'Masculino');

-- Inserindo dados na tabela Esporte
INSERT INTO Esporte (Nome) VALUES
('Futebol'),
('Basquete'),
('Vôlei');

-- Inserindo dados na tabela Usuário
INSERT INTO Usuario (Email, Senha, Nome, Data_Nascimento) VALUES
('joao.silva@email.com', 'senha123', 'João Silva', '1990-05-15'),
('maria.oliveira@email.com', 'senha123', 'Maria Oliveira', '1992-08-22'),
('carlos.pereira@email.com', 'senha123', 'Carlos Pereira', '1985-03-10');

-- Inserindo dados na tabela Patrocinador
INSERT INTO Patrocinador (CNPJ, Nome) VALUES
('12345678000123', 'Patrocinador A'),
('23456789000123', 'Patrocinador B'),
('34567890000123', 'Patrocinador C');

-- Inserindo dados na tabela Local
INSERT INTO Local (Nome, Rua, Numero, Estado, Cidade, País, Capacidade) VALUES
('Estádio Nacional', 'Rua A', 100, 'SP', 'São Paulo', 'Brasil', 50000),
('Ginásio Municipal', 'Rua B', 150, 'MG', 'Belo Horizonte', 'Brasil', 15000),
('Arena do Futuro', 'Rua C', 200, 'RJ', 'Rio de Janeiro', 'Brasil', 20000);

-- Inserindo dados na tabela Torneio
INSERT INTO Torneio (Nome, Data_Início, Data_Fim, Esporte_Nome) VALUES
('Copa do Mundo', '2026-06-01', '2026-07-01', 'Futebol'),
('NBA Finals', '2025-06-01', '2025-06-15', 'Basquete'),
('Campeonato Brasileiro', '2024-08-10', '2024-12-01', 'Futebol');

-- Inserindo dados na tabela Partida
INSERT INTO Partida (Torneio_Nome, Torneio_Data_Início, Local_Nome, Data_Hora, Resultado) VALUES
('Copa do Mundo', '2026-06-01', 'Estádio Nacional', '2026-06-01 15:00:00', '2-1'),
('NBA Finals', '2025-06-01', 'Ginásio Municipal', '2025-06-01 20:00:00', '104-98'),
('Campeonato Brasileiro', '2024-08-10', 'Arena do Futuro', '2024-08-10 16:00:00', '3-0');

-- Inserindo dados na tabela Time
INSERT INTO Time (Esporte_Nome, Nome, Treinador_CPF) VALUES
('Futebol', 'Time A', '12312312312'),
('Basquete', 'Time B', '23423423423'),
('Vôlei', 'Time C', '34534534534');

-- Inserindo dados na tabela Joga_Por
INSERT INTO Joga_Por (Time_Esporte, Time_Nome, Jogador_CPF) VALUES
('Futebol', 'Time A', '12345678901'),
('Basquete', 'Time B', '23456789012'),
('Vôlei', 'Time C', '34567890123');

-- Inserindo dados na tabela Moderador
INSERT INTO Moderador (Usuário_Email) VALUES
('joao.silva@email.com'),
('maria.oliveira@email.com'),
('carlos.pereira@email.com');

-- Inserindo dados na tabela Permissoes
INSERT INTO Permissoes (Moderador_Usuário, Permissao) VALUES
('joao.silva@email.com', 'admin'),
('maria.oliveira@email.com', 'editor'),
('carlos.pereira@email.com', 'viewer');

-- Inserindo dados na tabela Transmissao
INSERT INTO Transmissao (URL, Data_Hora, Partida_ID) VALUES
('http://example.com/1', '2026-06-01 15:00:00', 1),
('http://example.com/2', '2025-06-01 20:00:00', 2),
('http://example.com/3', '2024-08-10 16:00:00', 3);

-- Inserindo dados na tabela Assistido
INSERT INTO Assistido (Usuário_Email, Transmissão_URL, Data_Hora, Tempo_Assistido) VALUES
('joao.silva@email.com', 'http://example.com/1', '2026-06-01 15:00:00', '1:30:00'),
('maria.oliveira@email.com', 'http://example.com/2', '2025-06-01 20:00:00', '2:00:00'),
('carlos.pereira@email.com', 'http://example.com/3', '2024-08-10 16:00:00', '2:15:00');

-- Inserindo dados na tabela Comenta
INSERT INTO Comenta (Transmissão_URL, Narrador_CPF) VALUES
('http://example.com/1', '78978978978'),
('http://example.com/2', '89089089089'),
('http://example.com/3', '90190190190');

-- Inserindo dados na tabela Investe
INSERT INTO Investe (Patrocinador_CNPJ, Torneio_Nome, Torneio_Data_Início, Valor_Investido) VALUES
('12345678000123', 'Copa do Mundo', '2026-06-01', 1000000.00),
('23456789000123', 'NBA Finals', '2025-06-01', 500000.00),
('34567890000123', 'Campeonato Brasileiro', '2024-08-10', 200000.00);

-- Inserindo dados na tabela Apita
INSERT INTO Apita (Partida_ID, Árbitro_CPF) VALUES
(1, '45645645645'),
(2, '56756756756'),
(3, '67867867867');

-- Inserindo dados na tabela Joga
INSERT INTO Joga (Partida_ID, Time_Esporte, Time_Nome) VALUES
(1, 'Futebol', 'Time A'),
(2, 'Basquete', 'Time B'),
(3, 'Vôlei', 'Time C');