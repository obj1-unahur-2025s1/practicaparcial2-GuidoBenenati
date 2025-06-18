class Personaje {
var  fuerza
var inteligencia 
var rol
method fuerza() = fuerza

method potencialOfensivo()
method esGroso()=self.esInteligente() or self.esGrosoEnSuRol()
method esInteligente()
method esGrosoEnSuRol()
  
}
class Humano inherits Personaje {

override method esInteligente()=inteligencia >50
override method esGrosoEnSuRol()=rol.esGrosoEnSuRol(self)
override method potencialOfensivo()=fuerza*10+rol.potencialOfensivo()

}
class Orco inherits Personaje {
override method esInteligente()=false
override method esGrosoEnSuRol()=rol.esGrosoEnSuRol(self)
override method potencialOfensivo()=(fuerza*10+rol.potencialOfensivo())+(fuerza*10+rol.potencialOfensivo())*0.1

}

//ROLES//
class Guerrero{
method potencialOfensivo()=100
method esGrosoEnSuRol(unPersonaje)=unPersonaje.fuerza()>50
}

class Cazador{
var mascota
method potencialOfensivo()=mascota.potencialOfensivo()
method esGrosoEnSuRol(unPersonaje)=mascota.esLongeva()
}
class Brujo{
method potencialOfensivo()=0
method esGrosoEnSuRol(unPersonaje)=true
}


///MASCOTA//
class Mascota{
  var fuerza
  var edad
  var garras
  method esLongeva()=edad>10

  method potencialOfensivo()=if(garras)2*fuerza else{fuerza}
  
}

//LOCALIDADES//
class Lugar{
const personas=[]
var tamaño
method potencialOfensivoTotal()=personas.sum{x=>x.potencialOfensivo()}
method desalojar(){personas.clear()}
method agregar(unaPersona){personas.add(unaPersona)}
method alojar(listaDePersonas){listaDePersonas.forEach{x=>self.agregar(x)}}
}

class Aldea inherits Lugar{
override method alojar(listaDePersonas){if(listaDePersonas.size()<=tamaño){}else{listaDePersonas.forEach{x=>self.agregar(x)}}}

method losDiezMejores(unaLista){unaLista.sortedBy{x=>x.potencialOfensivo()}.taken(10)}

}


class Ciudad inherits Lugar{
override method potencialOfensivoTotal()=personas.sum{x=>x.potencialOfensivo()}+300
}



/////EJERITOS////
class Ejercito {
  method potencialOfensivoTotal()=integrantes.sum{x=>x.potencialOfensivo()}
  const integrantes=[]
  method cantidad() =integrantes.size()
  method agregarIntegrante(unIntegrante){integrantes.add(unIntegrante)}
  method agregarMuchosIntegrantes(listaIntegrantes){integrantes.addAll(listaIntegrantes)}
  method atacar(algo){
    if(self.potencialOfensivoTotal()>algo.potencialOfensivoTotal()){algo.desalojar();algo.alojar(integrantes)}else{}
    }
}