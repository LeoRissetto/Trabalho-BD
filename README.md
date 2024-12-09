# Sistema de Organização e Transmissão de Eventos Esportivos Amadores

Este é um protótipo de um sistema de organização e transmissão de eventos esportivos amadores. O sistema oferece funcionalidades básicas para cadastro e consulta de jogadores, utilizando as tecnologias Python, PostgreSQL e Docker.

Alunos:
- Leonardo Gueno Rissetto (13676482)
- Lucas Lima Romero (13676325)
- Luciano Gonçalves Lopes Filho (13676520) 
- Marco Antonio Gaspar Garcia (11833581)
- Thiago Kashivagui Gonçalves (13676579)

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
  - CPF  
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

Este comando iniciará os contêineres do banco de dados e da aplicação Python. A flag `--build` só é necessária na primeira execução. 

Para parar os contêineres, execute:

```bash
docker-compose down
```


### 4. Executar a Aplicação

Com os serviços em execução, execute o comando abaixo para iniciar um contêiner temporário do serviço `python_app`:

```bash
docker compose run --rm python_app
```

Isso abrirá a interface no terminal, onde você pode acessar as funcionalidades de cadastro e consulta de jogadores.

### 5. Apagar a Base de Dados

Caso deseje apagar a instância da base de dados, execute o comando:

```bash
docker-compose down -v
```

Isso irá apagar da memória do seu computador todos os volumes criados pelo contêiner.