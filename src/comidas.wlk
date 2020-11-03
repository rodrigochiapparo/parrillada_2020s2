class Comida {
	var property peso = 0 
	var property esAptoVegetariano 
	var property valoracion = 0 
	
	method esAbundante(){ return peso > 250}
	
}

class Provoleta inherits Comida {
	var property tieneEspecias = true 
	
	override method esAptoVegetariano(){ return not tieneEspecias}
	
	method esEspecial(){ return self.esAbundante() or tieneEspecias }
	
	override method valoracion(){ return if (self.esEspecial()){ 120} else { 80}}
	
}

class HamburguesasDeCarne inherits Comida {
	
	var property panQueTiene
	
	override method peso(){ return 250}
	
	override method esAptoVegetariano(){ return false }
	
	override method valoracion(){ return 60 + panQueTiene.valoracion()}
}

object panIndustrial {
	
	method valoracion(){ return 0}
}

object panCasero {
	
	method valoracion(){ return 20}
}

object panDeMasaMadre {
	
	method valoracion(){ return 45}
}

class HamburguesasVegetarianas inherits HamburguesasDeCarne {
	var property deQueLegumbreEstaHecha
	
	override method esAptoVegetariano(){ return true}
	
	override method valoracion(){ return super() + (2 * deQueLegumbreEstaHecha.size().max(17))}
		
}

class Parillada inherits Comida{
	
	var property cortes = []
	
	override method peso() { return cortes.sum({ c => c.peso()})}
	
	override method esAptoVegetariano() { return false}
	
	override method valoracion() { return ((15 * self.maximaCalidadDeCortes()) - self.cantidadDeCortes()).max(0) }
	
	method maximaCalidadDeCortes() { return cortes.max({ c => c.calidad()}).calidad()}
	
	method cantidadDeCortes(){ return cortes.size()}
	
	method agregar(corte){ cortes.add(corte)}
}


class Cortes {
	var property nombre
	var property calidad
	var property peso
}
