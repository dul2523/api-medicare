from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import get_db
from routers.auth import get_current_user
from typing import Annotated

router = APIRouter(prefix="/profil", tags=["Profil"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/{id_user}", status_code=status.HTTP_200_OK)
async def read_profil_by_id(user: user_dependency, id_user: int, db: db_dependency):
    profil = db.query(models.Profil).filter(models.Profil.id_user == id_user).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if profil is None:
        raise HTTPException(status_code=404, detail='Profil not found')
    return profil

@router.post("/{id_user}", response_model=schemas.Profil)
def create_profil(id_user: int, profil: schemas.ProfilCreate, db: db_dependency):
    db_profil = models.Profil(id_user=id_user, **profil.dict())
    db.add(db_profil)
    db.commit()
    db.refresh(db_profil)
    return db_profil

@router.put("/{id_user}", response_model=schemas.ProfilUpdate, status_code=status.HTTP_200_OK)
async def update_profil(id_user: int, profil_update: schemas.ProfilUpdate, user: user_dependency, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Authentication Failed')
    else:
        db_profil = db.query(models.Profil).filter(models.Profil.id_user == id_user).first()
        if db_profil is None:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='Profil not found')

    # Update the profile fields
    db_profil.nama = profil_update.nama
    db_profil.jenis_kelamin = profil_update.jenis_kelamin
    db_profil.notelp = profil_update.notelp
    db_profil.tanggal_lahir = profil_update.tanggal_lahir
    db_profil.foto = profil_update.foto

    db.commit()
    db.refresh(db_profil)
    return db_profil
