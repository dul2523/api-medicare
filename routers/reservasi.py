from fastapi import APIRouter, Depends, HTTPException, status
from typing import List
from sqlalchemy.orm import Session
import models, schemas
from database import get_db
from routers.auth import get_current_user
from typing import Annotated

router = APIRouter(prefix="/reservasi", tags=["Reservasi"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.post("/", response_model=schemas.Reservasi)
async def create_reservasi(user: user_dependency, reservasi: schemas.ReservasiCreate, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        db_reservasi = models.Reservasi(**reservasi.dict())
        db.add(db_reservasi)
        db.commit()
        db.refresh(db_reservasi)
        return db_reservasi

@router.get("/{reservasi_id}", response_model=schemas.Reservasi)
async def read_reservasi_by_id(user: user_dependency, reservasi_id: int, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        reservasi = db.query(models.Reservasi).filter(models.Reservasi.id == reservasi_id).first()
        if not reservasi:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Reservasi not found")
        return reservasi

@router.put("/edit_status/{id_reservasi}", response_model=schemas.Reservasi)
async def update_reservasi_status(user: user_dependency, id_reservasi: int, reservasi_update: schemas.ReservasiUpdateStatus, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')

    reservasi = db.query(models.Reservasi).filter(models.Reservasi.id == id_reservasi).first()
    if not reservasi:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Reservasi not found")

    reservasi.status = reservasi_update.status
    db.commit()
    db.refresh(reservasi)

    return reservasi

@router.delete("/delete/{reservasi_id}", response_model=schemas.Reservasi)
async def delete_reservasi(user: user_dependency, reservasi_id: int, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')

    reservasi = db.query(models.Reservasi).filter(models.Reservasi.id == reservasi_id).first()
    if not reservasi:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Reservasi not found")

    db.delete(reservasi)
    db.commit()

    return reservasi

@router.get("/tgl/{tanggal}", response_model=List[schemas.Reservasi])
async def read_reservasi_by_tanggal(user: user_dependency, tanggal: str, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        reservasi = db.query(models.Reservasi).filter(models.Reservasi.tanggal == tanggal).all()
        if not reservasi:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Reservasi not found")
        return reservasi

@router.get("/by_id_daftar_profil/{id_daftar_profil}", response_model=List[schemas.Reservasi])
async def read_reservasi_by_daftar_profil(user: user_dependency, id_daftar_profil: int, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        reservasi = db.query(models.Reservasi).filter(models.Reservasi.id_daftar_profil == id_daftar_profil, models.Reservasi.status < 5).all()
        return reservasi

@router.get("/by_id_daftar_profil/status_done/{id_daftar_profil}", response_model=List[schemas.Reservasi])
async def read_reservasi_by_daftar_profil_and_status_done(user: user_dependency, id_daftar_profil: int, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        reservasi = db.query(models.Reservasi).filter(models.Reservasi.id_daftar_profil == id_daftar_profil, models.Reservasi.status == 5).all()
        return reservasi
