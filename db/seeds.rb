# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
result = ActiveRecord::Base.connection.execute("SELECT * from rodovias_raw")
result.each do |row|
   Rodovia.find_or_create_by!(br: row["br"] , uf: row["uf"] , codigo: row["codigo"] , local_de_i: row["local_de_i"] , local_de_f: row["local_de_f"] , km_inicial: row["km_inicial"] , km_final: row["km_final"] , extensao: row["extensao"] , superficie: row["superficie"] ,
   	 federal_co: row["federal_co"] , federal__1: row["federal__1"] , federal__2: row["federal__2"] , estadual_c: row["estadual_c"] , superfic_1: row["superfic_1"] , mpv_082_20: row["mpv_082_20"] , concessao_: row["concessao_"] , geom: row["geom"] )
end