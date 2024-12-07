-- Tabela de Usuários
INSERT INTO Usuarios (email, senha, nome, data_nasc) VALUES
('usuario1@example.com', 'SenhaF0rte!', 'JOÃO SILVA', '1990-05-12'),
('usuario2@example.com', 'F0rt3@Senha', 'MARIA OLIVEIRA', '1985-08-25'),
('usuario3@example.com', 'M3lh0r#S3nh4', 'PEDRO SANTOS', '2000-02-15');

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
('FUTEBOL'),
('FUTSAL'),
('BASQUETE'),
('VÔLEI'),
('BEISEBOL'),
('SOFTBOL'),
('ATLETISMO'),
('TÊNIS'),
('TÊNIS DE MESA'),
('HANDEBOL'),
('NATAÇÃO'),
('KARATÊ'),
('JUDÔ'),
('BADMINTON');

-- Tabela de Locais
INSERT INTO Locais (nome, rua, numero, estado, cidade, pais, capacidade) VALUES
('ESTÁDIO NACIONAL', 'RUA PRINCIPAL', '1234', 'SP', 'SÃO PAULO', 'BRASIL', 50000),
('GINÁSIO CENTRAL', 'AVENIDA SECUNDÁRIA', '567', 'RJ', 'RIO DE JANEIRO', 'BRASIL', 12000),
('ARENA OLÍMPICA', 'TRAVESSA DOS ATLETAS', '890', 'MG', 'BELO HORIZONTE', 'BRASIL', 30000);

-- Tabela de Torneios
INSERT INTO Torneios (nome, data_inicio, data_fim, esporte_nome) VALUES
('COPA NACIONAL', '2023-03-01', '2023-03-30', 'FUTEBOL'),
('LIGA ESTADUAL', '2023-06-15', '2023-07-15', 'BASQUETE'),
('CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', '2023-09-25', 'FUTEBOL');

