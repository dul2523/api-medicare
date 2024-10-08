from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated

router = APIRouter(prefix="/daftar_profil", tags=["Daftar Profil"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/profil_lain/{id_user}", status_code=status.HTTP_200_OK)
async def read_daftar_profil_lain_by_id_user(user: user_dependency, id_user: int, db: db_dependency):
    profil_lain = db.query(models.DaftarProfil).filter(models.DaftarProfil.id_profil_lain == id_user).all()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if profil_lain is None:
        raise HTTPException(status_code=404, detail='profil_lain not found')
    return profil_lain

@router.get("/id_daftar_profil/{id_daftar_profil}", status_code=status.HTTP_200_OK)
async def read_daftarProfil_by_id(user: user_dependency, id_daftar_profil: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        DaftarProfil = db.query(models.DaftarProfil).filter(models.DaftarProfil.id == id_daftar_profil).first()
        if not DaftarProfil:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="DaftarProfil not found")
        return DaftarProfil

@router.get("/id_profil/{id_profil}", status_code=status.HTTP_200_OK)
async def read_daftar_profil_by_id_profil(user: user_dependency, id_profil: int, db: db_dependency):
    daftarprofil = db.query(models.DaftarProfil).filter(models.DaftarProfil.id_profil == id_profil).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if daftarprofil is None:
        raise HTTPException(status_code=404, detail='daftarprofil not found')
    return daftarprofil

@router.get("/id_profil_lain/{id_profil_lain}", status_code=status.HTTP_200_OK)
async def read_daftar_profil_lain_satuan_by_id_profil_lain(user: user_dependency, id_profil_lain: int, db: db_dependency):
    daftarprofil = db.query(models.DaftarProfil).filter(models.DaftarProfil.id_profil_lain == id_profil_lain).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if daftarprofil is None:
        raise HTTPException(status_code=404, detail='daftarprofillain not found')
    return daftarprofil