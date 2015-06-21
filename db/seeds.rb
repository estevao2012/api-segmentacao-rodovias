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