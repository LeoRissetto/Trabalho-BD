-- Inserindo dados na tabela Jogador
INSERT INTO Jogador (CPF, Nome, Data_Nascimento, Genero, Altura, Peso) VALUES
('12345678901', 'João Silva', '1995-05-12', 'Masculino', 1.80, 75.0),
('98765432109', 'Ana Oliveira', '1997-03-22', 'Feminino', 1.70, 60.0),
('56789012345', 'Carlos Lima', '1990-08-15', 'Masculino', 1.85, 82.5);

-- Inserindo dados na tabela Treinador
INSERT INTO Treinador (CPF, Nome, Data_Nascimento, Genero) VALUES
('11111111111', 'Roberto Costa', '1980-11-05', 'Masculino'),
('22222222222', 'Mariana Souza', '1985-07-19', 'Feminino'),
('33333333333', 'Pedro Gonçalves', '1978-03-01', 'Masculino');

-- Inserindo dados na tabela Árbitro
INSERT INTO Arbitro (CPF, Nome, Data_Nascimento, Genero) VALUES
('44444444444', 'Rafael Santos', '1992-02-14', 'Masculino'),
('55555555555', 'Luciana Almeida', '1988-06-30', 'Feminino'),
('66666666666', 'Paulo Henrique', '1985-09-18', 'Masculino');

-- Inserindo dados na tabela Narrador
INSERT INTO Narrador (CPF, Nome, Data_Nascimento, Genero) VALUES
('77777777777', 'Ricardo Bastos', '1980-04-10', 'Masculino'),
('88888888888', 'Carla Mendes', '1990-12-25', 'Feminino'),
('99999999999', 'Fernanda Ribeiro', '1983-03-12', 'Feminino');

-- Inserindo dados na tabela Esporte
INSERT INTO Esporte (Nome) VALUES
('Futebol'),
('Basquete'),
('Vôlei');

-- Inserindo dados na tabela Usuário
INSERT INTO Usuario (Email, Senha, Nome, Data_Nascimento) VALUES
('joao@gmail.com', 'senha123', 'João Santos', '1998-04-18'),
('ana@hotmail.com', 'senha456', 'Ana Carvalho', '2000-01-10'),
('carlos@yahoo.com', 'senha789', 'Carlos Souza', '1995-07-22');

-- Inserindo dados na tabela Patrocinador
INSERT INTO Patrocinador (CNPJ, Nome) VALUES
('12345678000123', 'Nike'),
('98765432000198', 'Adidas'),
('56789012000156', 'Puma');

-- Inserindo dados na tabela Local
INSERT INTO Local (Nome, Rua, Numero, Estado, Cidade, País, Capacidade) VALUES
('Estádio Nacional', 'Avenida Central', 123, 'São Paulo', 'São Paulo', 'Brasil', 50000),
('Ginásio Olímpico', 'Rua das Palmeiras', 45, 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 20000),
('Arena Esportiva', 'Avenida Atlântica', 678, 'Minas Gerais', 'Belo Horizonte', 'Brasil', 30000);

-- Inserindo dados na tabela Torneio
INSERT INTO Torneio (Nome, Data_Início, Data_Fim, Esporte_Nome) VALUES
('Copa Brasil', '2024-03-01', '2024-03-30', 'Futebol'),
('Campeonato Nacional', '2024-04-01', '2024-04-20', 'Basquete'),
('Liga de Vôlei', '2024-05-01', '2024-05-15', 'Vôlei');

-- Inserindo dados na tabela Partida
INSERT INTO Partida (Torneio_Nome, Torneio_Data_Início, Local_ID, Data_Hora, Resultado) VALUES
('Copa Brasil', '2024-03-01', 1, '2024-03-05 16:00:00', '3x1'),
('Campeonato Nacional', '2024-04-01', 2, '2024-04-10 18:00:00', '85x78'),
('Liga de Vôlei', '2024-05-01', 3, '2024-05-12 15:00:00', '2x3');

-- Inserindo dados na tabela Time
INSERT INTO Time (Esporte_Nome, Nome, Treinador_CPF) VALUES
('Futebol', 'Time A', '11111111111'),
('Basquete', 'Time B', '22222222222'),
('Vôlei', 'Time C', '33333333333');

-- Inserindo dados na tabela Joga_Por
INSERT INTO Joga_Por (Time_Esporte, Time_Nome, Jogador_CPF) VALUES
('Futebol', 'Time A', '12345678901'),
('Basquete', 'Time B', '98765432109'),
('Vôlei', 'Time C', '56789012345');

-- Inserindo dados na tabela Moderador
INSERT INTO Moderador (Usuário_Email) VALUES
('joao@gmail.com'),
('ana@hotmail.com'),
('carlos@yahoo.com');

-- Inserindo dados na tabela Permissões
INSERT INTO Permissoes (Moderador_Usuário, Permissao) VALUES
('joao@gmail.com', 'Editar'),
('ana@hotmail.com', 'Excluir'),
('carlos@yahoo.com', 'Criar');

-- Inserindo dados na tabela Transmissão
INSERT INTO Transmissao (URL, Data_Hora, Partida_ID) VALUES
('https://example.com/partida1', '2024-03-05 16:00:00', 1),
('https://example.com/partida2', '2024-04-10 18:00:00', 2),
('https://example.com/partida3', '2024-05-12 15:00:00', 3);

-- Inserindo dados na tabela Assistido
INSERT INTO Assistido (Usuário_Email, Transmissão_URL, Data_Hora, Tempo_Assistido) VALUES
('joao@gmail.com', 'https://example.com/partida1', '2024-03-05 16:30:00', '00:30:00'),
('ana@hotmail.com', 'https://example.com/partida2', '2024-04-10 18:15:00', '00:45:00'),
('carlos@yahoo.com', 'https://example.com/partida3', '2024-05-12 15:20:00', '00:40:00');

-- Inserindo dados na tabela Comenta
INSERT INTO Comenta (Transmissão_URL, Narrador_CPF) VALUES
('https://example.com/partida1', '77777777777'),
('https://example.com/partida2', '88888888888'),
('https://example.com/partida3', '99999999999');

-- Inserindo dados na tabela Investe
INSERT INTO Investe (Patrocinador_CNPJ, Torneio_Nome, Torneio_Data_Início, Valor_Investido) VALUES
('12345678000123', 'Copa Brasil', '2024-03-01', 500000.00),
('98765432000198', 'Campeonato Nacional', '2024-04-01', 300000.00),
('56789012000156', 'Liga de Vôlei', '2024-05-01', 200000.00);

-- Inserindo dados na tabela Apita
INSERT INTO Apita (Partida_ID, Árbitro_CPF) VALUES
(1, '44444444444'),
(2, '55555555555'),
(3, '66666666666');

-- Inserindo dados na tabela Joga
INSERT INTO Joga (Partida_ID, Time_Esporte, Time_Nome) VALUES
(1, 'Futebol', 'Time A'),
(2, 'Basquete', 'Time B'),
(3, 'Vôlei', 'Time C');