from sqlalchemy import Boolean, Column, Integer, String, ForeignKey, Text, Date, Time
from database import Base
from sqlalchemy.orm import relationship

class User(Base):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String(255), unique=True)
    password = Column(String(255), unique=False)

    profil = relationship("Profil", back_populates="user")
    profil_lain = relationship("ProfilLain", back_populates="user")

class Spesialis(Base):
    __tablename__ = "spesialis"

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)
    pengertian = Column(Text, nullable=False)
    kondisi = Column(Text, nullable=False)
    pengobatan = Column(Text, nullable=False)
    foto = Column(String(255), nullable=False)

    dokter = relationship("Dokter", back_populates="spesialis")
    obat = relationship("Obat", back_populates="spesialis")

class Dokter(Base):
    __tablename__ = "dokter"

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)
    foto = Column(String(255), nullable=True)
    id_spesialis = Column(Integer, ForeignKey("spesialis.id"), nullable=False)

    spesialis = relationship("Spesialis", back_populates="dokter")
    jam_kerja_dokter = relationship("JamKerjaDokter", back_populates="dokter")

class Profil(Base):
    __tablename__ = "profil"

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)
    jenis_kelamin = Column(String(255), nullable=False)
    notelp = Column(String(255), nullable=False)
    tanggal_lahir = Column(Date, nullable=False)
    foto = Column(String(255), nullable=False)
    id_user = Column(Integer, ForeignKey('users.id'), unique=True, nullable=False)

    user = relationship("User", back_populates="profil")
    daftar_profil = relationship("DaftarProfil", back_populates="profil")

class ProfilLain(Base):
    __tablename__ = 'profil_lain'

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)
    jenis_kelamin = Column(String(255), nullable=False)
    tanggal_lahir = Column(Date, nullable=False)
    foto = Column(String(255), nullable=False)
    id_user = Column(Integer, ForeignKey('users.id'), unique=True, nullable=False)

    daftar_profil = relationship("DaftarProfil", back_populates="profil_lain")
    user = relationship("User", back_populates="profil_lain")

class DaftarProfil(Base):
    __tablename__ = 'daftar_profil'

    id = Column(Integer, primary_key=True, index=True)
    id_profil = Column(Integer, ForeignKey('profil.id'), nullable=True)
    id_profil_lain = Column(Integer, ForeignKey('profil_lain.id'), nullable=True)

    profil = relationship("Profil", back_populates="daftar_profil")
    profil_lain = relationship("ProfilLain", back_populates="daftar_profil")
    reservasi = relationship("Reservasi", back_populates="daftar_profil")
    daftar_profil_penyakit = relationship("DaftarProfilPenyakit", back_populates="daftar_profil")

class JamKerjaDokter(Base):
    __tablename__ = "jam_kerja_dokter"

    id = Column(Integer, primary_key=True, index=True)
    id_hari = Column(Integer, ForeignKey("hari.id"), nullable=False)
    id_jam = Column(Integer, ForeignKey("jam.id"), nullable=False)
    id_dokter = Column(Integer, ForeignKey("dokter.id"), nullable=False)

    hari = relationship("Hari", back_populates="jam_kerja_dokter")
    jam = relationship("Jam", back_populates="jam_kerja_dokter")
    dokter = relationship("Dokter", back_populates="jam_kerja_dokter")
    reservasi = relationship("Reservasi", back_populates="jam_kerja_dokter")
    
class Reservasi(Base):
    __tablename__ = 'reservasi'

    id = Column(Integer, primary_key=True, index=True)
    tanggal = Column(Date, nullable=False)
    id_jam_kerja_dokter = Column(Integer, ForeignKey('jam_kerja_dokter.id'), nullable=False)
    id_daftar_profil = Column(Integer, ForeignKey('daftar_profil.id'), nullable=False)
    biaya = Column(String(50), nullable=False)
    status = Column(Integer, nullable=False)

    jam_kerja_dokter = relationship("JamKerjaDokter", back_populates="reservasi")
    daftar_profil = relationship("DaftarProfil", back_populates="reservasi")
    daftar_profil_penyakit = relationship("DaftarProfilPenyakit", back_populates="reservasi")

class Penyakit(Base):
    __tablename__ = 'penyakit'

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)

    radiologi = relationship('Radiologi', back_populates='penyakit')
    lab = relationship('Lab', back_populates='penyakit')
    obat = relationship('Obat', back_populates='penyakit')
    daftar_profil_penyakit = relationship('DaftarProfilPenyakit', back_populates='penyakit')

class Radiologi(Base):
    __tablename__ = 'radiologi'

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)
    deskripsi = Column(Text, nullable=False)
    foto = Column(String(255), nullable=False)
    id_penyakit = Column(Integer, ForeignKey('penyakit.id'), nullable=False)

    penyakit = relationship('Penyakit', back_populates='radiologi')

class Lab(Base):
    __tablename__ = 'lab'

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)
    deskripsi = Column(Text, nullable=False)
    id_penyakit = Column(Integer, ForeignKey('penyakit.id'), nullable=False)

    penyakit = relationship('Penyakit', back_populates='lab')

class Obat(Base):
    __tablename__ = "obat"

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)
    dosis = Column(String(255), nullable=False)
    pemakaian = Column(String(255), nullable=False)
    harga = Column(String(255), nullable=False)
    foto = Column(String(255), nullable=False)
    id_spesialis = Column(Integer, ForeignKey("spesialis.id"), nullable=False)
    id_penyakit = Column(Integer, ForeignKey("penyakit.id"), nullable=False)
    durasi = Column(Integer, nullable=False)

    spesialis = relationship("Spesialis", back_populates="obat")
    penyakit = relationship('Penyakit', back_populates='obat')

class Hari(Base):
    __tablename__ = "hari"

    id = Column(Integer, primary_key=True, index=True)
    nama = Column(String(50), nullable=False)

    jam_kerja_dokter = relationship("JamKerjaDokter", back_populates="hari")

class Jam(Base):
    __tablename__ = "jam"

    id = Column(Integer, primary_key=True, index=True)
    jam_awal = Column(Time, nullable=False)
    jam_akhir = Column(Time, nullable=False)

    jam_kerja_dokter = relationship("JamKerjaDokter", back_populates="jam")

class DaftarProfilPenyakit(Base):
    __tablename__ = "daftar_profil_penyakit"

    id = Column(Integer, primary_key=True, index=True)
    id_daftar_profil = Column(Integer, ForeignKey("daftar_profil.id"), nullable=False)
    id_penyakit = Column(Integer, ForeignKey("penyakit.id"), nullable=False)
    status = Column(Integer, nullable=False)
    id_reservasi = Column(Integer, ForeignKey("reservasi.id"), nullable=False)

    daftar_profil = relationship("DaftarProfil", back_populates="daftar_profil_penyakit")
    penyakit = relationship("Penyakit", back_populates="daftar_profil_penyakit")
    reservasi = relationship("Reservasi", back_populates="daftar_profil_penyakit")