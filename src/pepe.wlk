object pepe {
	var categoria
	var resultado
	var presentismo
	var inasistencias = 0
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
	method resultado(_resultado){
		resultado = _resultado
	}
	
	method presentismo(_presentismo){
		presentismo = _presentismo
	}
	
	method aumentarInasistencias(cantidad){
		inasistencias += cantidad
	}
	
	method reiniciarInasistencias(){
		inasistencias = 0
	}
	
	method neto(){
		return categoria.neto()
	}
	
	method inasistencias(){
		return inasistencias
	}
	
	
	method sueldo(){
		return self.neto() + resultado.bono(self) + presentismo.bono(self)
		/* habia usado resultado.bono(self.neto()) pero si escala / cambia 
		 * la forma de calcularse conviene pasar el objeto y que el otro objeto 
		 * decida como implementar el bono
		 */ 
		 
	}
	
	
}


object gerente {
	method neto(){
		return 15000
	}
	
}

object cadete {
	method neto(){
		return 20000
	}
}

object vendedor {
	const neto = 16000
	var muchasVentas = false
	
	method activarAumentoPorMuchasVentas(){
		muchasVentas = true
		
	}
	method desactivarAumentoPorMuchasVentas(){
		muchasVentas = false
	}
	
	method neto(){
		return if (muchasVentas) neto * 1.25 else neto
	}
}

object medioTiempo {
	var categoriaBase
	
	method categoriaBase(_categoriaBase){
		categoriaBase = _categoriaBase
	}
	
	method neto(){
		return categoriaBase.neto() / 2
	}
}


object porcentaje{
	method bono(persona){
		return persona.neto() * 0.1
	}
}

object fijo {
	method bono(persona){
		return 800
	}
}

object nulo {
	method bono(any){
		return 0
	}
	
}


object normal {
	method bono(persona){
		if (persona.inasistencias() == 0){
			return 2000
		} else if (persona.inasistencias() == 1) {
			return 1000
		} else return 0
	}
}

object ajuste {
	method bono(persona){
		return if (persona.inasistencias() == 0) 100 else 0
	}
}

object demagogico {
	method bono(persona){
		return if (persona.neto() < 18000) 500 else 300
		
	}
}


object sofia {
	var categoria
	var resultado
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
	method resultado(_resultado){
		resultado = _resultado
	}
	
	method neto(){
		return categoria.neto()
	}
	
	method sueldo(){
		return self.neto() + resultado.bono(self)

	}
}

object roque {
	const neto = 28000
	const bonoAdicional = 9000
	var resultado
		
	method resultado(_resultado){
		resultado = _resultado
	}
	
	method neto(){
		return neto
	}
	
	method sueldo(){
		return self.neto() + resultado.bono(self) + bonoAdicional

	}
}


object ernesto {
	var compa
	var presentismo
	
	method compa(_compa){
		compa = _compa
	}
	
	method presentismo(_presentismo){
		presentismo = _presentismo
	}
	
	method inasistencias(){
		return 0
	}
	
	method neto(){
		return compa.neto()
	}
	
	method sueldo(){
		return self.neto() + presentismo.bono(self)
	}
	
}


// se pueden llamar: bonoResultado.valor(self)
// agregar metodos resultado() presentismo() a cada persona para que si mismo lo calcule (y para test)
// se puede llamar empleado en vez de persona en los argumentos que esperan los bonos