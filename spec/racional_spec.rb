#Definición de las expectativas

require "racional.rb"
require "gcd.rb"
require "mcm.rb"

describe Fraccion do	#Primera expectativa
	
	before :each do #Objetos para las pruebas
		@rac1 = Fraccion.new(2,3)
		@rac2 = Fraccion.new(3,4)
		@rac3 = Fraccion.new(4,6)
		@rac4 = Fraccion.new(-5,2)
	end
	
	#Expectativas para el almacenamiento de los parametros	
	describe "# Getters." do 
		it "Debe existir un numerador" do
			@rac1.num.should eq(2)
			@rac1.num.should_not eq(4)					
		end
		it "Debe existir un denominador" do
			@rac1.denom.should eq(3)		
		end
	end
	
	#Transformacion a string y a flotante
	describe "# Operaciones de formato." do 
		it "Debemos mostrar la fraccion como a/b" do
			@rac1.to_s.should eq("2/3")
		end
	
		it "Debemos mostrar la fraccion en formato flotante" do
			@rac2.to_float.should eq(3/4)
		end
	end

	#Operaciones sobre las fracciones
	describe "# Otras operaciones." do 
		it "Se debe comparar si dos fracciones son iguales con ==" do
			@rac1.should == @rac3
		end

		it "Se debe calcular la fraccion reciproca" do
			@rac3 = Fraccion.new(3,2)
			@rac1.reciproco.should == @rac3
		end

		it "Se debe calcular el opuesto de una fraccion con -" do
			@rac3 = Fraccion.new(-2,3)
			(-@rac1).should == @rac3
		end

		it "Se debe calcular el valor absoluto de una fraccion con abs" do
			@rac3 = Fraccion.new(5,2)
			@rac4.abs.should == @rac3
		end

		it "Se debe calcular el resto dos fracciones con %" do
			(@rac1 % @rac2).should eq(8)
		end
	end
	
	#Operaciones aritméticas: Suma, resta, producto y división
	describe "# Operaciones aritmeticas." do
		it "Debe realizarse la suma de fracciones" do
			@rac3 = @rac1+@rac2
			@rac3.num.should eq(17)
			@rac3.denom.should eq(12)
		end
	
		it "Debe realizarse la resta de fracciones" do
			@rac3 = @rac1 - @rac2
			@rac3.num.should eq(-1)
			@rac3.denom.should eq(12)
		end
	
		it "Debe realizarse el producto de fracciones" do
			@rac3 = @rac1 * @rac2
			@rac3.num.should eq(1)
			@rac3.denom.should eq(2)
		end
		it "Debe realizarse la division de fracciones" do
			@rac3 = @rac1 / @rac2
			@rac3.num.should eq(8)
			@rac3.denom.should eq(9)
		end
	end

	#Comparación de fracciones
	describe "# Operaciones comparacionales." do
		it "Se debe comparar si una fraccion es menor que otra" do
			(@rac1 < @rac2).should be_true
			(@rac2 < @rac1).should be_false		
		end
	
		it "Se debe comparar si una fraccion es mayor que otra" do
			(@rac1 > @rac2).should be_false
			(@rac2 > @rac1).should be_true		
		end	
	
		it "Se debe comparar si una fraccion es menor o igual que otra" do
			(@rac1 <= @rac2).should be_true
			(@rac2 <= @rac1).should be_false
			(@rac1 <= @rac1).should be_true		
		end

		it "Se debe comparar si una fraccion es mayor o igual que otra" do
			(@rac1 >= @rac2).should be_false
			(@rac2 >= @rac1).should be_true	
			(@rac1 >= @rac1).should be_true		
		end
	end
end
