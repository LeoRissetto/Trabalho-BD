-- Criação da tabela Jogador
CREATE TABLE Jogador (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    Genero VARCHAR(10) NOT NULL,
    Altura DECIMAL(4,2),
    Peso DECIMAL(5,2)
);

-- Criação da tabela Treinador
CREATE TABLE Treinador (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    Genero VARCHAR(10)
);

-- Criação da tabela Árbitro
CREATE TABLE Arbitro (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    Genero VARCHAR(10)
);

-- Criação da tabela Narrador
CREATE TABLE Narrador (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    Genero VARCHAR(10)
);

-- Criação da tabela Esporte
CREATE TABLE Esporte (
    Nome VARCHAR(100) PRIMARY KEY
);

-- Criação da tabela Time
CREATE TABLE Time (
    Esporte_Nome VARCHAR(100),
    Nome VARCHAR(100),
    Treinador_CPF VARCHAR(11) NOT NULL,
    PRIMARY KEY (Esporte_Nome, Nome),
    FOREIGN KEY (Esporte_Nome) REFERENCES Esporte(Nome),
    FOREIGN KEY (Treinador_CPF) REFERENCES Treinador(CPF)
);

-- Criação da tabela Joga_Por
CREATE TABLE Joga_Por (
    Time_Esporte VARCHAR(100),
    Time_Nome VARCHAR(100),
    Jogador_CPF VARCHAR(11),
    PRIMARY KEY (Time_Esporte, Time_Nome, Jogador_CPF),
    FOREIGN KEY (Time_Esporte, Time_Nome) REFERENCES Time(Esporte_Nome, Nome),
    FOREIGN KEY (Jogador_CPF) REFERENCES Jogador(CPF)
);

-- Criação da tabela Usuário
CREATE TABLE Usuario (
    Email VARCHAR(100) PRIMARY KEY,
    Senha VARCHAR(255) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE
);

-- Criação da tabela Moderador
CREATE TABLE Moderador (
    Usuário_Email VARCHAR(100),
    PRIMARY KEY (Usuário_Email),
    FOREIGN KEY (Usuário_Email) REFERENCES Usuario(Email)
);

-- Criação da tabela Permissões
CREATE TABLE Permissoes (
    Moderador_Usuário VARCHAR(100),
    Permissao VARCHAR(50),
    PRIMARY KEY (Moderador_Usuário, Permissao),
    FOREIGN KEY (Moderador_Usuário) REFERENCES Moderador(Usuário_Email)
);

-- Criação da tabela Transmissão
CREATE TABLE Transmissao (
    URL VARCHAR(255) PRIMARY KEY,
    Data_Hora TIMESTAMP NOT NULL,
    Partida_ID INTEGER NOT NULL,
    FOREIGN KEY (Partida_ID) REFERENCES Partida(ID)
);

-- Criação da tabela Assistido
CREATE TABLE Assistido (
    Usuário_Email VARCHAR(100),
    Transmissão_URL VARCHAR(255),
    Data_Hora TIMESTAMP,
    Tempo_Assistido INTERVAL NOT NULL,
    PRIMARY KEY (Usuário_Email, Transmissão_URL, Data_Hora),
    FOREIGN KEY (Usuário_Email) REFERENCES Usuario(Email),
    FOREIGN KEY (Transmissão_URL) REFERENCES Transmissao(URL)
);

-- Criação da tabela Comenta
CREATE TABLE Comenta (
    Transmissão_URL VARCHAR(255),
    Narrador_CPF VARCHAR(11),
    PRIMARY KEY (Transmissão_URL, Narrador_CPF),
    FOREIGN KEY (Transmissão_URL) REFERENCES Transmissao(URL),
    FOREIGN KEY (Narrador_CPF) REFERENCES Narrador(CPF)
);

-- Criação da tabela Torneio
CREATE TABLE Torneio (
    Nome VARCHAR(100),
    Data_Início DATE,
    Data_Fim DATE,
    Esporte_Nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (Nome, Data_Início),
    FOREIGN KEY (Esporte_Nome) REFERENCES Esporte(Nome)
);

-- Criação da tabela Patrocinador
CREATE TABLE Patrocinador (
    CNPJ VARCHAR(14) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

-- Criação da tabela Investe
CREATE TABLE Investe (
    Patrocinador_CNPJ VARCHAR(14),
    Torneio_Nome VARCHAR(100),
    Torneio_Data_Início DATE,
    Valor_Investido DECIMAL(15, 2),
    PRIMARY KEY (Patrocinador_CNPJ, Torneio_Nome, Torneio_Data_Início),
    FOREIGN KEY (Patrocinador_CNPJ) REFERENCES Patrocinador(CNPJ),
    FOREIGN KEY (Torneio_Nome, Torneio_Data_Início) REFERENCES Torneio(Nome, Data_Início)
);

-- Criação da tabela Local
CREATE TABLE Local (
    Nome VARCHAR(100) PRIMARY KEY,
    Rua VARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    País VARCHAR(50) NOT NULL,
    Capacidade INT
);

-- Criação da tabela Partida
CREATE TABLE Partida (
    ID SERIAL PRIMARY KEY,
    Torneio_Nome VARCHAR(100) NOT NULL,
    Torneio_Data_Início DATE NOT NULL,
    Local_Nome VARCHAR(100) NOT NULL,
    Data_Hora TIMESTAMP NOT NULL,
    Resultado VARCHAR(255),
    FOREIGN KEY (Torneio_Nome, Torneio_Data_Início) REFERENCES Torneio(Nome, Data_Início),
    FOREIGN KEY (Local_Nome) REFERENCES Local(Nome)
);

-- Criação da tabela Apita
CREATE TABLE Apita (
    Partida_ID INTEGER,
    Árbitro_CPF VARCHAR(11),
    PRIMARY KEY (Partida_ID, Árbitro_CPF),
    FOREIGN KEY (Partida_ID) REFERENCES Partida(ID),
    FOREIGN KEY (Árbitro_CPF) REFERENCES Arbitro(CPF)
);

-- Criação da tabela Joga
CREATE TABLE Joga (
    Partida_ID INTEGER,
    Time_Esporte VARCHAR(100),
    Time_Nome VARCHAR(100),
    PRIMARY KEY (Partida_ID, Time_Esporte, Time_Nome),
    FOREIGN KEY (Partida_ID) REFERENCES Partida(ID),
    FOREIGN KEY (Time_Esporte, Time_Nome) REFERENCES Time(Esporte_Nome, Nome)
);