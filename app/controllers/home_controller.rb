class HomeController < ApplicationController
	def index
		factory  	= RGeo::GeoJSON::EntityFactory.instance
		@features = {}
		@json_edu = {}

		# locals   = Rodovia.all.limit(300).group([:br, :geom, :id])
		locals     = Rodovia.find_by_sql('SELECT ST_Union("rodovias"."geom") as "geom", "rodovias"."br" FROM "rodovias" GROUP BY br LIMIT 30')

		locals.each do |single|
		  feature = factory.feature(single.geom, single.br, {br: single.br})
		  @features[single.br] = Array.new if @features[single.br].nil?
		  @features[single.br] << feature
		end

		@features.each_key do |key, feature|
			@json_edu[key] = RGeo::GeoJSON.encode factory.feature_collection(@features[key])
		end
	end
end
