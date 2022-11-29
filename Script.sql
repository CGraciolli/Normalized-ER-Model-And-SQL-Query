--- creamos el esquema ---
create schema carolina_graciolli_siqueira authorization rgcngfnw;

--- tabla MODELOS ---
create table carolina_graciolli_siqueira.modelo(
				id_modelo integer not null, --- PK
				modelo varchar(30) not null,
				marca varchar(20) not null,
				empresa varchar(20) not null
				);

alter table carolina_graciolli_siqueira.modelo
	add constraint pk_modelo primary key (id_modelo);

-- tabla POLIZA ---
create table carolina_graciolli_siqueira.poliza(
				id_poliza integer not null, --PK
				aseguradora varchar(20) not null
				);

alter table carolina_graciolli_siqueira.poliza
	add constraint pk_poliza primary key (id_poliza);

--- tabla MONEDA ---
create table carolina_graciolli_siqueira.moneda(
				id_moneda integer not null, --PK
				nombre varchar(30) not null,
				region varchar(30) null
				);

alter table carolina_graciolli_siqueira.moneda
	add constraint pk_moneda primary key (id_moneda);


--- tabla REVISION ---
create table carolina_graciolli_siqueira.revision(
				km integer not null, --PK
				id_coche integer not null, --PK, FK --> coche
				fecha_compra date not null,
				importe integer not null,
				id_moneda integer not null default '001' --FK --> moneda
				);

alter table carolina_graciolli_siqueira.revision
	add constraint pk_revision primary key (km, id_coche);


--- tabla COCHE ---
create table carolina_graciolli_siqueira.coche(
				id_coche integer not null, --- PK
				id_modelo integer not null, --- FK  --> modelo
				id_poliza integer not null, --- FK --> poliza
				matricula varchar(10) not null,
				fecha_compra date not null,
				color varchar(20) not null,
				kilometrage integer not null
				);
			
alter table carolina_graciolli_siqueira.coche
	add constraint pk_coche primary key (id_coche);

--- FK---

alter table carolina_graciolli_siqueira.coche
	add constraint tipo_modelo foreign key (id_modelo)
	references carolina_graciolli_siqueira.modelo (id_modelo);

alter table carolina_graciolli_siqueira.coche
	add constraint numero_poliza foreign key (id_poliza)
	references carolina_graciolli_siqueira.poliza (id_poliza);

alter table carolina_graciolli_siqueira.revision
	add constraint revision_coche foreign key (id_coche)
	references carolina_graciolli_siqueira.coche(id_coche);

alter table carolina_graciolli_siqueira.revision
	add constraint tipo_moneda foreign key (id_moneda)
	references carolina_graciolli_siqueira.moneda(id_moneda);

-----------
--- DML ---
-----------

--- moneda ---
insert into carolina_graciolli_siqueira.moneda
	(id_moneda, nombre, region)
	values('001', 'euro', 'EU');

insert into carolina_graciolli_siqueira.moneda
	(id_moneda, nombre, region)
	values('002', 'dolar', 'USA');

insert into carolina_graciolli_siqueira.moneda
	(id_moneda, nombre, region)
	values('003', 'libra', 'UK');

--- modelo ---
insert into carolina_graciolli_siqueira.modelo
	(id_modelo, modelo, marca, empresa)
	values('001', 'modelo1', 'marca1', 'empresa1');

insert into carolina_graciolli_siqueira.modelo
	(id_modelo, modelo, marca, empresa)
	values('002', 'modelo2', 'marca2', 'empresa1');

insert into carolina_graciolli_siqueira.modelo
	(id_modelo, modelo, marca, empresa)
	values('003', 'modelo3', 'marca2', 'empresa1');

insert into carolina_graciolli_siqueira.modelo
	(id_modelo, modelo, marca, empresa)
	values('004', 'modelo4', 'marca3', 'empresa2');

insert into carolina_graciolli_siqueira.modelo
	(id_modelo, modelo, marca, empresa)
	values('005', 'modelo5', 'marca3', 'empresa2');

insert into carolina_graciolli_siqueira.modelo
	(id_modelo, modelo, marca, empresa)
	values('006', 'modelo6', 'marca3', 'empresa2');

--- poliza ---
insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('201', 'AS1');

insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('202', 'AS1');

insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('203', 'AS1');

insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('204', 'AS1');

insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('205', 'AS2');

insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('206', 'AS2');

insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('207', 'AS2');

insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('208', 'AS2');
	
insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('209', 'AS2');
	
insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('210', 'AS2');
	
insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('211', 'AS2');
	
insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('212', 'AS3');
	
insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('213', 'AS3');
	
insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('214', 'AS3');
	
insert into carolina_graciolli_siqueira.poliza
	(id_poliza, aseguradora)
	values ('215', 'AS3');

--- coche ---
insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('001', '001', '201', 'AAA0101', '2018-01-22', 'blanco', 12000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('002', '001', '202', 'AAA0131', '2018-04-22', 'negro', 13000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('003', '001', '203', 'ABA0101', '2018-01-22', 'rojo', 9500);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('004', '001', '204', 'ACA0101', '2019-01-22', 'blanco', 8000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('005', '002', '205', 'AAG0401', '2018-06-22', 'blanco', 11500);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('006', '002', '206', 'BBA0101', '2018-11-22', 'amarillo', 5500);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('007', '003', '207', 'ATU0101', '2019-01-22', 'blanco', 7800);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('008', '003', '208', 'AAD3101', '2020-11-22', 'negro', 12000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('009', '003', '209', 'BHT0101', '2020-01-22', 'blanco', 13000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('010', '004', '210', 'AAA7101', '2019-01-22', 'azul', 2000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('011', '005', '211', 'ACA7101', '2019-04-22', 'blanco', 12000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('012', '005', '212', 'FCA7101', '2019-03-22', 'negro', 10000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('013', '005', '213', 'ADT7101', '2019-05-22', 'rojo', 72000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('014', '006', '214', 'AWX7101', '2019-05-22', 'blanco', 12000);

insert into carolina_graciolli_siqueira.coche
	(id_coche, id_modelo, id_poliza, matricula, fecha_compra, color, kilometrage)
	values('015', '006', '215', 'QWX7101', '2020-05-22', 'blanco', 7600);

	
--- revision ---

insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '001', '2021-01-22', 20, '001');

insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (3000, '001', '2021-08-22', 23, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '002', '2021-01-22', 20, '001');

insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (4000, '002', '2022-01-22', 27, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '003', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '004', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '005', '2021-01-22', 25, '002');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '006', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '007', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '008', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '009', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (4000, '009', '2021-08-22', 30, '001');

insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (7000, '009', '2022-02-22', 28, '001');

insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '010', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '011', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '012', '2021-01-22', 15, '003');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '013', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (6500, '013', '2021-09-22', 28, '001');

insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '014', '2021-01-22', 20, '001');
	
insert into carolina_graciolli_siqueira.revision
	(km, id_coche, fecha, importe, id_moneda)
	values (1000, '015', '2021-01-22', 20, '001');