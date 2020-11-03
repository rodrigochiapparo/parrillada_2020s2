import comidas.*
import comensales.*

object cocina {
	
	var property comidas = []
	
	method tieneBuenaOfertaVegetariana() { return self.comidasVegetarianas() - self.comidasNoVegetarianas() <= 2}
	
	method comidasVegetarianas(){ return comidas.filter({ c => c.esAptoVegetariano()})}
	
	method comidasNoVegetarianas(){ return comidas.filter({ c => not c.esAptoVegetariano()})}
	
	method platoFuerteCarnivoro() { return self.comidasNoVegetarianas().max({ c => c.valoracion()})}
	
	method comidasQueLeGustanA(comensal){ return comensal.comidas()}
	
	method elegirPlatoPara(comensal, plato){ 
		if (comensal.leAgrada(plato)) { comidas.remove(plato) ; comensal.comidas().add(plato) }
		else {self.error(" No le gusta el plato")}
	}
}