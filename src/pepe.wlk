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

