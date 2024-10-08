from fastapi import FastAPI, HTTPException, Depends, status, Query
import models, schemas
from database import engine, SessionLocal
import hashlib
from fastapi.middleware.cors import CORSMiddleware
from routers import lab, radiologi, penyakit, reservasi, auth, profil, profil_lain, user, spesialis, dokter, daftar_profil, obat, hari, jam, jam_kerja_dokter, daftar_profil_penyakit

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    # allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

models.Base.metadata.create_all(bind=engine)

app.include_router(auth.router)
app.include_router(user.router)
app.include_router(profil.router)
app.include_router(profil_lain.router)
app.include_router(daftar_profil.router)
app.include_router(spesialis.router)
app.include_router(dokter.router)
app.include_router(obat.router)
app.include_router(hari.router)
app.include_router(jam.router)
app.include_router(jam_kerja_dokter.router)
app.include_router(reservasi.router)
app.include_router(daftar_profil_penyakit.router)
app.include_router(penyakit.router)
app.include_router(lab.router)
app.include_router(radiologi.router)

@app.get("/", status_code=status.HTTP_200_OK)
async def root():
    return {"message": "Welcome to the FastAPI application!"}
