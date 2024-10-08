from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/obat", tags=["Obat"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/spesialis/{id_spesialis}", response_model=List[schemas.Obat])
async def read_obat_by_spesialis(user: user_dependency, id_spesialis: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        obat = db.query(models.Obat).filter(models.Obat.id_spesialis == id_spesialis).all()
        if not obat:
            raise HTTPException(status_code=404, detail="Obat not found")
        return obat

@router.get("/penyakit/{id_penyakit}", response_model=List[schemas.Obat])
async def read_obat_by_penyakit_and_durasi(user: user_dependency, id_penyakit: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        obat = db.query(models.Obat).filter(models.Obat.id_penyakit == id_penyakit).all()
        if not obat:
            raise HTTPException(status_code=404, detail="Obat not found")
        return obat