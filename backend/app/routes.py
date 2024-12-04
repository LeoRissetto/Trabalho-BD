from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.database import get_db
from app.models import Jogador

router = APIRouter()

# Criar um novo jogador
@router.post("/jogadores/")
def create_jogador(cpf: str, nome: str, genero: str, db: Session = Depends(get_db)):
    jogador = Jogador(cpf=cpf, nome=nome, genero=genero)
    db.add(jogador)
    db.commit()
    db.refresh(jogador)
    return jogador

# Listar todos os jogadores
@router.get("/jogadores/")
def list_jogadores(db: Session = Depends(get_db)):
    return db.query(Jogador).all()
