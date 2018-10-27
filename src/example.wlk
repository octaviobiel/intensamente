class NoSePuedeAsentarException inherits Exception{}
object riley{
	var property felicidad = 1000
	var property emocion
	var recuerdosDelDia =[]
	var pensamientosCentrales = #{}
	
	method vivirEvento(_evento){
		recuerdosDelDia.add(_evento)
	}
	
	method recuerdosRecientes(){
		recuerdosDelDia.reverse().take(5)
	}
	
	method pensamientosCentrales(){
		return pensamientosCentrales
	}
	
	method pensamientosCentralesDificilesDeExplicar(){
		return pensamientosCentrales.filter({pensamiento => pensamiento.length()>10})
	}
}

object alegria{
	method efecto(_persona, _evento){
		if (_persona.felicidad() > 500){
			_persona.emocion(self)
			_persona.pensamientosCentrales().add(_evento)
		}
	}
}

object triste{
	method asentar(_persona, _evento){
		_persona.pensamientosCentrales().add(_evento)
		var nuevaFelicidad = _persona.felilcidad()*0.9
		if (nuevaFelicidad < 1)
			throw new NoSePuedeAsentarException()
			_persona.felicidad(nuevaFelicidad)
	}
}

//asi es la mas pete, despues se puede crear una class e instanciar o por herencia

object disgusto{
	method asentar(_persona, _evento){}
}

object furioso{
	method asentar(_persona, _evento){}
}

object temeroso{
	method asentar(_persona){}
}

class Evento{
	var emocion
	var descripcion
	var fecha
	
	constructor(_emocion, _descripcion, _fecha){
		emocion = _emocion
		descripcion = _descripcion
		fecha = _fecha
	}
	
	method emocion() = emocion
	method asentar(_persona){
		emocion.asentar(_persona, self)
	}
}

