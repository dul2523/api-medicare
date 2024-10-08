from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import SessionLocal, get_db
from routers.auth import get_current_user
from typing import Annotated, List

router = APIRouter(prefix="/hari", tags=["Hari"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/", response_model=List[schemas.Hari])
async def read_hari(user: user_dependency, db: Session = Depends(get_db)):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        hari = db.query(models.Hari).all()
        return hari

