Practica de laboratorio 7
--------------------------

¿Qué hemos de hacer?
--------------------

Considere la clase Ruby para representar fracciones que ha implementado usando el Desarrollo dirigido por pruebas (Test Driven Development - TDD) usando como herramienta Rspec. 

1. Realice las modificaciones oportunas para contemplar el uso del módulo Comparable.

2. La clase se ha de compilar con la herramienta Travis de integración continua. Con ella se comprueba la portabilidad de los desarrollos entre distintas plataformas y versiones de Ruby.

3. 
  a) Crear un fichero '.travis.yml' que contenga el listado de plataformas sobre las que se quiere comprobar el correcto funcionamiento.

  b) Crear un fichero Rakefile que contenga al menos:
      $:.unshift File.dirname(__FILE__) + 'lib'
      require 'rspec/core/rake_task'
      RSpec::Core::RakeTask.new
      task :default => :spec
      
  c) Crear un fichero 'Gemfile' que contenga al menos:
      source 'https://rubygems.org'
      
      gem 'rake'
      gem 'rspec'
