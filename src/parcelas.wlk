import semillas.*

class Parcela {

	var property ancho
	var property largo
	var property plantas = []
	var property horasDeSolPorDia




	
	
	method cosecharPlantas(planta){
		plantas.remove(planta)
	}
	
	method superficie(){return ancho*largo}
	
	method cantidadMaxima(){
		if (ancho>largo){return self.superficie()/5}
		else {return self.superficie()/3 + largo() }
	}
	method tieneComplicaciones(){return
		plantas.any({planta=>planta.cuantasHorasDeSolTolera()<self.horasDeSolPorDia()})
	}
	
	
	method diferenciaDeHorasDeSol(planta){
		return (self.horasDeSolPorDia()-planta.cuantasHorasDeSolTolera())>=2
		
	}
	method superaLaCantidadMaxima(){return (plantas.size()+1)>self.cantidadMaxima()}
	method plantarPlantas(planta){
		if(self.diferenciaDeHorasDeSol(planta) or self.superaLaCantidadMaxima()){return self.error("NO SE PUEDE REGISTRAR")	}
		else {plantas.add(planta)}
	
/* saber la **cantidad máxima** de plantas que tolera, que se calcula de la siguiente manera: si el `ancho` es mayor que el `largo`, la cuenta es `superficie / 5`; si no `superficie / 3 + largo`;
* saber si **tiene complicaciones**, lo cual es así si alguna de sus plantas tolera menos sol del que recibe la parcela;

* poder **plantar una planta** que se recibe por parámetro. El efecto que produce es que se agregue a la colección. 
* Esto debe arrojar un error si al plantar se supera la cantidad máxima _o bien_ si la parcela recibe al menos 2 horas más de sol que los que la planta tolera.
*/
}