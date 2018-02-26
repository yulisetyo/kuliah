create schema kegiatan;
##
use kegiatan;
##
create table t_jabatan(
	kd_jabatan char(1) unique,
	nm_jabatan varchar(100),
	primary key(kd_jabatan)
) collate='latin1_swedish_ci';
##
create table t_golpang(
	kd_golpang char(2) unique,
	nm_golpang varchar(5),
	ur_golpang varchar(100),
	primary key(kd_golpang)
) collate='latin1_swedish_ci';
##
create table t_pegawai(
	nip varchar(18) unique,
	nama varchar(100),
	kd_jabatan char(1),
	kd_golpang char(2),
	primary key(nip)
) collate='latin1_swedish_ci';
##

##
##
##
##
##
##
##
##
##
##
##
##
