from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/penyakit", tags=["Penyakit"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/{id_penyakit}", response_model=schemas.Penyakit)
async def read_penyakit_by_id(user: user_dependency, id_penyakit: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        penyakit = db.query(models.Penyakit).filter(models.Penyakit.id == id_penyakit).first()
        if not penyakit:
            raise HTTPException(status_code=404, detail="penyakit not found")
        return penyakit