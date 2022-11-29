//we want model, brand, company, date of purchase, license plate, color, km_total, insurance company, insurance number

select m.name, b.name., comp.name, c.date_of_purchase, c.license_plate, cl.name, c.km_total, ic.name, i.id_insurance
	from carolina_graciolli_siqueira.company comp
	join carolina_graciolli_siqueira.brand b on comp.id_company = b.id_company
	join carolina_graciolli_siqueira.model m on b.id_brand = m.id_brand
	join carolina_graciolli_siqueira.car c on b.id_model = c.id_model
	join carolina_graciolli_siqueira cl on c.id_color = cl.id_color
	join carolina_graciolli_siqueira.insurance i on i.id_insurance = c.id_insurance
	join carolina_graciolli_siqueira.insurance_company ic on i.id_insurance_company = ic.id_insurance_company
