class HomeController < ApplicationController
	def index
		@locals   = Rodovia.all.group(:br).select(:br)
	end

	def get_geom_by_br 
		br = params[:br]

		factory  	= RGeo::GeoJSON::EntityFactory.instance
		@features = {}
		@json_edu = {}
		
		locals     = Rodovia.find_by_sql("SELECT ST_Union(\"rodovias\".\"geom\") as \"geom\", \"rodovias\".\"br\" FROM \"rodovias\" WHERE \"rodovias\".\"br\" = '"+ br +"' GROUP BY br") 

		single = locals.first
		feature = factory.feature(single.geom, single.br, {br: single.br})

		@json_edu = RGeo::GeoJSON.encode feature

		respond_to do |format|
		  format.json  { render json: @json_edu.to_json }
		end
	end
end
