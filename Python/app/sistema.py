import psycopg2
import os
from psycopg2 import sql
from datetime import datetime
import re  # Biblioteca para expressões regulares
import colorful as cf # Biblioteca que imprime texto com cores

# Função para conectar ao banco usando variáveis de ambiente
def connect_db():
    try:
        conn = psycopg2.connect(
            dbname=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            host=os.getenv("DB_HOST"),
            port=os.getenv("DB_PORT")
        )
        return conn
    except Exception as e:
        print(f"Erro ao conectar ao banco: {e}")
        exit()

# Validação de entrada de dados
def validar_cpf(cpf):
    """
    Valida se o CPF está no formato correto (XXX.XXX.XXX-XX) e tem 14 caracteres.
    """
    if re.match(r"^\d{3}\.\d{3}\.\d{3}-\d{2}$", cpf):
        return True
    return False

def validar_data(data):
    try:
        datetime.strptime(data, "%Y-%m-%d")
        return True
    except ValueError:
        return False

def validar_genero(genero):
    return genero.upper() in ["M", "F"]  # M: Masculino, F: Feminino

# Função para cadastrar jogador
def cadastrar_jogador():
    try:
        # Solicita e valida os dados do jogador
        while True:
            cpf = input("CPF do Jogador (formato XXX.XXX.XXX-XX): ").strip()
            if validar_cpf(cpf):
                break
            print("CPF inválido! Use o formato XXX.XXX.XXX-XX.")

        nome = input("Nome do Jogador: ").strip()

        while True:
            data_nascimento = input("Data de Nascimento (YYYY-MM-DD): ").strip()
            if validar_data(data_nascimento):
                break
            print("Data inválida! Tente novamente.")

        while True:
            genero = input("Gênero do Jogador (M/F): ").strip().upper()
            if validar_genero(genero):
                break
            print("Gênero inválido! Use M ou F.")

        while True:
            try:
                altura = float(input("Altura do Jogador (em metros, ex: 1.80): ").strip())
                if altura > 0:
                    break
            except ValueError:
                pass
            print("Altura inválida! Insira um número positivo.")

        while True:
            try:
                peso = float(input("Peso do Jogador (em kg, ex: 70.5): ").strip())
                if peso > 0:
                    break
            except ValueError:
                pass
            print("Peso inválido! Insira um número positivo.")

        # Conecta ao banco e realiza a inserção
        with connect_db() as conn:
            with conn.cursor() as cur:
                query = sql.SQL("""
                    INSERT INTO Jogadores (CPF, Nome, Data_Nascimento, Genero, Altura, Peso)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """)
                cur.execute(query, (cpf, nome, data_nascimento, genero, altura, peso))
                conn.commit()

        print("Jogador cadastrado com sucesso!")
    except psycopg2.Error as e:
        print(cf.red("Erro ao cadastrar jogador no banco: ") + cf.bold_red(f"{e}"))
    except Exception as e:
        print(f"Erro inesperado: {e}")

# Função para consultar jogador
def consultar_jogador():
    try:
        cpf = input("Informe o CPF do jogador que deseja consultar (formato XXX.XXX.XXX-XX): ").strip()
        if not validar_cpf(cpf):
            print("CPF inválido! Use o formato XXX.XXX.XXX-XX.")
            return

        # Conecta ao banco e realiza a consulta
        with connect_db() as conn:
            with conn.cursor() as cur:
                query = sql.SQL("""
                    SELECT CPF, Nome, Data_Nascimento, Genero, Altura, Peso
                    FROM Jogadores
                    WHERE CPF = %s
                """)
                cur.execute(query, (cpf,))
                jogador = cur.fetchone()

        if jogador:
            print(cf.bold_green("\nJogador Encontrado!\n"))
            print(cf.yellow("--- Dados do Jogador ---"))
            print(f"CPF: {jogador[0]}")
            print(f"Nome: {jogador[1]}")
            print(f"Data de Nascimento: {jogador[2]}")
            print(f"Gênero: {jogador[3]}")
            print(f"Altura: {jogador[4]} m")
            print(f"Peso: {jogador[5]} kg")
        else:
            print(cf.bold_red("\nJogador não encontrado."))
    except psycopg2.Error as e:
        print(f"Erro ao consultar jogador no banco: {e}")
    except Exception as e:
        print(f"Erro inesperado: {e}")

# Menu principal
def menu():
    while True:
        print(cf.bold_yellow("\nSistema de Gerenciamento e Transmissão de Torneios Amadores"))
        print(cf.bold("1.") + " Cadastrar Jogador")
        print(cf.bold("2.") + " Consultar Jogador")
        print(cf.bold("3.") + " Sair\n")

        opcao = input("Escolha uma opção: ").strip()
        if opcao == "1":
            cadastrar_jogador()
        elif opcao == "2":
            consultar_jogador()
        elif opcao == "3":
            print(cf.bold("Saindo..."))
            break
        else:
            print(cf.bold("Opção inválida! Tente novamente."))

# Executa o sistema
if __name__ == "__main__":
    menu()
