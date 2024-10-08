from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/jam", tags=["Jam"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/", response_model=List[schemas.Jam])
async def read_jam(user: user_dependency, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        jam = db.query(models.Jam).all()
        return jam

@router.get("/id_jam/{id_jam}", status_code=status.HTTP_200_OK)
async def read_jam_by_id(user: user_dependency, id_jam: int, db: db_dependency):
    Jam = db.query(models.Jam).filter(models.Jam.id == id_jam).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if Jam is None:
        raise HTTPException(status_code=404, detail='Jam tidak ditemukan')
    return Jam