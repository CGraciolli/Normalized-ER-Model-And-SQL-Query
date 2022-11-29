select m.modelo, m.marca, m.empresa, c.fecha_compra, c.matricula, c.color, c.kilometrage, p.aseguradora, p.id_poliza
	from carolina_graciolli_siqueira.modelo m
		join carolina_graciolli_siqueira.coche c on m.id_modelo = c.id_modelo
			join carolina_graciolli_siqueira.poliza p on c.id_poliza = p.id_poliza;
