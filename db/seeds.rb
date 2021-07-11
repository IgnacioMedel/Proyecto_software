# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Comment.destroy_all
Request.destroy_all
Publication.destroy_all
Review.destroy_all
Message.destroy_all

administrador = User.new
administrador.email = 'admin@admin.com'
administrador.password = 'password'
administrador.password_confirmation = 'password'
administrador.nombre = 'Administrador'
administrador.administrador = true
administrador.genero = 'no_binario'
administrador.save!

ignacio = User.new
ignacio.email = 'ignaciotorrealba@gmail.com'
ignacio.password = 'ignaciotorrealba.com'
ignacio.password_confirmation = 'ignaciotorrealba.com'
ignacio.nombre = 'Ignacio Torrealba'
ignacio.numero = '+56967075646'
ignacio.comuna = 'Ñuñoa'
ignacio.ciudad = 'Santiago'
ignacio.genero = 'hombre'
ignacio.save!

juana = User.new
juana.email = 'juanamazon@gmail.com'
juana.password = 'juanamazon.com'
juana.password_confirmation = 'juanamazon.com'
juana.nombre = 'Juana Mazón'
juana.numero = '+5699808059'
juana.comuna = 'San Felipe'
juana.ciudad = 'San Felipe'
juana.genero = 'mujer'
juana.save!

elena = User.new
elena.email = 'elenaescobar@gmail.com'
elena.password = 'elenaescobar.com'
elena.password_confirmation = 'elenaescobar.com'
elena.nombre = 'Elena Escobar'
elena.numero = '+5695842036'
elena.comuna = 'La Reina'
elena.ciudad = 'Santiago'
elena.genero = 'no_binario'
elena.save!

franscisco = User.new
franscisco.email = 'francisco@gmail.com'
franscisco.password = 'francisco.com'
franscisco.password_confirmation = 'francisco.com'
franscisco.nombre = 'Francisco Escobar'
franscisco.numero = '+5697784521'
franscisco.comuna = 'Providencia'
franscisco.ciudad = 'Santiago'
franscisco.genero = 'hombre'
franscisco.save!

pedro = User.new
pedro.email = 'pedro@gmail.com'
pedro.password = 'pedro.com'
pedro.password_confirmation = 'pedro.com'
pedro.nombre = 'Pedro Torres'
pedro.numero = '+5697445882'
pedro.comuna = 'Providencia'
pedro.ciudad = 'Santiago'
pedro.genero = 'hombre'
pedro.save!

camila = User.new
camila.email = 'camila@gmail.com'
camila.password = 'camila.com'
camila.password_confirmation = 'camila.com'
camila.nombre = 'Camila Balmaceda'
camila.numero = '+5690021456'
camila.comuna = 'La Florida'
camila.ciudad = 'Santiago'
camila.genero = 'mujer'
camila.save!

renata = User.new
renata.email = 'renata@gmail.com'
renata.password = 'renata.com'
renata.password_confirmation = 'renata.com'
renata.nombre = 'Renata Muñoz'
renata.numero = '+5699958612'
renata.comuna = 'Puente Alto'
renata.ciudad = 'Santiago'
renata.genero = 'no_binario'
renata.save!

octavio = User.new
octavio.email = 'octavio@gmail.com'
octavio.password = 'octavio.com'
octavio.password_confirmation = 'octavio.com'
octavio.nombre = 'Octavio Castro'
octavio.numero = '+569778545'
octavio.comuna = 'Vitacura'
octavio.ciudad = 'Santiago'
octavio.genero = 'no_binari0'
octavio.save!

maria = User.new
maria.email = 'maria@gmail.com'
maria.password = 'maria.com'
maria.password_confirmation = 'maria.com'
maria.nombre = 'María Pacheco'
maria.numero = '+5695549612'
maria.comuna = 'Ñuñoa'
maria.ciudad = 'Santiago'
maria.genero = 'mujer'
maria.save!

josefa = User.new
josefa.email = 'josefa@gmail.com'
josefa.password = 'josefa.com'
josefa.password_confirmation = 'josefa.com'
josefa.nombre = 'Josefa Morales'
josefa.numero = '+5695335489'
josefa.comuna = 'Ñuñoa'
josefa.ciudad = 'Santiago'
josefa.genero = 'no_binario'
josefa.save!