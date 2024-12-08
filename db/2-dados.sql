-- Leonardo Gueno Rissetto (13676482)
-- Lucas Lima Romero (13676325)
-- Luciano Gonçalves Lopes Filho (13676520)
-- Marco Antonio Gaspar Garcia (11833581)
-- Thiago Kashivagui Gonçalves (13676579)

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
('ARENA OLÍMPICA', 'TRAVESSA DOS ATLETAS', '890', 'MG', 'BELO HORIZONTE', 'BRASIL', 30000),
('ESTÁDIO BARÃO DE SERRA NEGRA', 'RUA SILVA JARDIM', '849', 'SP', 'PIRACICABA', 'BRASIL', 18799);

-- Tabela de Torneios
INSERT INTO Torneios (nome, data_inicio, data_fim, esporte_nome) VALUES
('COPA NACIONAL DE VÔLEI', '2023-03-01', '2023-03-30', 'VÔLEI'),
('LIGA ESTADUAL DE BASQUETE', '2023-06-15', '2023-07-15', 'BASQUETE'),
('CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', '2023-09-25', 'FUTEBOL');

-- Tabela de Partidas
INSERT INTO Partidas (torneio_nome, torneio_data_inicio, local_id, data_hora, resultado) VALUES
('COPA NACIONAL DE VÔLEI', '2023-03-01', 1, '2023-03-10 15:00:00', '2-1'),
('LIGA ESTADUAL DE BASQUETE', '2023-06-15', 2, '2023-06-20 18:00:00', '89-76'),
('CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 4, '2023-09-10 20:00:00', '3-0'),
('CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 4, '2023-09-11 20:00:00', '3-1'),
('CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 4, '2023-09-12 20:00:00', '2-4'),
('CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 4, '2023-09-13 20:00:00', '1-0');

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
('12345678900', 'CARLOS ALMEIDA', '1995-04-10', 'M', 1.85, 80.0),
('98765432100', 'ANA PAULA', '1998-12-05', 'F', 1.78, 65.5),
('45612378900', 'RAFAEL LIMA', '2000-07-20', 'M', 1.92, 90.3),
('46714567880', 'MARCO ANTONIO GASPAR GARCIA', '2002-08-29', 'M', 1.82, 85.0),
('13109808960', 'LEONARDO GUENO RISSETTO', '2004-08-12', 'M', 1.72, 70.4),
('42033377769', 'LUCIANO HANG', '2001-09-07', 'M', 1.42, 240.0),
('48701163833', 'THIAGO KASHIVAGUI GONÇALVES', '2004-02-28', 'M', 1.68, 70.0),
('12590514638', 'LUCAS LIMA ROMERO', '2004-02-17', 'M', 1.72, 65.0),
('17221722172', 'PERSEU CAZARIM', '1990-01-17', 'M', 1.75, 90.0),
('48697749840', 'RAUANY MARTINEZ SECCI', '2003-01-25', 'F', 1.52, 57.0),
('42262385831', 'GIOVANNI DOS SANTOS', '2003-11-18', 'M', 1.95, 87.0),
('18394265477', 'PEDRO GUILHERME DE BARROS ZENATTE', '2002-07-27', 'M', 1.75, 90.0),
('23551869871', 'LUCA CANAVESSI SARTORI', '2003-04-16', 'M', 1.82, 70);

-- Tabela de Treinadores
INSERT INTO Treinadores (cpf, nome, data_nascimento, genero) VALUES
('14725836900', 'LUIZ FERNANDO', '1978-03-22', 'M'),
('96385274100', 'ROBERTA MENDES', '1982-11-17', 'F'),
('32165498700', 'CLÁUDIO ROCHA', '1975-06-15', 'M'),
('45665445695', 'AGNES BRESSAN DE ALMEIRA', '2004-03-29', 'F'),
('22172217221', 'KAZARA DJ', '1975-06-20', 'M'),
('12345678969', 'CLODOALDO JUNIOR', '1960-08-15', 'M');

-- Tabela de Árbitros
INSERT INTO Arbitros (cpf, nome, data_nascimento, genero) VALUES
('75315945600', 'EDUARDO DO VALLE SIMÕES', '1980-01-10', 'M'),
('85295135700', 'PAULO SÉRGIO LOPES DE SOUZA', '1985-09-05', 'M'),
('15975385200', 'EMILIANO REZENDE MARTINS', '1979-12-20', 'M'),
('98700012369', 'RODOLFO IPOLITO MENEGUETTE', '1985-10-25', 'M'),
('32112367840', 'SIMONE DO ROCIO SENGER DE SOUZA', '1989-01-10', 'F');

-- Tabela de Narradores
INSERT INTO Narradores (cpf, nome, data_nascimento, genero) VALUES
('00100200304', 'PEDRO ERNESTO DENARDIM', '1920-01-01', 'M'),
('11122233390', 'CLÉBER MACHADO', '1995-11-29', 'M'),
('74174274374', 'LUIZ CARLOS JÚNIOR', '1978-12-01', 'M'),
('43243298721', 'SILVIO LUIZ', '1900-03-27', 'M'),
('32132132132', 'MILTON LEITE', '1980-02-10', 'M'),
('74185296300', 'ANDRÉ HENNING', '1988-03-15', 'M'),
('36925814700', 'JORGE IGGOR', '1992-07-30', 'M'),
('25814736900', 'GALVÃO BUENO', '1990-10-25', 'M');

-- Tabela de Times
INSERT INTO Times (nome, nome_esporte, cpf_treinador) VALUES
('TIGRES', 'FUTEBOL', '14725836900'),
('ÁGUIAS', 'BASQUETE', '96385274100'),
('XV DE PIRACICABA', 'FUTEBOL', '22172217221'),
('RESERVAS FC', 'FUTEBOL', '12345678969'),
('MOSFET FC', 'FUTEBOL', '45665445695'),
('PUMAS', 'VÔLEI', '32165498700');

-- Tabela de Patrocinadores
INSERT INTO Patrocinadores (cnpj, nome) VALUES
('12345678000100', 'STARBENE'),
('98765432000199', 'EMBRATEL'),
('11222333000111', 'SAECOMP'),
('22333444000122', 'COROTE'),
('33444555000133', 'TAKUS SPORTS BAR'),
('44555666000144', 'KFC BRASIL'),
('55666777000155', 'GRUPO SEMEAR'),
('66777888000166', 'ESSENZA'),
('77888999000177', 'BLACKSHIELD TECHNOLOGIES'),
('88999000000188', 'SUPERCELL'),
('99000111000199', 'JORNADAS USP'),
('56789012000188', 'BETANO');

-- Tabela Investe
INSERT INTO Investe (patrocinador_cnpj, torneio_nome, torneio_data_inicio, valor_investido) VALUES
('12345678000100', 'COPA NACIONAL DE VÔLEI', '2023-03-01', 100000.00),
('98765432000199', 'LIGA ESTADUAL DE BASQUETE', '2023-06-15', 75000.00),
('33444555000133', 'CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 50000.00),
('56789012000188', 'CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 25000.00),
('12345678000100', 'CAMPEONATO PIRACICABANO DE FUTEBOL', '2023-09-01', 100000.00);

-- Tabela Joga
INSERT INTO Joga (partida_id, time_nome, time_esporte) VALUES
(1, 'PUMAS', 'VÔLEI'),
(2, 'ÁGUIAS', 'BASQUETE'),
(3, 'XV DE PIRACICABA', 'FUTEBOL'),
(3, 'MOSFET FC', 'FUTEBOL'),
(4, 'RESERVAS FC', 'FUTEBOL'),
(4, 'TIGRES', 'FUTEBOL'),
(5, 'MOSFET FC', 'FUTEBOL'),
(5, 'RESERVAS FC', 'FUTEBOL'),
(6, 'XV DE PIRACICABA', 'FUTEBOL'),
(6, 'TIGRES', 'FUTEBOL');

-- Tabela Joga_Por
INSERT INTO Joga_Por (time_nome, time_esporte, jogador_cpf) VALUES
('TIGRES', 'FUTEBOL', '12345678900'),
('XV DE PIRACICABA', 'FUTEBOL', '46714567880'),
('XV DE PIRACICABA', 'FUTEBOL', '23551869871'),
('MOSFET FC', 'FUTEBOL', '48701163833'),
('MOSFET FC', 'FUTEBOL', '13109808960'),
('RESERVAS FC', 'FUTEBOL', '42262385831'),
('RESERVAS FC', 'FUTEBOL', '18394265477'),
('ÁGUIAS', 'BASQUETE', '98765432100'),
('PUMAS', 'VÔLEI', '45612378900');


-- Tabela Apita
INSERT INTO Apita (partida_id, arbitro_cpf) VALUES
(1, '75315945600'),
(2, '85295135700'),
(3, '85295135700'),
(4, '15975385200'),
(5, '98700012369'),
(6, '32112367840');

-- Tabela Comenta
INSERT INTO Comenta (transmissao_url, narrador_cpf) VALUES
('http://transmissao1.com', '74185296300'),
('http://transmissao2.com', '36925814700'),
('http://transmissao3.com', '25814736900');
