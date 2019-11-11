import parcelas.*

class Planta {

	var property anio
	var property altura

	method esFuerte() {
		return self.cuantasHorasDeSolTolera() > 10
	}

	method daNuevaSemillas() {
		return self.esFuerte()
	}

	method espacioQueOcupa()

	method cuantasHorasDeSolTolera()

	method laParcelaResultaIdeal()

}

class Menta inherits Planta {

	override method cuantasHorasDeSolTolera() {
		return 6
	}

	override method daNuevaSemillas() {
		return super() or self.altura() > 0.4
	}

	override method espacioQueOcupa() {
		return self.altura() * 3
	}

	method laParcelaResultaIdeal(parcela) {
		return parcela.superficie() > 6
	}

}

class Soja inherits Planta {

	override method cuantasHorasDeSolTolera() {
		if (self.altura() < 0.5) {
			return 6
		} else if (self.altura().between(0.5, 1)) {
			return 7
		} else {
			return 9
		}
	}

	method laParcelaResultaIdeal(parcela) {
		return parcela.horasDeSolPorDia() == self.cuantasHorasDeSolTolera()
	}

	// la **soja común** va bien si la cantidad de sol que recibe la parcela es exactamente igual a los que ella tolera;
	override method daNuevaSemillas() {
		return super() or (self.anio() < 2007 and self.altura() > 1)
	}

	override method espacioQueOcupa() {
		return self.altura() / 2
	}

}

class Quinoa inherits Planta {

	var property cuantasHorasDeSolTolera

	override method daNuevaSemillas() {
		return super() or self.anio() < 2005
	}

	override method espacioQueOcupa() {
		return 0.5
	}

	method laParcelaResultaIdeal(parcela) {
		return parcela.plantas().all({ planta => planta.altura() < 1.5 })
	}

// la **quinoa** es bajita y por eso anda mejor en parcelas en las que no haya ninguna planta cuya altura supere los 1.5 metros;
}

class SojaTransgenica inherits Soja {

	override method daNuevaSemillas() {
		return false
	}

	override method laParcelaResultaIdeal(parcela) {
		return parcela.plantas().size() == 1
	}

// la **soja transgénica** está pensada como monocultivo, así que prefiere parcelas cuya cantidad máxima de plantas sea igual a 1.
}

class HiervaBuena inherits Menta {

	override method espacioQueOcupa() {
		return super() * 2
	}

}

