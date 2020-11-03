import comidas.*
class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	method satisfecho(){ return comidas.sum({ c => c.peso()}) >= peso * 0.01}
	method comer(comida){ comidas.add(comida)}
	method sacar(comida){ comidas.remove(comida)}
}


class Vegetariano inherits Comensal{
	
	override method leAgrada(unaComida){ return unaComida.esAptoVegetariano() and unaComida.valoracion() > 85}
	
	override method satisfecho(){ return super() + not comidas.all({ c => c.esAbundante()})}
}

class HambrePopular inherits Comensal {
	
	override method leAgrada(unaComida) { return unaComida.esAbundante()}
}

class DePaladarFino inherits Comensal {
	
	override method leAgrada(unaComida){ return unaComida.peso().between(150,300) and unaComida.valoracion() > 100}
	
	override method satisfecho(){ return super() + comidas.size().even()}
	
}