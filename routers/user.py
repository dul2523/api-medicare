from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
import models, schemas
from database import get_db
from routers.auth import get_current_user
from typing import Annotated

router = APIRouter(prefix="/User", tags=["User"])

user_dependency = Annotated[dict, Depends(get_current_user)]
db_dependency = Annotated[Session, Depends(get_db)]

@router.get("/", status_code=status.HTTP_200_OK)
async def user(user: user_dependency, user_id: int, db: db_dependency):
    user_login = db.query(models.User).filter(models.User.id == user_id).first()
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    if user_login is None:
        raise HTTPException(status_code=404, detail='User not found')
    return {
        "email": user_login.email,
        "id": user_login.id
    }

def auth_user(user: user_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    return True

@router.delete("/{user_id}", status_code=status.HTTP_200_OK)
async def delete_user(user: user_dependency, user_id: int, db: db_dependency):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
    else:
        db_user = db.query(models.User).filter(models.User.id == user_id).first()
        if db_user is None:
            raise HTTPException(status_code=400, detail='user was not found')
        db.delete(db_user)
        db.commit()
        return "user was deleted"