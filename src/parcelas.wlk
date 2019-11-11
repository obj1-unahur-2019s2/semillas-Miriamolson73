import semillas.*

class Parcela {

	var property ancho
	var property largo
	var property plantas = []
	var property horasDeSolPorDia

	method cosecharPlantas(planta) {
		plantas.remove(planta)
	}

	method superficie() {
		return ancho * largo
	}

	method cantidadMaxima() {
		if (ancho > largo) {
			return self.superficie() / 5
		} else {
			return self.superficie() / 3 + self.largo()
		}
	}

	method tieneComplicaciones() {
		return plantas.any({ planta => planta.cuantasHorasDeSolTolera() < self.horasDeSolPorDia() })
	}

	method diferenciaDeHorasDeSol(planta) {
		return (self.horasDeSolPorDia() - planta.cuantasHorasDeSolTolera()) >= 2
	}

	method superaLaCantidadMaxima() {
		return (plantas.size() + 1) > self.cantidadMaxima()
	}

	method plantarPlantas(planta) {
		if (self.diferenciaDeHorasDeSol(planta) or self.superaLaCantidadMaxima()) {
			self.error("NO SE PUEDE REGISTRAR")
		}
		plantas.add(planta)
	}

	method esIdealParaLaPlanta() {
		return plantas.all({ planta => planta.laParcelaResultaIdeal(self) })
	}

	method parcelasEcologicas() {
		return not self.tieneComplicaciones() and self.esIdealParaLaPlanta()
	}

	method parcelasIndusctriales() {
		return plantas.size() <= 2 and plantas.all({ planta => planta.esFuerte() })
	}

}

