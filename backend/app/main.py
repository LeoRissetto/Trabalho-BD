from fastapi import FastAPI
from app.database import Base, engine
from app.routes import router

# Inicializa o banco de dados
Base.metadata.create_all(bind=engine)

# Cria a aplicação FastAPI
app = FastAPI()

# Inclui as rotas
app.include_router(router)

@app.get("/")
def root():
    return {"message": "Backend esta funcionando!"}
