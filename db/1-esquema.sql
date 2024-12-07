-- Leonardo Gueno Rissetto (13676482)
-- Lucas Lima Romero (13676325)
-- Luciano Gonçalves Lopes Filho (13676520)
-- Marco Antonio Gaspar Garcia (11833581)
-- Thiago Kashivagui Gonçalves (13676579)

-- Arquivo de Definição das Tabelas do Banco de Dados

-- Tabela de Usuários, as pessoas que irão utilizar nossa aplicação
CREATE TABLE Usuarios (

    -- Atributos de Usuário
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE NOT NULL,

    -- Constraints de Usuário
    CONSTRAINT pk_usuario PRIMARY KEY (email),
    CONSTRAINT ck_usuario CHECK (
        senha ~ '[a-z]' AND
        senha ~ '[A-Z]' AND
        senha ~ '[0-9]' AND
        senha ~ '[^A-Za-z0-9]')
);

-- Tabela de Moderadores, usuários com permissões diferenciadas
CREATE TABLE Moderadores (

    -- Moderador é somente alguns Usuários
    usuario_email VARCHAR(50) NOT NULL,
    CONSTRAINT pk_moderador PRIMARY KEY (usuario_email),
    CONSTRAINT fk_moderador FOREIGN KEY (usuario_email) REFERENCES Usuarios (email) ON DELETE CASCADE
);

-- Tabela de Permissões do Moderador
CREATE TABLE Permissoes (

    -- Atributos
    moderador VARCHAR(50) NOT NULL,
    permissao VARCHAR(25) NOT NULL,
    
    -- Constraints de Permissoes
    CONSTRAINT pk_permissao PRIMARY KEY (moderador, permissao),
    CONSTRAINT fk_permissao FOREIGN KEY (moderador) REFERENCES Moderadores (usuario_email) ON DELETE CASCADE
);

-- Tabela de Esportes
CREATE TABLE Esportes (

    -- Atributos
    nome VARCHAR(15) NOT NULL,

    -- Constraints
    CONSTRAINT pk_esportes PRIMARY KEY (nome)
);

-- Tabela de Locais, guarda informações sobre os locais onde ocorrem as partidas
CREATE TABLE Locais (

    -- Atributos
    id SERIAL NOT NULL,
    nome VARCHAR(50) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    estado CHAR(2) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    capacidade INT NOT NULL,

    -- Constraints de Locais
    CONSTRAINT pk_locais PRIMARY KEY (id),
    CONSTRAINT uni_locais UNIQUE (nome, rua, numero, estado, cidade, pais)
);

-- Tabela que guardará todos os torneios ocorridos na plataforma
CREATE TABLE Torneios (

    -- Atributos
    nome VARCHAR(50) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    esporte_nome VARCHAR(15) NOT NULL,

    -- Constraints de torneio
    CONSTRAINT pk_torneio PRIMARY KEY (nome, data_inicio),
    CONSTRAINT fk_torneio FOREIGN KEY (esporte_nome) REFERENCES Esportes(nome) ON DELETE SET NULL
);

-- Tabela de Partidas, guarda informações sobre as partidas realizadas
CREATE TABLE Partidas (

    -- Atributos
    id SERIAL NOT NULL,
    torneio_nome VARCHAR(50) NOT NULL,
    torneio_data_inicio DATE NOT NULL,
    local_id INT NOT NULL,
    data_hora DATE NOT NULL,
    resultado VARCHAR(30),

    -- Constraints de torneio
    CONSTRAINT pk_partidas PRIMARY KEY (id),
    CONSTRAINT uni_partidas UNIQUE (torneio_nome, torneio_data_inicio, local_id, data_hora),
    CONSTRAINT fk_partidas_1 FOREIGN KEY (torneio_nome, torneio_data_inicio) REFERENCES Torneios (nome, data_inicio) ON DELETE CASCADE,
    CONSTRAINT fk_partidas_2 FOREIGN KEY (local_id) REFERENCES Locais (id) ON DELETE CASCADE
);

