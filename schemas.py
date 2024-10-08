from typing import Optional
from pydantic import BaseModel
from datetime import date, time

class SpesialisBase(BaseModel):
    id: int
    nama: str
    pengertian: str | None = None
    kondisi: str | None = None
    pengobatan: str | None = None
    foto: str

class SpesialisCreate(SpesialisBase):
    pass

class Spesialis(SpesialisBase):
    id: int
    class Config:
        orm_mode = True

class DokterBase(BaseModel):
    id: int
    nama: str
    foto: str

    class Config:
        orm_mode = True

class DokterCreate(BaseModel):
    nama: str
    foto: str
    id_spesialis: int

class Dokter(DokterBase):
    id_spesialis: int

    class Config:
        orm_mode = True

class ReservasiBase(BaseModel):
    tanggal: date
    id_jam_kerja_dokter: int
    id_daftar_profil: int
    biaya: str
    status: int

class ReservasiCreate(ReservasiBase):
    pass

class ReservasiUpdateStatus(BaseModel):
    status: int

class Reservasi(ReservasiBase):
    id: int
    
    class Config:
        orm_mode = True

class ObatBase(BaseModel):
    nama: str
    dosis: str
    pemakaian: str
    harga: int
    foto: str
    id_spesialis: int
    id_penyakit: int
    durasi: int

class ObatCreate(ObatBase):
    pass

class Obat(ObatBase):
    id: int

    class Config:
        orm_mode = True

class HariBase(BaseModel):
    nama: str

class HariCreate(HariBase):
    pass

class Hari(HariBase):
    id: int

    class Config:
        orm_mode = True

class JamBase(BaseModel):
    jam_awal: time
    jam_akhir: time

class JamCreate(JamBase):
    pass

class Jam(JamBase):
    id: int

    class Config:
        orm_mode = True

class JamKerjaDokterBase(BaseModel):
    id_hari: int
    id_jam: int
    id_dokter: int

class JamKerjaDokterCreate(JamKerjaDokterBase):
    pass

class JamKerjaDokter(JamKerjaDokterBase):
    id: int

    class Config:
        orm_mode = True

class Profil(BaseModel):
    id: int
    nama: str
    jenis_kelamin: str
    notelp: str
    tanggal_lahir: date
    foto: str
    id_user: int

class ProfilUpdate(BaseModel):
    nama: str
    jenis_kelamin: str
    notelp: str
    tanggal_lahir: date
    foto: str

class AddProfil(BaseModel):
    nama: str
    jenis_kelamin: str
    notelp: str
    tanggal_lahir: date
    foto: str
    
class ProfilCreate(AddProfil):
    pass

class Profil(AddProfil):
    id: int
    
    class Config:
        orm_mode = True

class ProfilLainBase(BaseModel):
    id: int
    nama: str
    jenis_kelamin: str
    tanggal_lahir: date
    foto: str
    id_user: int

class ProfilLainUpdate(BaseModel):
    nama: str
    jenis_kelamin: str
    tanggal_lahir: date
    foto: str

class AddProfilLain(BaseModel):
    nama: str
    jenis_kelamin: str
    tanggal_lahir: date
    foto: str

class ProfilLainCreate(AddProfilLain):
    pass

class ProfilLain(AddProfilLain):
    id: int

    class Config:
        orm_mode = True

class DaftarProfilBase(BaseModel):
    id_profil: int
    id_profil_lain: int

class DaftarProfilCreate(DaftarProfilBase):
    pass

class DaftarProfil(DaftarProfilBase):
    id: int

    class Config:
        orm_mode = True

class LabBase(BaseModel):
    nama: str
    deskripsi: str
    id_penyakit: int

class Lab(LabBase):
    id: int
    
    class Config:
        orm_mode = True

class RadiologiBase(BaseModel):
    nama: str
    deskripsi: str
    foto: str
    id_penyakit: int

class Radiologi(RadiologiBase):
    id: int
    
    class Config:
        orm_mode = True

class PenyakitBase(BaseModel):
    nama: str

class Penyakit(PenyakitBase):
    id: int
    
    class Config:
        orm_mode = True

class DaftarProfilPenyakitBase(BaseModel):
    id_daftar_profil: int
    id_penyakit: int
    status: int
    id_reservasi: int


class DaftarProfilPenyakitCreate(DaftarProfilPenyakitBase):
    pass

class DaftarProfilPenyakitUpdateStatus(BaseModel):
    status: int

class DaftarProfilPenyakit(DaftarProfilPenyakitBase):
    id: int

    class Config:
        orm_mode = True

class UserBase(BaseModel):
    email: str
    password: str

class Hari(BaseModel):
    id: int
    nama: str

class Jam(BaseModel):
    id: int
    jam_awal: time
    jam_akhir: time