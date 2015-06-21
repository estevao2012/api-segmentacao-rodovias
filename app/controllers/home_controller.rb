class HomeController < ApplicationController
	def index
		@locals   = Rodovia.all.limit(2)
	end

	def get_geom_by_br 
		br = params[:br]

		factory = RGeo::GeoJSON::EntityFactory.instance
		single  = Rodovia.find_by br: br
		feature = factory.feature(single.geom, single.br, {br: single.br, id: single.id})
		json_edu = RGeo::GeoJSON.encode feature

		respond_to do |format|
		  format.json  { render json: json_edu.to_json }
		end
	end
end