-- Tabela de Partidas
INSERT INTO Partidas (torneio_nome, torneio_data_inicio, local_id, data_hora, resultado) VALUES
('COPA NACIONAL', '2023-03-01', 1, '2023-03-10 15:00:00', '2-1'),
('LIGA ESTADUAL', '2023-06-15', 2, '2023-06-20 18:00:00', '89-76'),
('CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 3, '2023-09-10 20:00:00', '3-0');

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
('123.456.789-00', 'CARLOS ALMEIDA', '1995-04-10', 'M', 1.85, 80.0),
('987.654.321-00', 'ANA PAULA', '1998-12-05', 'F', 1.78, 65.5),
('456.123.789-00', 'RAFAEL LIMA', '2000-07-20', 'M', 1.92, 90.3),
('467.145.678-80', 'MARCO ANTONIO GASPAR GARCIA', '2002-08-29', 'M', 1.82, 85.0),
('131.098.089-60', 'LEONARDO GUENO RISSETTO', '2004-08-12', 'M', 1.72, 70.4),
('420.333.777-69', 'LUCIANO HANG', '2001-09-07', 'M', 1.42, 240.0),
('487.011.638-33', 'THIAGO KASHIVAGUI GONÇALVES', '2004-02-28', 'M', 1.68, 70.0),
('125.905.146-38', 'LUCAS LIMA ROMERO', '2004-02-17', 'M', 1.72, 65.0),
('172.217.221-72', 'PERSEU CAZARIM', '1990-01-17', 'M', 1.75, 90.0),
('486.977.498-40', 'RAUANY MARTINEZ SECCI', '2003-01-25', 'F', 1.52, 57.0),
('422.623.858-31', 'GIOVANNI DOS SANTOS', '2003-11-18', 'M', 1.95, 87.0),
('183.942.654-77', 'PEDRO GUILHERME DE BARROS ZENATTE', '2002-07-27', 'M', 1.75, 90.0);

-- Tabela de Treinadores
INSERT INTO Treinadores (cpf, nome, data_nascimento, genero) VALUES
('147.258.369-00', 'LUIZ FERNANDO', '1978-03-22', 'M'),
('963.852.741-00', 'ROBERTA MENDES', '1982-11-17', 'F'),
('321.654.987-00', 'CLÁUDIO ROCHA', '1975-06-15', 'M'),
('456.654.456-95', 'AGNES BRESSAN DE ALMEIRA', '2004-03-29', 'F'),
('221.722.172.21', 'KAZARA DJ', '1975-06-20', 'M');

-- Tabela de Árbitros
INSERT INTO Arbitros (cpf, nome, data_nascimento, genero) VALUES
('753.159.456-00', 'EDUARDO DO VALLE SIMÕES', '1980-01-10', 'M'),
('852.951.357-00', 'PAULO SÉRGIO LOPES DE SOUZA', '1985-09-05', 'M'),
('159.753.852-00', 'EMILIANO REZENDE MARTINS', '1979-12-20', 'M'),
('987.000.123-69', 'RODOLFO IPOLITO MENEGUETTE', '1985-10-25', 'M'),
('321.123.678-40', 'SIMONE DO ROCIO SENGER DE SOUZA', '1989-01-10', 'F');

-- Tabela de Narradores
INSERT INTO Narradores (cpf, nome, data_nascimento, genero) VALUES
('001.002.003-04', 'PEDRO ERNESTO DENARDIM', '1920-01-01', 'M'),
('111.222.333.90', 'CLÉBER MACHADO', '1995-11-29', 'M'),
('741.742.743.74', 'LUIZ CARLOS JÚNIOR', '1978-12-01', 'M'),
('432.432.987.21', 'SILVIO LUIZ', '1900-03-27', 'M'),
('321.321.321.32', 'MILTON LEITE', '1980-02-10', 'M'),
('741.852.963-00', 'ANDRÉ HENNING', '1988-03-15', 'M'),
('369.258.147-00', 'JORGE IGGOR', '1992-07-30', 'M'),
('258.147.369-00', 'GALVÃO BUENO', '1990-10-25', 'M');

-- Tabela de Times
INSERT INTO Times (nome, nome_esporte, cpf_treinador) VALUES
('TIGRES', 'FUTEBOL', '147.258.369-00'),
('ÁGUIAS', 'BASQUETE', '963.852.741-00'),
('PUMAS', 'VÔLEI', '321.654.987-00');

-- Tabela de Patrocinadores
INSERT INTO Patrocinadores (cnpj, nome) VALUES
('12.345.678/0001-00', 'STARBENE'),
('98.765.432/0001-99', 'EMBRATEL'),
('11.222.333/0001-11', 'SAECOMP'),
('22.333.444/0001-22', 'COROTE'),
('33.444.555/0001-33', 'TAKUS SPORTS BAR'),
('44.555.666/0001-44', 'KFC BRASIL'),
('55.666.777/0001-55', 'GRUPO SEMEAR'),
('66.777.888/0001-66', 'ESSENZA'),
('77.888.999/0001-77', 'BLACKSHIELD TECHNOLOGIES'),
('88.999.000/0001-88', 'SUPERCELL'),
('99.000.111/0001-99', 'JORNADAS USP'),
('56.789.012/0001-88', 'BETANO');

-- Tabela Investe
INSERT INTO Investe (patrocinador_cnpj, torneio_nome, torneio_data_inicio, valor_investido) VALUES
('12.345.678/0001-00', 'COPA NACIONAL', '2023-03-01', 100000.00),
('98.765.432/0001-99', 'LIGA ESTADUAL', '2023-06-15', 75000.00),
('56.789.012/0001-88', 'CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 50000.00);

-- Tabela Joga
INSERT INTO Joga (partida_id, time_nome, time_esporte) VALUES
(1, 'TIGRES', 'FUTEBOL'),
(2, 'ÁGUIAS', 'BASQUETE'),
(3, 'PUMAS', 'VÔLEI');

-- Tabela Joga_Por
INSERT INTO Joga_Por (time_nome, time_esporte, jogador_cpf) VALUES
('TIGRES', 'FUTEBOL', '123.456.789-00'),
('ÁGUIAS', 'BASQUETE', '987.654.321-00'),
('PUMAS', 'VÔLEI', '456.123.789-00');

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
