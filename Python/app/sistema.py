import psycopg2
import os
from psycopg2 import sql
from datetime import datetime

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
        print("Erro ao conectar ao banco:", e)
        exit()

# Validação de entrada de dados
def validar_cpf(cpf):
    return cpf.isdigit() and len(cpf) == 11

def validar_data(data):
    try:
        datetime.strptime(data, "%Y-%m-%d")
        return True
    except ValueError:
        return False

def validar_genero(genero):
    return genero.upper() in ["M", "F", "O"]  # M: Masculino, F: Feminino, O: Outros

# Função para cadastrar jogador
def cadastrar_jogador():
    conn = connect_db()
    try:
        # Solicita e valida os dados do jogador
        while True:
            cpf = input("CPF do Jogador (11 dígitos): ")
            if validar_cpf(cpf):
                break
            print("CPF inválido! Tente novamente.")

        nome = input("Nome do Jogador: ").strip()

        while True:
            data_nascimento = input("Data de Nascimento (YYYY-MM-DD): ")
            if validar_data(data_nascimento):
                break
            print("Data inválida! Tente novamente.")

        while True:
            genero = input("Gênero do Jogador (M/F/O): ").upper()
            if validar_genero(genero):
                break
            print("Gênero inválido! Use M, F ou O.")

        while True:
            try:
                altura = float(input("Altura do Jogador (em metros, ex: 1.80): "))
                if altura > 0:
                    break
            except ValueError:
                pass
            print("Altura inválida! Insira um número positivo.")

        while True:
            try:
                peso = float(input("Peso do Jogador (em kg, ex: 70.5): "))
                if peso > 0:
                    break
            except ValueError:
                pass
            print("Peso inválido! Insira um número positivo.")

        # Cria o cursor e executa a inserção
        cur = conn.cursor()
        query = sql.SQL("""
            INSERT INTO Jogador (CPF, Nome, Data_Nascimento, Genero, Altura, Peso)
            VALUES (%s, %s, %s, %s, %s, %s)
        """)
        cur.execute(query, (cpf, nome, data_nascimento, genero, altura, peso))
        conn.commit()

        print("Jogador cadastrado com sucesso!")
    except Exception as e:
        conn.rollback()
        print("Erro ao cadastrar jogador:", e)
    finally:
        if cur:
            cur.close()
        conn.close()

# Função para consultar jogador
def consultar_jogador():
    conn = connect_db()
    try:
        cpf = input("Informe o CPF do jogador que deseja consultar (11 dígitos): ")
        if not validar_cpf(cpf):
            print("CPF inválido!")
            return

        cur = conn.cursor()
        query = sql.SQL("""
            SELECT CPF, Nome, Data_Nascimento, Genero, Altura, Peso
            FROM Jogador
            WHERE CPF = %s
        """)
        cur.execute(query, (cpf,))
        jogador = cur.fetchone()

        if jogador:
            print("\n--- Dados do Jogador ---")
            print(f"CPF: {jogador[0]}")
            print(f"Nome: {jogador[1]}")
            print(f"Data de Nascimento: {jogador[2]}")
            print(f"Gênero: {jogador[3]}")
            print(f"Altura: {jogador[4]} m")
            print(f"Peso: {jogador[5]} kg")
        else:
            print("Jogador não encontrado.")

    except Exception as e:
        print("Erro ao consultar jogador:", e)
    finally:
        if cur:
            cur.close()
        conn.close()

# Menu principal
def menu():
    while True:
        print("\nSistema de Gerenciamento de Dados")
        print("1. Cadastrar Jogador")
        print("2. Consultar Jogador")
        print("3. Sair")

        opcao = input("Escolha uma opção: ")
        if opcao == "1":
            cadastrar_jogador()
        elif opcao == "2":
            consultar_jogador()
        elif opcao == "3":
            print("Saindo...")
            break
        else:
            print("Opção inválida! Tente novamente.")

# Executa o sistema
if __name__ == "__main__":
    menu()
