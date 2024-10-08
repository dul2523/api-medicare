from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/jam_kerja_dokter", tags=["Jam Kerja Dokter"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/{id_jam_kerja_dokter}", status_code=status.HTTP_200_OK)
async def read_jam_kerja_dokter_by_id(user: user_dependency, id_jam_kerja_dokter: int, db: db_dependency):
    jamKerjaDokter = db.query(models.JamKerjaDokter).filter(models.JamKerjaDokter.id == id_jam_kerja_dokter).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if jamKerjaDokter is None:
        raise HTTPException(status_code=404, detail='Jam Kerja tidak ditemukan')
    return jamKerjaDokter

@router.get("/id_dokter/{id_dokter}", response_model=List[schemas.JamKerjaDokter])
async def read_jam_kerja_by_dokter(user: user_dependency, id_dokter: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Authentication Failed')
    else:
        jam_kerja_dokter = db.query(models.JamKerjaDokter).filter(models.JamKerjaDokter.id_dokter == id_dokter).all()
        if not jam_kerja_dokter:
            raise HTTPException(status_code=404, detail="Jam Kerja Dokter not found")
        return jam_kerja_dokter