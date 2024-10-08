from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/daftar_profil_penyakit", tags=["Daftar Profil Penyakit"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.post("/", response_model=schemas.DaftarProfilPenyakit)
async def create_daftar_profil_penyakit(user: user_dependency, penyakit: schemas.DaftarProfilPenyakitCreate, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        db_Penyakit = models.DaftarProfilPenyakit(**penyakit.dict())
        db.add(db_Penyakit)
        db.commit()
        db.refresh(db_Penyakit)
        return db_Penyakit

@router.get("/{id_reservasi}", response_model=List[schemas.DaftarProfilPenyakit])
async def read_daftar_profil_penyakit_by_reservasi(user: user_dependency, id_reservasi: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Authentication Failed')
    else:
        daftar_profil_penyakit = db.query(models.DaftarProfilPenyakit).filter(models.DaftarProfilPenyakit.id_reservasi == id_reservasi).all()
        if not daftar_profil_penyakit:
            raise HTTPException(status_code=404, detail="Daftar Profil Penyakit not found")
        return daftar_profil_penyakit
    
@router.get("/aktif/{id_reservasi}", response_model=List[schemas.DaftarProfilPenyakit])
async def read_daftar_profil_penyakit_aktif_by_reservasi(user: user_dependency, id_reservasi: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Authentication Failed')
    else:
        daftar_profil_penyakit = db.query(models.DaftarProfilPenyakit).filter(models.DaftarProfilPenyakit.id_reservasi == id_reservasi, models.DaftarProfilPenyakit.status == 1).all()
        if not daftar_profil_penyakit:
            raise HTTPException(status_code=404, detail="Tidak ditemukan penyakit aktif")
        return daftar_profil_penyakit
    
@router.get("/aktif/id_daftar_profil/{id_daftar_profil}", response_model=List[schemas.DaftarProfilPenyakit])
async def read_daftar_profil_penyakit_aktif_by_daftar_profil(user: user_dependency, id_daftar_profil: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Authentication Failed')
    else:
        daftar_profil_penyakit = db.query(models.DaftarProfilPenyakit).filter(models.DaftarProfilPenyakit.id_daftar_profil == id_daftar_profil, models.DaftarProfilPenyakit.id_penyakit.in_([1, 5])).all()
        if not daftar_profil_penyakit:
            raise HTTPException(status_code=404, detail="Tidak ditemukan penyakit")
        return daftar_profil_penyakit

@router.get("/aktif/id_daftar_profil/radiologi/{id_daftar_profil}", response_model=List[schemas.DaftarProfilPenyakit])
async def read_daftar_profil_penyakit_radiologi_by_daftar_profil(user: user_dependency, id_daftar_profil: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='Authentication Failed')
    else:
        daftar_profil_penyakit = db.query(models.DaftarProfilPenyakit).filter(models.DaftarProfilPenyakit.id_daftar_profil == id_daftar_profil, models.DaftarProfilPenyakit.id_penyakit.in_([2, 4, 8])).all()
        if not daftar_profil_penyakit:
            raise HTTPException(status_code=404, detail="Tidak ditemukan penyakit")
        return daftar_profil_penyakit
    
@router.put("/edit_status/{id_daftar_profil_penyakit}", response_model=schemas.DaftarProfilPenyakit)
async def update_daftar_profil_penyakit_status(user: user_dependency, id_daftar_profil_penyakit: int, status_penyakit: schemas.DaftarProfilPenyakitUpdateStatus, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')

    daftar_profil_penyakit = db.query(models.DaftarProfilPenyakit).filter(models.DaftarProfilPenyakit.id == id_daftar_profil_penyakit).first()
    if not daftar_profil_penyakit:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Reservasi not found")

    daftar_profil_penyakit.status = status_penyakit.status
    db.commit()
    db.refresh(daftar_profil_penyakit)

    return daftar_profil_penyakit