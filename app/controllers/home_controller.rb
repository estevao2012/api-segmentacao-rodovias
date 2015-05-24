class HomeController < ApplicationController
	def index
		@locals   = Rodovia.all.group(:br).select(:br).limit(5)
	end

	def get_geom_by_br 
		br = params[:br]

		factory  	= RGeo::GeoJSON::EntityFactory.instance
		
		single    = RodoviasSelector.first_by_br(br).first
		feature = factory.feature(single.geom, single.br, {br: single.br})

		json_edu = RGeo::GeoJSON.encode feature

		respond_to do |format|
		  format.json  { render json: json_edu.to_json }
		end
	end

	def rodovia
		br = params[:br]
		@rodovia = Rodovia.where( br: br).order(:geom)
		render layout: false
	end

	def segmento
		id = params[:id]
		@segmento = Rodovia.find(id)
	end

end
