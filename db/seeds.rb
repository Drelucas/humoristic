# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts ''

puts 'Creating User Admin...'
User.create! :name => "admin", :email => "admin@admin.com", :password => "inicial1234"

puts 'Creating Mood...'
Mood.find_or_create_by({:kind => "Alegre", :image => "mood/alegre.png"})
Mood.find_or_create_by({:kind => "Animado", :image => "mood/animado.png"})
Mood.find_or_create_by({:kind => "Bem", :image => "mood/bem.png"})
Mood.find_or_create_by({:kind => "Cansado", :image => "mood/cansado.png"})
Mood.find_or_create_by({:kind => "Com raiva", :image => "mood/comraiva.png"})
Mood.find_or_create_by({:kind => "Confiante", :image => "mood/confiante.png"})
Mood.find_or_create_by({:kind => "Confortavel", :image => "mood/confortavel.png"})
Mood.find_or_create_by({:kind => "De saco cheio", :image => "mood/desacocheio.png"})
Mood.find_or_create_by({:kind => "Determinado", :image => "mood/determinado.png"})
Mood.find_or_create_by({:kind => "Doente", :image => "mood/doente.png"})
Mood.find_or_create_by({:kind => "Em paz", :image => "mood/empaz.png"})
Mood.find_or_create_by({:kind => "Engraçado", :image => "mood/engraçado.png"})
Mood.find_or_create_by({:kind => "Feliz", :image => "mood/feliz.png"})
Mood.find_or_create_by({:kind => "Indiferente", :image => "mood/indiferente.png"})
Mood.find_or_create_by({:kind => "Irritado", :image => "mood/irritado.png"})
Mood.find_or_create_by({:kind => "Legal", :image => "mood/legal.png"})
Mood.find_or_create_by({:kind => "Mal", :image => "mood/mal.png"})
Mood.find_or_create_by({:kind => "Motivado", :image => "mood/motivado.png"})
Mood.find_or_create_by({:kind => "Muito feliz", :image => "mood/muitofeliz.png"})
Mood.find_or_create_by({:kind => "Ok", :image => "mood/ok.png"})
Mood.find_or_create_by({:kind => "Orgulhoso", :image => "mood/orgulhoso.png"})
Mood.find_or_create_by({:kind => "Otimista", :image => "mood/otimista.png"})
Mood.find_or_create_by({:kind => "Otimo", :image => "mood/otimo.png"})
Mood.find_or_create_by({:kind => "Para baixo", :image => "mood/parabaixo.png"})
Mood.find_or_create_by({:kind => "Relaxado", :image => "mood/relaxado.png"})
Mood.find_or_create_by({:kind => "Tranquilo", :image => "mood/tranquilo.png"})
Mood.find_or_create_by({:kind => "Triste", :image => "mood/triste.png"})
