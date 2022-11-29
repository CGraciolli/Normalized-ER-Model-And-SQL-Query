--- creating a schema ---
create schema carolina_graciolli_siqueira authorization rgcngfnw;

--- table MODEL ---
create table carolina_graciolli_siqueira.model(
				id_model integer not null, -- PK
				id_brand integer not null, -- FK
				name varchar(30) not null,
				);

alter table carolina_graciolli_siqueira.model
	add constraint pk_model primary key (id_model);

--- table BRAND ---
create table carolina_graciolli_siqueira.brand(
				id_brand integer not null, -- PK
				id_company integer not null, -- FK
				name varchar(30) not null,
				);

alter table carolina_graciolli_siqueira.brand
	add constraint pk_brand primary key (id_brand);

--- table COMPANY ---
create table carolina_graciolli_siqueira.company(
				id_company integer not null, -- PK
				name varchar(30) not null,
				);

alter table carolina_graciolli_siqueira.company
	add constraint pk_company primary key (id_company);

-- table INSURANCE ---
create table carolina_graciolli_siqueira.insurance(
				id_insurance integer not null, -- PK
				id_insurance_company integer not null, --FK
				);

alter table carolina_graciolli_siqueira.insurance
	add constraint pk_insurance primary key (id_insurance);

--- table INSURANCE_COMPANY ---
create table carolina_graciolli_siqueira.insurance_company(
				id_insurance_company integer not null, -- PK
				name varchar(50) not null,
				);

alter table carolina_graciolli_siqueira.insurance_company
	add constraint pk_insurance_company primary key (id_insurance_company);

--- table CURRENCY ---
create table carolina_graciolli_siqueira.currency(
				id_currency integer not null, -- PK
				name varchar(30) not null,
				region varchar(30) null
				);

alter table carolina_graciolli_siqueira.currency
	add constraint pk_currency primary key (id_currency);

--- table INSPECTION ---
create table carolina_graciolli_siqueira.inspection(
				km integer not null, --PK
				id_car integer not null, --PK, FK --> car
				id_currency integer not null default '001' --FK --> currency
				date date not null,
				price integer not null,
				);

alter table carolina_graciolli_siqueira.inspection
	add constraint pk_inspection primary key (km, id_car);

--- table COLOR ---
create table carolina_graciolli_siqueira.color(
				id_color integer not null, -- PK
				name varchar(20) not null,
				);

alter table carolina_graciolli_siqueira.color
	add constraint pk_color primary key (id_color);

--- tabla CAR ---
create table carolina_graciolli_siqueira.car(
				id_car integer not null, -- PK
				id_model integer not null, -- FK  --> model
				id_color integer not null, -- FK --> color
				id_insurance integer not null, -- FK --> insurance
				date_of_purchase date not null,
				license_plate varchar(10) not null,
				km_total integer not null,
				);
			
alter table carolina_graciolli_siqueira.car
	add constraint pk_car primary key (id_car);

--- FK---
alter table carolina_graciolli_siqueira.brand
	add constraint brand_company foreign key (id_company)
	references carolina_graciolli_siqueira.company (id_company);

alter table carolina_graciolli_siqueira.model
	add constraint model_brand foreign key (id_brand)
	references carolina_graciolli_siqueira.brand (id_brand);

alter table carolina_graciolli_siqueira.insurance
	add constraint which_company foreign key (id_insurance_company)
	references carolina_graciolli_siqueira.insurance_company (id_insurance_company);

alter table carolina_graciolli_siqueira.car
	add constraint type_model foreign key (id_model)
	references carolina_graciolli_siqueira.model (id_model);

alter table carolina_graciolli_siqueira.car
	add constraint number_insurance foreign key (id_insurance)
	references carolina_graciolli_siqueira.insurance (id_insurance);

alter table carolina_graciolli_siqueira.car
	add constraint car_color foreign key (id_color)
	references carolina_graciolli_siqueira.color (id_color);

alter table carolina_graciolli_siqueira.inspection
	add constraint inspection_car foreign key (id_car)
	references carolina_graciolli_siqueira.car(id_car);

alter table carolina_graciolli_siqueira.inspection
	add constraint type_currency foreign key (id_currency)
	references carolina_graciolli_siqueira.currency(id_currency);

-----------
--- DML ---
-----------

--- currency ---
insert into carolina_graciolli_siqueira.currency
	(id_currency, name, region)
	values('001', 'euro', 'EU');

insert into carolina_graciolli_siqueira.currency
	(id_currency, name, region)
	values('002', 'dolar', 'USA');

insert into carolina_graciolli_siqueira.currency
	(id_currency, name, region)
	values('003', 'pound', 'UK');

--- company ---
insert into carolina_graciolli_siqueira.company
	(id_company, name)
	values('001', 'company1')

