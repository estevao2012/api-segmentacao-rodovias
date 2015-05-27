class HomeController < ApplicationController
	def index
		@locals   = Rodovia.all.limit(4).group(:br).select(:br)
	end

	def get_geom_by_br 
		br = params[:br]

		factory  	 = RGeo::GeoJSON::EntityFactory.instance
		single     = RodoviasSelector.geom_grouped_by_code br
		feature 	 = factory.feature(single.geom, single.br, {br: single.br})
		json_edu   = RGeo::GeoJSON.encode feature

		respond_to do |format|
		  format.json  { render json: json_edu.to_json }
		end
	end

	def info_rodo
		@br 			 				 = params[:br]
		@segmento_rodovias = Rodovia.where(br: @br).order(geom: :asc)
		@sum_extensao      = @segmento_rodovias.sum(:extensao)

		render layout: false 
	end
end
