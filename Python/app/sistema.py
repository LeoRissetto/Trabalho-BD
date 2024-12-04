import psycopg2
import os
from psycopg2 import sql

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

# Função para cadastrar jogador
def cadastrar_jogador():
    conn = connect_db()
    try:
        cpf = input("CPF do Jogador (11 dígitos): ")
        nome = input("Nome do Jogador: ")
        data_nascimento = input("Data de Nascimento (YYYY-MM-DD): ")
        genero = input("Gênero do Jogador: ")
        altura = float(input("Altura do Jogador (em metros, ex: 1.80): "))
        peso = float(input("Peso do Jogador (em kg, ex: 70.5): "))

        # Cria o cursor e executa a inserção
        cur = conn.cursor()
        cur.execute(
            """
            INSERT INTO Jogador (CPF, Nome, Data_Nascimento, Genero, Altura, Peso)
            VALUES (%s, %s, %s, %s, %s, %s)
            """,
            (cpf, nome, data_nascimento, genero, altura, peso)
        )
        conn.commit()
        print("Jogador cadastrado com sucesso!")
    except Exception as e:
        conn.rollback()
        print("Erro ao cadastrar jogador:", e)
    finally:
        cur.close()
        conn.close()

# Função para consultar jogador
def consultar_jogador():
    conn = connect_db()
    try:
        parametro = input("Digite o CPF ou Nome do jogador para buscar: ")

        # Cria o cursor e executa a consulta
        cur = conn.cursor()
        query = sql.SQL(
            """
            SELECT CPF, Nome, Data_Nascimento, Genero, Altura, Peso 
            FROM Jogador 
            WHERE CPF = %s OR Nome ILIKE %s
            """
        )
        cur.execute(query, (parametro, f"%{parametro}%"))
        resultados = cur.fetchall()

        if resultados:
            for jogador in resultados:
                print(
                    f"CPF: {jogador[0]}, Nome: {jogador[1]}, Data de Nascimento: {jogador[2]}, "
                    f"Gênero: {jogador[3]}, Altura: {jogador[4]}m, Peso: {jogador[5]}kg"
                )
        else:
            print("Nenhum jogador encontrado.")
    except Exception as e:
        print("Erro ao consultar jogador:", e)
    finally:
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