insert into carolina_graciolli_siqueira.company
	(id_company, name)
	values('002', 'company2')

--- brand ---
insert into carolina_graciolli_siqueira.brand
	(id_brand, id_company, name)
	values('001', '001', 'brand1');

insert into carolina_graciolli_siqueira.brand
	(id_brand, id_company, name)
	values('002', '001', 'brand2');

insert into carolina_graciolli_siqueira.brand
	(id_brand, id_company, name)
	values('003', '002', 'brand3');

--- model ---
insert into carolina_graciolli_siqueira.model
	(id_model, id_brand, name)
	values('001', '001', 'model1');

insert into carolina_graciolli_siqueira.model
	(id_model, id_brand, name)
	values('002', '002', 'model2');

insert into carolina_graciolli_siqueira.model
	(id_model, id_brand, name)
	values('003', '002', 'model3');

insert into carolina_graciolli_siqueira.model
	(id_model, id_brand, name)
	values('004', '003', 'model4');

insert into carolina_graciolli_siqueira.model
	(id_model, id_brand, name)
	values('005', '003', 'model5');

insert into carolina_graciolli_siqueira.model
	(id_model, id_brand, name)
	values('006', '003', 'model6');

--- insurance_company ---
insert into carolina_graciolli_siqueira.insurance_company
	(id_insurance_company, name)
	values('001', 'IC1');

insert into carolina_graciolli_siqueira.insurance_company
	(id_insurance_company, name)
	values('002', 'IC2');

insert into carolina_graciolli_siqueira.insurance_company
	(id_insurance_company, name)
	values('003', 'IC3');

--- insurance ---
insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('201', '001');

insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('202', '001');

insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('203', '001');

insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('204', '001');

insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('205', '002');

insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('206', '002');

insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('207', '002');

insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('208', '002');
	
insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('209', '002');
	
insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('210', '002');
	
insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('211', '002');
	
insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('212', '003');
	
insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('213', '003');
	
insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('214', '003');
	
insert into carolina_graciolli_siqueira.insurance
	(id_insurance, id_insurance_company)
	values ('215', '003');

--- color ---
insert into carolina_graciolli_siqueira.color
	(id_color, name)
	values('001', 'white')

insert into carolina_graciolli_siqueira.color
	(id_color, name)
	values('002', 'black')

insert into carolina_graciolli_siqueira.color
	(id_color, name)
	values('003', 'gray')

insert into carolina_graciolli_siqueira.color
	(id_color, name)
	values('004', 'red')

--- car ---
insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('001', '001', '003' '201', '2018-01-22', 'AAA0101',  12000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('002', '001', '004' '202', '2018-04-22', 'AAA0131', 13000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('003', '001', '002' '203', '2018-01-22', 'ABA0101', 500);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('004', '001', '001' '204', '2019-01-22', 'ACA0101',  8000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('005', '002', '001' '205', '2018-06-22', 'AAG0401',  11500);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('006', '002', '002' '206', '2018-11-22', 'BBA0101', , 5500);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('007', '003', '001' '207', '2019-01-22', 'ATU0101',  7800);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('008', '003', '002' '208', '2020-11-22', 'AAD3101', 12000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('009', '003', '002' '209', '2020-01-22', 'BHT0101',  13000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('010', '004', '001' '210', '2019-01-22', 'AAA7101', 000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('011', '005', '004' '211', '2019-04-22', 'ACA7101',  12000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('012', '005', '001' '212', '2019-03-22', 'FCA7101', 10000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('013', '005', '001' '213', '2019-05-22', 'ADT7101', 2000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('014', '006', '003' '214', '2019-05-22', 'AWX7101',  12000);

insert into carolina_graciolli_siqueira.car
	(id_car, id_model, id_color, id_insurance, date_of_purchase, license_plate, km_total)
	values('015', '006', '001' '215', '2020-05-22', 'QWX7101',  7600);

	
--- inspection ---

insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '001', '001', '2021-01-22', 20);

insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (3000, '001', '001', '2021-08-22', 23);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '002', '001', '2021-01-22', 20);

insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (4000, '002', '001', '2022-01-22', 27);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '003', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '004', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '005', '002', '2021-01-22', 25);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '006', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '007', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '008', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '009', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (4000, '009', '001', '2021-08-22', 30);

insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (7000, '009', '001', '2022-02-22', 28);

insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '010', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '011', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '012', '003', '2021-01-22', 15);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '013', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (6500, '013', '001', '2021-09-22', 28);

insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '014', '001', '2021-01-22', 20);
	
insert into carolina_graciolli_siqueira.inspection
	(km, id_car, id_currency, date, price)
	values (1000, '015', '001', '2021-01-22', 20);