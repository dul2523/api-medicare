from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/lab", tags=["Lab"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/{id_penyakit}", response_model=schemas.Lab)
async def read_lab_by_id_penyakit(user: user_dependency, id_penyakit: int, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        lab = db.query(models.Lab).filter(models.Lab.id_penyakit == id_penyakit).first()
        if not lab:
            raise HTTPException(status_code=404, detail="lab not found")
        return lab