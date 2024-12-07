# Sistema de Organização e Transmissão de Eventos Esportivos Amadores

Este é um protótipo de um sistema de organização e transmissão de eventos esportivos amadores. O sistema oferece funcionalidades básicas para cadastro e consulta de jogadores, utilizando as tecnologias Python, PostgreSQL e Docker.

## Funcionalidades

O protótipo apresenta as seguintes funcionalidades:

- **Cadastrar Jogador:** Permite cadastrar um jogador informando os seguintes dados:
  - CPF
  - Nome
  - Data de Nascimento
  - Gênero
  - Altura
  - Peso

- **Consultar Jogador:** Permite consultar um jogador no banco de dados utilizando:
  - CPF ou Nome  
  O sistema retorna as informações cadastradas sobre o jogador.

## Tecnologias Utilizadas

- **Python**: Linguagem principal para o desenvolvimento da aplicação.
- **PostgreSQL**: Banco de dados para armazenar as informações dos jogadores.
- **Docker**: Ferramenta de contêinerização para facilitar a execução da aplicação e do banco de dados.

## Utilização da Aplicação

### 1. Pré-requisitos

Para rodar a aplicação, é necessário:

- Baixar e instalar o Docker Desktop: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).

### 2. Clonar o Repositório

Baixe o diretório da aplicação no repositório GitHub:

- Repositório GitHub: [https://github.com/LeoRissetto/Trabalho-BD](https://github.com/LeoRissetto/Trabalho-BD).

Após o download, entre no diretório `Trabalho-BD-Main`.

### 3. Executar os Serviços

No diretório raiz do projeto, execute o comando abaixo para iniciar os serviços definidos no arquivo `docker-compose.yml`:

```bash
docker-compose up --build -d
```

Este comando iniciará os contêineres do banco de dados e da aplicação Python.

### 4. Executar a Aplicação

Com os serviços em execução, execute o comando abaixo para iniciar um contêiner temporário do serviço `python_app`:

```bash
docker compose run --rm python_app
```

Isso abrirá a interface no terminal, onde você pode acessar as funcionalidades de cadastro e consulta de jogadores.