-- Tabela de Transmissões, guarda a URL da transmissão de cada partida
CREATE TABLE Transmissoes (

    -- Atributos
    url VARCHAR(100) NOT NULL,
    data_hora DATE NOT NULL,
    id_partida INT NOT NULL,

    -- Constraints de Transmissoes
    CONSTRAINT pk_transmissoes PRIMARY KEY (url),
    CONSTRAINT uni_transmissoes UNIQUE (id_partida),
    CONSTRAINT fk_transmissoes FOREIGN KEY (id_partida) REFERENCES Partidas (id) ON DELETE CASCADE
);

-- Tabela Assistido, agregação que guardará um histórico de visualizações dos usuários de cada partida.
CREATE TABLE Assistido (

    -- Atributos
    usuario_email VARCHAR(50) NOT NULL,
    transmissao_url VARCHAR(100) NOT NULL,
    data_hora DATE NOT NULL,
    tempo_assistido INT DEFAULT 0,

    -- Constraints de Assistido
    CONSTRAINT pk_assistido PRIMARY KEY (usuario_email, transmissao_url, data_hora),
    CONSTRAINT fk_assistido_1 FOREIGN KEY (usuario_email) REFERENCES Usuarios(email) ON DELETE CASCADE,
    CONSTRAINT fk_assistido_2 FOREIGN KEY (transmissao_url) REFERENCES Transmissoes(url) ON DELETE CASCADE
);

-- Tabela de Jogadores, armazena todos os jogadores de qualquer esporte
CREATE TABLE Jogadores (

    -- Atributos
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero CHAR(1) NOT NULL,
    altura DECIMAL(3,2) NOT NULL,
    peso DECIMAL(4,1) NOT NULL,

    -- Constraints de Jogadores
    CONSTRAINT ck_cpf CHECK (cpf ~ '^\d{11}$'),
    CONSTRAINT pk_jogadores PRIMARY KEY (cpf),
    CONSTRAINT ck_jogadores CHECK (genero in ('M', 'F'))
);

-- Tabela de Treinadores
CREATE TABLE Treinadores (

    -- Atributos
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero CHAR(1) NOT NULL,

    -- Constraints de Treinadores
    CONSTRAINT ck_cpf CHECK (cpf ~ '^\d{11}$'),
    CONSTRAINT pk_treinadores PRIMARY KEY (cpf),
    CONSTRAINT ck_treinadores CHECK (genero in ('M', 'F'))
);

-- Tabela de Arbitros
CREATE TABLE Arbitros (

    -- Atributos
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero CHAR(1) NOT NULL,

    -- Constraints de Arbitros
    CONSTRAINT ck_cpf CHECK (cpf ~ '^\d{11}$'),
    CONSTRAINT pk_arbitros PRIMARY KEY (cpf),
    CONSTRAINT ck_arbitros CHECK (genero in ('M', 'F'))
);

-- Tabela de Narradores 
CREATE TABLE Narradores (

    -- Atributos
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero CHAR(1) NOT NULL,

    -- Constraints de Narradores
    CONSTRAINT ck_cpf CHECK (cpf ~ '^\d{11}$'),
    CONSTRAINT pk_narradores PRIMARY KEY (cpf),
    CONSTRAINT ck_narradores CHECK (genero in ('M', 'F'))
);

-- Tabela de Times, guarda o nome, esporte e treinador
CREATE TABLE Times (

    -- Atributos
    nome VARCHAR(30) NOT NULL,
    nome_esporte VARCHAR(15) NOT NULL,
    cpf_treinador CHAR(11) NOT NULL,

    -- Constraints
    CONSTRAINT pk_times PRIMARY KEY (nome, nome_esporte),
    CONSTRAINT fk_times_1 FOREIGN KEY (nome_esporte) REFERENCES Esportes(nome) ON DELETE CASCADE,
    CONSTRAINT fk_times_2 FOREIGN KEY (cpf_treinador) REFERENCES Treinadores(cpf) ON DELETE CASCADE
);

