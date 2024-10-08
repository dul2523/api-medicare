from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/spesialis", tags=["Spesialis"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]


@router.get("/", response_model=List[schemas.Spesialis])
async def read_spesialis(user: user_dependency, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        specialists = db.query(models.Spesialis).all()
        return specialists
    
@router.get("/{id_spesialis}", status_code=status.HTTP_200_OK)
async def read_spesialis_by_id(user: user_dependency, id_spesialis: int, db: db_dependency):
    spesialis = db.query(models.Spesialis).filter(models.Spesialis.id == id_spesialis).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if spesialis is None:
        raise HTTPException(status_code=404, detail='spesialis not found')
    return spesialis