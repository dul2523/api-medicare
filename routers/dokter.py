from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/dokter", tags=["Dokter"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/{id_dokter}", status_code=status.HTTP_200_OK)
async def read_dokter_by_id(user: user_dependency, id_dokter: int, db: db_dependency):
    dokter = db.query(models.Dokter).filter(models.Dokter.id == id_dokter).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if dokter is None:
        raise HTTPException(status_code=404, detail='Dokter not found')
    return dokter

# Fungsi untuk mengambil daftar dokter berdasarkan ID spesialis
def get_dokter_by_spesialis(id_spesialis: int, db: Session = Depends(SessionLocal)):
    return db.query(models.Dokter).filter(models.Dokter.id_spesialis == id_spesialis).all()

# Endpoint untuk menampilkan daftar dokter berdasarkan ID spesialis
@router.get("/spesialis/{id_spesialis}", response_model=List[schemas.Dokter])
async def read_dokter_by_spesialis(user: user_dependency, id_spesialis: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        dokter = get_dokter_by_spesialis(id_spesialis, db)
        return dokter