-- Tabela de Patrocinadores
CREATE TABLE Patrocinadores (

    -- Atributos
    cnpj CHAR(14) NOT NULL,
    nome VARCHAR(30) NOT NULL,

    -- Constarints de Patrocinadores
    CONSTRAINT ck_cnpj CHECK (cnpj ~ '^\d{14}$'),
    CONSTRAINT pk_patrocinadores PRIMARY KEY (cnpj)
);

-- Tabela Investe, guarda os investimentos dos patrocinadores nos torneios
CREATE TABLE Investe (

    -- Atributos
    patrocinador_cnpj CHAR(14) NOT NULL,
    torneio_nome VARCHAR(50) NOT NULL,
    torneio_data_inicio DATE NOT NULL,
    valor_investido DECIMAL(10, 2) NOT NULL,

    -- Constraints de Investe
    CONSTRAINT pk_investe PRIMARY KEY (patrocinador_cnpj, torneio_nome, torneio_data_inicio),
    CONSTRAINT fk_investe_1 FOREIGN KEY (patrocinador_cnpj) REFERENCES Patrocinadores(cnpj) ON DELETE CASCADE,
    CONSTRAINT fk_investe_2 FOREIGN KEY (torneio_nome, torneio_data_inicio) REFERENCES Torneios(nome, data_inicio) ON DELETE CASCADE
);

-- Tabela Joga, registra as partidas que os times jogaram
CREATE TABLE Joga (

    -- Atributos
    partida_id INT NOT NULL,
    time_nome VARCHAR(30) NOT NULL,
    time_esporte VARCHAR(15) NOT NULL,

    -- Constraints de Joga
    CONSTRAINT pk_joga PRIMARY KEY (partida_id, time_nome, time_esporte),
    CONSTRAINT fk_joga_1 FOREIGN KEY (partida_id) REFERENCES Partidas(id) ON DELETE CASCADE,
    CONSTRAINT fk_joga_2 FOREIGN KEY (time_nome, time_esporte) REFERENCES Times(nome, nome_esporte) ON DELETE CASCADE
);

-- Tabela Joga_Por, guarda informações sobre quais jogadores jogam em quais times
CREATE TABLE Joga_Por (

    -- Atributos
    time_nome VARCHAR(30) NOT NULL,
    time_esporte VARCHAR(15) NOT NULL,
    jogador_cpf CHAR(11) NOT NULL,

    -- Constraints de Joga
    CONSTRAINT pk_jogapor PRIMARY KEY (time_nome, time_esporte, jogador_cpf),
    CONSTRAINT fk_jogapor_1 FOREIGN KEY (time_nome, time_esporte) REFERENCES Times(nome, nome_esporte) ON DELETE CASCADE,
    CONSTRAINT fk_jogapor_2 FOREIGN KEY (jogador_cpf) REFERENCES Jogadores(cpf) ON DELETE CASCADE
);

-- Tabela Apita, guarda informações sobre quais árbitros apitaram quais partidas
CREATE TABLE Apita (

    -- Atributos
    partida_id INT NOT NULL,
    arbitro_cpf CHAR(11) NOT NULL,

    -- Constraints de Joga
    CONSTRAINT pk_apita PRIMARY KEY (partida_id, arbitro_cpf),
    CONSTRAINT fk_apita_1 FOREIGN KEY (partida_id) REFERENCES Partidas(id) ON DELETE CASCADE,
    CONSTRAINT fk_apita_2 FOREIGN KEY (arbitro_cpf) REFERENCES Arbitros(cpf) ON DELETE CASCADE
);

-- Tabela Comenta, guarda qual narrador comentou qual transmissão
CREATE TABLE Comenta (

    -- Atributos
    transmissao_url VARCHAR(100) NOT NULL,
    narrador_cpf CHAR(11) NOT NULL,

    -- Constraints de Joga
    CONSTRAINT pk_comenta PRIMARY KEY (transmissao_url, narrador_cpf),
    CONSTRAINT fk_comenta_1 FOREIGN KEY (transmissao_url) REFERENCES Transmissoes(url) ON DELETE CASCADE,
    CONSTRAINT fk_comenta_2 FOREIGN KEY (narrador_cpf) REFERENCES Narradores(cpf) ON DELETE CASCADE
);

-- 
