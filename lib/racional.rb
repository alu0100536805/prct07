#! /usr/bin/ruby

#Fichero para el desarrollo de la clase Fraccion

require "gcd.rb"
require "mcm.rb"

class Fraccion #Definición de la clase Fraccion.
	include Comparable		#Incluimos el módulo Comparable.

	def initialize(num, den) 	#método para inicializar las variables
		divisor = gcd(num, den) #obtenemos el gcd entre numerador y denominador para simplificar
		@num = num/divisor	
		@den = den/divisor
	end

	#Creamos los setters
	def num()
		@num
	end

	def denom()
		@den
	end
	
	#Hacemos la conversion a string
	def to_s()
		"#{@num}/#{@den}"
	end 
	
	#Hacemos la conversion a flotante
	def to_float()
		@num/@den
	end

	#Definimos la igualdad
	def ==(other)
		((@num == other.num) && (@den == other.denom))
	end 

	#Definimos el reciproco
	def reciproco()
		Fraccion.new(@den,@num)
	end
	
	#Definimos el opuesto
	def -@()
		Fraccion.new(-@num, @den)
	end

	#Definimos el valor absoluto
	def abs
		Fraccion.new(@num.abs, @den.abs)
	end

	#redefinimos la funcion resto
	def %(other)
		((@num * other.denom) % (@den * other.num))	
	end

	#redefinimos el operador +
	def +(other)
		aux = mcm(@den, other.denom)           #mcm de los denominadores
                Fraccion.new(((aux/@den)*@num)+((aux/other.denom)*other.num),aux) #suma de los objetos 
	end

	#Redefinimos el operador -
	def -(other)
		aux = mcm(@den, other.denom)           #mcm de los denominadores
                Fraccion.new(((aux/@den)*@num)-((aux/other.denom)*other.num),aux) #resta de los objetos
	end
	
	#redefinimos el operador *
	def *(other)
		Fraccion.new(@num*other.num, @den*other.denom)	
	end
	
	#redefinimos el operador /
	def /(other)
		Fraccion.new(@num*other.denom, @den*other.num)	
	end
	
	#Definimos un nuevo metodo que nos permitira comparar las fracciones.
	def <=> (other)
		return nil unless other.instance_of? Fraccion 
		(@num * other.denom) <=> (@den * other.num)    
	end
=begin
	#redefinimos el operador <
	def <(other)
		(@num * other.denom) < (@den * other.num)
	end

	#redefinimos el operador >
	def >(other)
		(@num * other.denom) > (@den * other.num)
	end
	
	#redefinimos el operador <=
	def <=(other)
		(@num * other.denom) <= (@den * other.num)
	end
	
	#redefinimos el operador >=
	def >=(other)
		(@num * other.denom) >= (@den * other.num)
	end
=end 
end
