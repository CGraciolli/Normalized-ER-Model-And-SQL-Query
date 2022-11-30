//we want model, brand, company, date of purchase, license plate, color, km_total, insurance company, insurance number

select m.model, b.brand, comp.company, c.date_of_purchase, c.license_plate, cl.color, c.km_total, ic.insurance_company, i.insurance_number
	from carolina_graciolli_siqueira.companies comp
	join carolina_graciolli_siqueira.brands b on comp.id_company = b.id_company
	join carolina_graciolli_siqueira.models m on b.id_brand = m.id_brand
	join carolina_graciolli_siqueira.cars c on b.id_model = c.id_model
	join carolina_graciolli_siqueira.colors cl on c.id_color = cl.id_color
	join carolina_graciolli_siqueira.insurances i on i.id_car = c.id_car
	join carolina_graciolli_siqueira.insurance_companies ic on i.id_insurance_company = ic.id_insurance_company
