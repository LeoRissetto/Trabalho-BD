-- Tabela de Usuários
INSERT INTO Usuarios (email, senha, nome, data_nasc) VALUES
('usuario1@example.com', 'SenhaF0rte!', 'João Silva', '1990-05-12'),
('usuario2@example.com', 'F0rt3@Senha', 'Maria Oliveira', '1985-08-25'),
('usuario3@example.com', 'M3lh0r#S3nh4', 'Pedro Santos', '2000-02-15');

-- Tabela de Moderadores
INSERT INTO Moderadores (usuario_email) VALUES
('usuario1@example.com'),
('usuario2@example.com'),
('usuario3@example.com');

-- Tabela de Permissões do Moderador
INSERT INTO Permissoes (moderador, permissao) VALUES
('usuario1@example.com', 'Gerenciar usuários'),
('usuario2@example.com', 'Editar torneios'),
('usuario3@example.com', 'Remover partidas');

-- Tabela de Esportes
INSERT INTO Esportes (nome) VALUES
('Futebol'),
('Basquete'),
('Vôlei');

-- Tabela de Locais
INSERT INTO Locais (nome, rua, numero, estado, cidade, pais, capacidade) VALUES
('Estádio Nacional', 'Rua Principal', '1234', 'SP', 'São Paulo', 'Brasil', 50000),
('Ginásio Central', 'Avenida Secundária', '567', 'RJ', 'Rio de Janeiro', 'Brasil', 12000),
('Arena Olímpica', 'Travessa dos Atletas', '890', 'MG', 'Belo Horizonte', 'Brasil', 30000);

-- Tabela de Torneios
INSERT INTO Torneios (nome, data_inicio, data_fim, esporte_nome) VALUES
('Copa Nacional', '2023-03-01', '2023-03-30', 'Futebol'),
('Liga Estadual', '2023-06-15', '2023-07-15', 'Basquete'),
('Campeonato de Vôlei', '2023-09-01', '2023-09-25', 'Vôlei');

-- Tabela de Partidas
INSERT INTO Partidas (torneio_nome, torneio_data_inicio, local_id, data_hora, resultado) VALUES
('Copa Nacional', '2023-03-01', 1, '2023-03-10 15:00:00', '2-1'),
('Liga Estadual', '2023-06-15', 2, '2023-06-20 18:00:00', '89-76'),
('Campeonato de Vôlei', '2023-09-01', 3, '2023-09-10 20:00:00', '3-0');

-- Tabela de Transmissões
INSERT INTO Transmissoes (url, data_hora, id_partida) VALUES
('http://transmissao1.com', '2023-03-10 15:00:00', 1),
('http://transmissao2.com', '2023-06-20 18:00:00', 2),
('http://transmissao3.com', '2023-09-10 20:00:00', 3);

-- Tabela Assistido
INSERT INTO Assistido (usuario_email, transmissao_url, data_hora, tempo_assistido) VALUES
('usuario1@example.com', 'http://transmissao1.com', '2023-03-10 16:00:00', 45),
('usuario2@example.com', 'http://transmissao2.com', '2023-06-20 19:00:00', 60),
('usuario3@example.com', 'http://transmissao3.com', '2023-09-10 21:00:00', 90);

-- Tabela de Jogadores
INSERT INTO Jogadores (cpf, nome, data_nascimento, genero, altura, peso) VALUES
('123.456.789-00', 'Carlos Almeida', '1995-04-10', 'M', 1.85, 80.0),
('987.654.321-00', 'Ana Paula', '1998-12-05', 'F', 1.78, 65.5),
('456.123.789-00', 'Rafael Lima', '2000-07-20', 'M', 1.92, 90.3);

-- Tabela de Treinadores
INSERT INTO Treinadores (cpf, nome, data_nascimento, genero) VALUES
('147.258.369-00', 'Luiz Fernando', '1978-03-22', 'M'),
('963.852.741-00', 'Roberta Mendes', '1982-11-17', 'F'),
('321.654.987-00', 'Cláudio Rocha', '1975-06-15', 'M');

-- Tabela de Árbitros
INSERT INTO Arbitros (cpf, nome, data_nascimento, genero) VALUES
('753.159.456-00', 'Eduardo Souza', '1980-01-10', 'M'),
('852.951.357-00', 'Joana Silva', '1985-09-05', 'F'),
('159.753.852-00', 'Ricardo Moura', '1979-12-20', 'M');

-- Tabela de Narradores
INSERT INTO Narradores (cpf, nome, data_nascimento, genero) VALUES
('741.852.963-00', 'Gabriel Costa', '1988-03-15', 'M'),
('369.258.147-00', 'Sofia Ribeiro', '1992-07-30', 'F'),
('258.147.369-00', 'Lucas Pereira', '1990-10-25', 'M');

-- Tabela de Times
INSERT INTO Times (nome, nome_esporte, cpf_treinador) VALUES
('Tigres', 'Futebol', '147.258.369-00'),
('Águias', 'Basquete', '963.852.741-00'),
('Pumas', 'Vôlei', '321.654.987-00');

-- Tabela de Patrocinadores
INSERT INTO Patrocinadores (cnpj, nome) VALUES
('12.345.678/0001-00', 'Empresa A'),
('98.765.432/0001-99', 'Empresa B'),
('56.789.012/0001-88', 'Empresa C');

-- Tabela Investe
INSERT INTO Investe (patrocinador_cnpj, torneio_nome, torneio_data_inicio, valor_investido) VALUES
('12.345.678/0001-00', 'Copa Nacional', '2023-03-01', 100000.00),
('98.765.432/0001-99', 'Liga Estadual', '2023-06-15', 75000.00),
('56.789.012/0001-88', 'Campeonato de Vôlei', '2023-09-01', 50000.00);

-- Tabela Joga
INSERT INTO Joga (partida_id, time_nome, time_esporte) VALUES
(1, 'Tigres', 'Futebol'),
(2, 'Águias', 'Basquete'),
(3, 'Pumas', 'Vôlei');

-- Tabela Joga_Por
INSERT INTO Joga_Por (time_nome, time_esporte, jogador_cpf) VALUES
('Tigres', 'Futebol', '123.456.789-00'),
('Águias', 'Basquete', '987.654.321-00'),
('Pumas', 'Vôlei', '456.123.789-00');

-- Tabela Apita
INSERT INTO Apita (partida_id, arbitro_cpf) VALUES
(1, '753.159.456-00'),
(2, '852.951.357-00'),
(3, '159.753.852-00');

-- Tabela Comenta
INSERT INTO Comenta (transmissao_url, narrador_cpf) VALUES
('http://transmissao1.com', '741.852.963-00'),
('http://transmissao2.com', '369.258.147-00'),
('http://transmissao3.com', '258.147.369-00');
