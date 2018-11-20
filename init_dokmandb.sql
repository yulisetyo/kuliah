create schema `dokmandb`;

use `dokmandb`;

create table if not exists `versi_database` (
	id smallint(4) unsigned not null auto_increment,
	file_sql varchar(100) not null unique,
	ur_versi varchar(255) not null,
	created_at timestamp,
	updated_at timestamp,
	primary key(id)
) collate='utf8_unicode_ci';

create table if not exists `ref_agama` (
	id varchar(2) not null unique,
	nm_agama varchar(20) not null unique,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `ref_golpangkat` (
	id varchar(2) not null unique,
	nm_golpangkat varchar(5) not null unique,
	ur_golpangkat varchar(100) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `ref_eselon` (
	id varchar(2) not null unique,
	nm_eselon varchar(50) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `ref_unit` (
	id varchar(20) not null unique,
	nm_unit varchar(255) not null,
	tipe_unit varchar(3) not null,
	id_eselon varchar(2) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `ref_kelompok` (
	id smallint(3) unsigned not null auto_increment,
	id_unit varchar(20) not null,
	ketua varchar(20) not null,
	anggota varchar(20) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `ref_klasifikasi` (
	id varchar(1) not null unique,
	nm_klasifikasi varchar(50) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `ref_kualifikasi` (
	id varchar(1) not null unique,
	nm_kualifikasi varchar(50) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `ref_instruksi` (
	id varchar(1) not null unique,
	nm_instruksi varchar(50) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `ref_jns_dok` (
	id smallint(2) unsigned not null auto_increment,
	kd_jns_dok varchar(10) not null,
	nm_jns_dok varchar(255) not null unique,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key(id)
) collate='utf8_unicode_ci';

create table if not exists `ref_mutasi_dok` (
	id varchar(1) not null unique,
	nm_mutasi varchar(50) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `data_pegawai` (
	nip varchar(20) not null unique,
	nip_lama varchar(12) not null unique,
	nik varchar(20) not null unique,
	nama varchar(255) not null,
	no_karpeg varchar(12) not null unique,
	tgl_lahir date not null,
	kota_lahir varchar(12) not null,
	id_agama varchar(2) not null,
	sts_pernikahan enum('0', '1') not null,
	jns_kelamin varchar(1) not null,
	pendidikan varchar(4) not null,
	alamat varchar(255) not null,
	email varchar(255) not null,
	telp varchar(20) not null,
	golpangkat varchar(2) not null,
	tmt_golpangkat date not null,
	eselon varchar(2) not null,
	tmt_eselon date not null,
	id_unit varchar(20) not null,
	tmt_unit date not null,
	npwp varchar(30) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (nip)
) collate='utf8_unicode_ci';

create table if not exists `data_pengganti` (
	id int(6) unsigned not null auto_increment,
	id_unit varchar(20) not null,
	tmt_mulai date not null,
	tmt_selesai date not null,
	no_dasar_hukum varchar(100) not null,
	tgl_dasar_hukum date not null,
	nip_definitif varchar(20) not null,
	nip_pengganti varchar(20) not null,
	uraian varchar(255) not null,
	keterangan varchar(255) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key(id)
) collate='utf8_unicode_ci';

create table if not exists `data_sekretaris`(
	id smallint(4) unsigned not null auto_increment,
	id_unit varchar(20) not null,
	nip_atasan varchar(20) not null,
	nip_sekretaris varchar(20) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `data_dok_masuk`(
	id int(6) unsigned not null auto_increment,
	hashkey varchar(255) not null unique,
	tahun year not null,
	kd_jns_dok varchar(10) not null, 
	no_dok varchar(50) not null,
	tgl_dok date not null,
	asal_dok varchar(20) not null,
	hal_dok varchar(255) not null,
	tujuan_dok varchar(20) not null,
	klasifikasi varchar(1) not null,
	kualifikasi varchar(1) not null,
	lampiran int(2) unsigned not null,
	jns_lampiran varchar(20) not null,
	sts_asli enum ('a', 't') not null,
	sts_aktif enum('0', '1', '2') not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `data_mutasi_dok` (
	id int(8) unsigned not null auto_increment,
	id_dok_masuk int(6) unsigned not null,
	jns_mutasi enum('1', '2', '3') not null,
	dari_unit varchar(20) not null,
	dari_nip varchar(20) not null,
	kepada_unit varchar(20) not null,
	kepada_nip varchar(20) not null,
	kualifikasi varchar(1) not null,
	instruksi varchar(50) not null,
	catatan varchar(255) not null,
	sts_aktif enum('0', '1', '2') not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `data_file_dok_masuk`(
	id int(8) unsigned not null auto_increment,
	id_dok_masuk int(6) unsigned not null,
	nm_file_dok_masuk varchar(255) not null,
	sts_aktif enum('0', '1', '2') not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `data_terima_dok` (
	id bigint(10) unsigned not null auto_increment,
	id_dok_masuk int(6) unsigned not null,
	tgl_terima timestamp not null,
	id_unit varchar(20) not null,
	nip varchar(20) not null,
	catatan varchar(255) not null,
	ip varchar(20) not null,
	user_id smallint unsigned not null,
	created_at timestamp,
	updated_at timestamp,
	primary key (id)
) collate='utf8_unicode_ci';

create table if not exists `versi_database` (
	id smallint(4) unsigned not null auto_increment,
	file_sql varchar(100) not null unique,
	ur_versi varchar(255) not null,
	created_at timestamp,
	updated_at timestamp,
	primary key(id)
) collate='utf8_unicode_ci';

insert into `versi_database` (file_sql, ur_versi) values ('init_dokmandb.sql', 'inisiasi database untuk aplikasi');

insert into `ref_agama` (id, nm_agama, ip) values ('1', 'Islam', '127.0.0.0');
insert into `ref_agama` (id, nm_agama, ip) values ('2', 'Kristen', '127.0.0.0');
insert into `ref_agama` (id, nm_agama, ip) values ('3', 'Katholik', '127.0.0.0');
insert into `ref_agama` (id, nm_agama, ip) values ('4', 'Hindu', '127.0.0.0');
insert into `ref_agama` (id, nm_agama, ip) values ('5', 'Budha', '127.0.0.0');
insert into `ref_agama` (id, nm_agama, ip) values ('6', 'Konghuchu', '127.0.0.0');
insert into `ref_agama` (id, nm_agama, ip) values ('7', 'Aliran Kepercayaan', '127.0.0.0');

insert into `ref_eselon` (id, nm_eselon, ip) values ('11', 'Eselon IA', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('12', 'Eselon IB', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('21', 'Eselon IIA', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('22', 'Eselon IIB', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('31', 'Eselon IIIA', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('32', 'Eselon IIIB', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('41', 'Eselon IVA', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('42', 'Eselon IVB', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('51', 'Eselon VA', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('52', 'Eselon VB', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('77', 'Pejabat Fungsional', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('88', 'Pegawai yang diperbantukan', '127.0.0.0');
insert into `ref_eselon` (id, nm_eselon, ip) values ('99', 'Pelakasana', '127.0.0.0');

insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('11', 'I/a', 'Juru Muda', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('12', 'I/b', 'Juru Muda Tingkat I', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('13', 'I/c', 'Juru', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('14', 'I/d', 'Juru Tingkat I', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('21', 'II/a', 'Pengatur Muda', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('22', 'II/b', 'Pengatur Muda Tingkat I', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('23', 'II/c', 'Pengatur', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('24', 'II/d', 'Pengatur Tingkat I', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('31', 'III/a', 'Penata Muda', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('32', 'III/b', 'Penata Muda Tingkat I', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('33', 'III/c', 'Penata', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('34', 'III/d', 'Penata Tingkat I', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('41', 'IV/a', 'Pembina', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('42', 'IV/b', 'Pembina Tingkat I', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('43', 'IV/c', 'Pembina Utama Muda', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('44', 'IV/d', 'Pembina Utama Madya', '127.0.0.0');
insert into `ref_golpangkat` (id, nm_golpangkat, ur_golpangkat, ip) values ('45', 'IV/e', 'Pembina Utama', '127.0.0.0');

insert into `ref_mutasi_dok` (id, nm_mutasi, ip) values ('1', 'Disposisi', '127.0.0.0');
insert into `ref_mutasi_dok` (id, nm_mutasi, ip) values ('2', 'Penerusan', '127.0.0.0');

insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('BA', 'Berita Acara', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('FAKS', 'Faksimile', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('KET', 'Surat Keterangan', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('KET', 'Surat Ketetapan', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('KWT', 'Surat Kawat', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('LAP', 'Laporan', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('MO', 'Memo', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('ND', 'Nota Dinas', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('PEM', 'Pemberitahuan', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('PENG', 'Pengumuman', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('PRIN', 'Surat Perintah', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('S', 'Surat Dinas', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('SE', 'Surat Edaran', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('SI', 'Surat Izin', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('SK', 'Surat Keputusan', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('SP', 'Surat Pengantar', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('ST', 'Surat Tugas', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('S-pem', 'Surat Pengajuan Pembukaan Rekening', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('S-pen', 'Surat Pengajuan Penutupan Rekening', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('TLG', 'Telegram', '127.0.0.0');
insert into `ref_jns_dok` (kd_jns_dok, nm_jns_dok, ip) values ('UND', 'Undangan', '127.0.0.0');
