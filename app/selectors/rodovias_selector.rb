
class RodoviasSelector

	def self.geom_grouped_by_code br
		Rodovia.find_by_sql("SELECT ST_Union(\"rodovias\".\"geom\") as \"geom\", \"rodovias\".\"br\" FROM \"rodovias\" WHERE \"rodovias\".\"br\" = '"+ br +"' GROUP BY br").first
	end
end