# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

result = ActiveRecord::Base.connection.execute("SELECT br, ST_Union(geom) as geom from rodovias_raw GROUP BY br")
result.each do |row|
   Rodovia.find_or_create_by!(br: row["br"] , geom: row["geom"] )
end

ViaCaracteristicCategory.find_or_create_by name: "Pontos de referência adjacente à via", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Pedágio", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Placa de sinalização", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Divisa municipal / estadual", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Outra Caracteristica", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Redutor de Velocidade", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Inicio: Capacidade Máxima de Carga", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Fim: Capacidade Máxima de Carga", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Velocidades Máxima", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Acostamento", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Cidade", importance: 0
ViaCaracteristicCategory.find_or_create_by name: "Entroncamento", importance: 0


User.create!({:email => "admin@admin.com", :password => "12345678", :password_confirmation => "12345678" }) unless User.find_by email: "admin@admin.com"



