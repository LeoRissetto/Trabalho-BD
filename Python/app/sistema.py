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

# -------------------------------------------------------------------------- #

# Funções para validação de entrada de dados, retornam falso se a entrada fornecida não estiver no formato especificado
def validar_cpf(cpf):
    """
    Deixa o cpf somente com alfanuméricos e verifica se tem 11 caracteres.
    """
    cpf = re.sub(r"[^\w]", "", cpf)
    if len(cpf) == 11 and cpf.isalnum():
        return True, cpf
    return False, cpf

def validar_data(data):
    try:
        datetime.strptime(data, "%Y-%m-%d")
        return True
    except ValueError:
        return False

def validar_genero(genero):
    return genero.upper() in ["M", "F"]  # M: Masculino, F: Feminino

# -------------------------------------------------------------------------- #

# Função para cadastrar jogador, chamada pelo menu principal
def cadastrar_jogador(conn):
    print(cf.bold("\nInsira os dados do Jogador"))
    try:

        # Solicita e valida os dados do jogador, cada campo de uma vez

        # CPF
        while True:
            cpf = input(cf.bold("CPF do Jogador (somente números): ")).strip()
            ret, cpf = validar_cpf(cpf)
            if ret:
                break
            print(cf.red("CPF inválido! Tente novamente."))

        # Nome
        nome = input(cf.bold("Nome do Jogador: ")).strip().upper()

        # Data de Nascimento
        while True:
            try:
                data_nascimento = input(cf.bold("Data de Nascimento (DD-MM-YYYY): ")).strip()
                data_nascimento = datetime.strptime(data_nascimento, "%d-%m-%Y").strftime("%Y-%m-%d")
                if validar_data(data_nascimento):
                    break
            except Exception as e:
                print(cf.red("Data inválida! Tente novamente."))

        # Gênero
        while True:
            genero = input(cf.bold("Gênero do Jogador (M/F): ")).strip().upper()
            if validar_genero(genero):
                break
            print(cf.red("Gênero inválido! Use M ou F."))

        # Altura
        while True:
            try:
                altura = float(input(cf.bold("Altura do Jogador (em metros, ex: 1.80): ")).strip())
                if altura > 0:
                    break
            except ValueError:
                pass
            print(cf.red("Altura inválida! Insira um número positivo."))

        # Peso
        while True:
            try:
                peso = float(input(cf.bold("Peso do Jogador (em kg, ex: 70.5): ")).strip())
                if peso > 0:
                    break
            except ValueError:
                pass
            print(cf.red("Peso inválido! Insira um número positivo."))

        # Depois de validados, podemos inserir no BD

        # Realiza a inserção
        with conn.cursor() as cur:
            query = sql.SQL("""
                INSERT INTO Jogadores (CPF, Nome, Data_Nascimento, Genero, Altura, Peso)
                VALUES (%s, %s, %s, %s, %s, %s)
            """)
            cur.execute(query, (cpf, nome, data_nascimento, genero, altura, peso))
            conn.commit()

        # Se não houve erro, o jogador foi inserido com sucesso no BD
        print(cf.bold_green("\nJogador cadastrado com sucesso!"))
    
    # Caso ocorram erros, aqui há o tratamento sem finalizar a aplicação
    except psycopg2.Error as e:
        print(cf.bold_red("Erro ao cadastrar jogador no banco: ") + cf.red(f"{e}"))
        conn.rollback()

    except Exception as e:
        print(cf.red(f"Erro inesperado: {e}"))

# Função para consultar jogador
def consultar_jogador(conn):

    # Consulta por CPF
    try:
        cpf = input("Informe o CPF do jogador que deseja consultar: ").strip()
        ret, cpf = validar_cpf(cpf)
        if not ret:
            print("CPF inválido! Tente novamente.")
            return

        # Realiza a consulta
        with conn.cursor() as cur:
            query = sql.SQL("""
                SELECT CPF, Nome, Data_Nascimento, Genero, Altura, Peso
                FROM Jogadores
                WHERE CPF = %s
            """)
            cur.execute(query, (cpf,))
            jogador = cur.fetchone()

        # Se encontrou jogador, vamos exibir seus dados
        if jogador:
            
            # Formatando a saída, para melhor exibição para o usuário
            cpf = f"{jogador[0][:3]}.{jogador[0][3:6]}.{jogador[0][6:9]}-{jogador[0][9:11]}"
            nome = jogador[1].title()
            data_nascimento = datetime.strptime(str(jogador[2]), "%Y-%m-%d").strftime("%d-%m-%Y")

            print(cf.bold_green("\nJogador Encontrado!\n"))
            print(cf.yellow("--- Dados do Jogador ---"))
            print(cf.bold("CPF: ") + f"{cpf}")
            print(cf.bold("Nome: ") + f"{nome}")
            print(cf.bold("Data de Nascimento: ") + f"{data_nascimento}")
            print(cf.bold("Gênero: ") + f"{jogador[3]}")
            print(cf.bold("Altura: ") + f"{jogador[4]} m")
            print(cf.bold("Peso: ") + f"{jogador[5]} kg")

        else:
            print(cf.bold_red("\nJogador não encontrado."))

    except psycopg2.Error as e:
        print(cf.bold_red(f"Erro ao consultar jogador no banco: ") + cf.red("{e}"))
    
    except Exception as e:
        print(cf.red(f"Erro: {e}"))

# Menu principal
def menu():

    # Coneta com o BD, e oferece as opções para o usuário
    try:
        conn = connect_db()

        while True:
            print(cf.bold_yellow("\nSistema de Gerenciamento e Transmissão de Torneios Amadores"))
            print(cf.bold("1.") + " Cadastrar Jogador")
            print(cf.bold("2.") + " Consultar Jogador")
            print(cf.bold("3.") + " Sair\n")

            opcao = input("Escolha uma opção: ").strip()
            if opcao == "1":
                cadastrar_jogador(conn)

            elif opcao == "2":
                consultar_jogador(conn)

            elif opcao == "3":
                print(cf.bold("\nSaindo..."))
                break

            else:
                print(cf.bold("Opção inválida! Tente novamente."))

    except KeyboardInterrupt as e:
        print(cf.bold("\n\nSaindo..."))

    finally:
        # Fechar conexão
        conn.close()

# Executa o sistema
if __name__ == "__main__":
    menu()
