from sqlalchemy import Column, String, Date, Float, Integer, ForeignKey, Interval
from sqlalchemy.orm import relationship
from app.database import Base

class Jogador(Base):
    __tablename__ = "jogador"
    cpf = Column(String(11), primary_key=True)
    nome = Column(String(100), nullable=False)
    data_nascimento = Column(Date)
    genero = Column(String(10), nullable=False)
    altura = Column(Float)
    peso = Column(Float)

class Treinador(Base):
    __tablename__ = "treinador"
    cpf = Column(String(11), primary_key=True)
    nome = Column(String(100), nullable=False)
    data_nascimento = Column(Date)
    genero = Column(String(10))

class Arbitro(Base):
    __tablename__ = "arbitro"
    cpf = Column(String(11), primary_key=True)
    nome = Column(String(100), nullable=False)
    data_nascimento = Column(Date)
    genero = Column(String(10))

class Narrador(Base):
    __tablename__ = "narrador"
    cpf = Column(String(11), primary_key=True)
    nome = Column(String(100), nullable=False)
    data_nascimento = Column(Date)
    genero = Column(String(10))

class Esporte(Base):
    __tablename__ = "esporte"
    nome = Column(String(100), primary_key=True)

class Usuario(Base):
    __tablename__ = "usuario"
    email = Column(String(100), primary_key=True)
    senha = Column(String(255), nullable=False)
    nome = Column(String(100), nullable=False)
    data_nascimento = Column(Date)

class Patrocinador(Base):
    __tablename__ = "patrocinador"
    cnpj = Column(String(14), primary_key=True)
    nome = Column(String(100), nullable=False)

class Local(Base):
    __tablename__ = "local"
    nome = Column(String(100), primary_key=True)
    rua = Column(String(100), nullable=False)
    numero = Column(Integer, nullable=False)
    estado = Column(String(50), nullable=False)
    cidade = Column(String(50), nullable=False)
    pais = Column(String(50), nullable=False)
    capacidade = Column(Integer)

class Torneio(Base):
    __tablename__ = "torneio"
    nome = Column(String(100), primary_key=True)
    data_inicio = Column(Date, primary_key=True)
    data_fim = Column(Date)
    esporte_nome = Column(String(100), ForeignKey('esporte.nome'), nullable=False)

class Partida(Base):
    __tablename__ = "partida"
    id = Column(Integer, primary_key=True, autoincrement=True)
    torneio_nome = Column(String(100), ForeignKey('torneio.nome'), nullable=False)
    torneio_data_inicio = Column(Date, ForeignKey('torneio.data_inicio'), nullable=False)
    local_nome = Column(String(100), ForeignKey('local.nome'), nullable=False)
    data_hora = Column(String, nullable=False)
    resultado = Column(String(255))

class Time(Base):
    __tablename__ = "time"
    esporte_nome = Column(String(100), ForeignKey('esporte.nome'), primary_key=True)
    nome = Column(String(100), primary_key=True)
    treinador_cpf = Column(String(11), ForeignKey('treinador.cpf'), nullable=False)

class JogaPor(Base):
    __tablename__ = "joga_por"
    time_esporte = Column(String(100), ForeignKey('time.esporte_nome'), primary_key=True)
    time_nome = Column(String(100), ForeignKey('time.nome'), primary_key=True)
    jogador_cpf = Column(String(11), ForeignKey('jogador.cpf'), primary_key=True)

class Moderador(Base):
    __tablename__ = "moderador"
    usuario_email = Column(String(100), ForeignKey('usuario.email'), primary_key=True)

class Permissoes(Base):
    __tablename__ = "permissoes"
    moderador_usuario = Column(String(100), ForeignKey('moderador.usuario_email'), primary_key=True)
    permissao = Column(String(50), primary_key=True)

class Transmissao(Base):
    __tablename__ = "transmissao"
    url = Column(String(255), primary_key=True)
    data_hora = Column(String, nullable=False)
    partida_id = Column(Integer, ForeignKey('partida.id'), nullable=False)

class Assistido(Base):
    __tablename__ = "assistido"
    usuario_email = Column(String(100), ForeignKey('usuario.email'), primary_key=True)
    transmissao_url = Column(String(255), ForeignKey('transmissao.url'), primary_key=True)
    data_hora = Column(String, nullable=False)
    tempo_assistido = Column(Interval, nullable=False)

class Comenta(Base):
    __tablename__ = "comenta"
    transmissao_url = Column(String(255), ForeignKey('transmissao.url'), primary_key=True)
    narrador_cpf = Column(String(11), ForeignKey('narrador.cpf'), primary_key=True)

class Investe(Base):
    __tablename__ = "investe"
    patrocinador_cnpj = Column(String(14), ForeignKey('patrocinador.cnpj'), primary_key=True)
    torneio_nome = Column(String(100), ForeignKey('torneio.nome'), primary_key=True)
    torneio_data_inicio = Column(Date, ForeignKey('torneio.data_inicio'), primary_key=True)
    valor_investido = Column(Float, nullable=False)

class Apita(Base):
    __tablename__ = "apita"
    partida_id = Column(Integer, ForeignKey('partida.id'), primary_key=True)
    arbitro_cpf = Column(String(11), ForeignKey('arbitro.cpf'), primary_key=True)

class Joga(Base):
    __tablename__ = "joga"
    partida_id = Column(Integer, ForeignKey('partida.id'), primary_key=True)
    time_esporte = Column(String(100), ForeignKey('time.esporte_nome'), primary_key=True)
    time_nome = Column(String(100), ForeignKey('time.nome'), primary_key=True)