from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import get_db
from routers.auth import get_current_user
from typing import Annotated

router = APIRouter(prefix="/profil_lain", tags=["Profil Lain"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/id_user/{id_user}", status_code=status.HTTP_200_OK)
async def read_profil_lain_by_id(user: user_dependency, id_user: int, db: db_dependency):
    profil_lain = db.query(models.ProfilLain).filter(models.ProfilLain.id_user == id_user).all()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if profil_lain is None:
        raise HTTPException(status_code=404, detail='profil_lain not found')
    return profil_lain

@router.get("/{id_profil_lain}", status_code=status.HTTP_200_OK)
async def read_profil_lain_by_id_profil_lain(user: user_dependency, id_profil_lain: int, db: db_dependency):
    profil_lain = db.query(models.ProfilLain).filter(models.ProfilLain.id == id_profil_lain).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if profil_lain is None:
        raise HTTPException(status_code=404, detail='profil_lain not found')
    return profil_lain

@router.delete("/{id_profil_lain}", status_code=status.HTTP_200_OK)
async def delete_profil_lain_by_id_profil_lain(user: user_dependency, id_profil_lain: int, db: db_dependency):
    profil_lain = db.query(models.ProfilLain).filter(models.ProfilLain.id == id_profil_lain).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if profil_lain is None:
        raise HTTPException(status_code=404, detail='profil_lain not found')
    db.delete(profil_lain)
    db.commit()
    return "profil_lain was deleted"

@router.post("/{id_user}", response_model=schemas.ProfilLain)
def create_profil_lain(user: user_dependency, id_user: int, profil: schemas.ProfilLainCreate, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        db_profil_lain = models.ProfilLain(id_user=id_user, **profil.dict())
        db.add(db_profil_lain)
        db.commit()
        db.refresh(db_profil_lain)
        return db_profil_lain

@router.put("/{id_user}", response_model=schemas.ProfilLainUpdate, status_code=status.HTTP_200_OK)
async def update_profil_lain(id_user: int, profil_update: schemas.ProfilLainUpdate, user: user_dependency, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Authentication Failed')
    else:
        db_profil_lain = db.query(models.ProfilLain).filter(models.ProfilLain.id_user == id_user).first()
        if db_profil_lain is None:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='Profil not found')

    # Update the profile fields
    db_profil_lain.nama = profil_update.nama
    db_profil_lain.jenis_kelamin = profil_update.jenis_kelamin
    db_profil_lain.tanggal_lahir = profil_update.tanggal_lahir
    db_profil_lain.foto = profil_update.foto

    db.commit()
    db.refresh(db_profil_lain)
    return db_profil_lain