class HomeController < ApplicationController
	def index
		factory  	= RGeo::GeoJSON::EntityFactory.instance
		@features = {}
		@json_edu = {}

		locals   = Rodovia.all.limit(100).order(:br)
		locals.each do |single|
		  feature = factory.feature(single.geom, single.id, {br: single.br, uf: single.uf})
		  @features[single.br] = Array.new if @features[single.br].nil?
		  @features[single.br] << feature
		end

		@features.each_key do |key, feature|
			@json_edu[key] = RGeo::GeoJSON.encode factory.feature_collection(@features[key])
		end
	end
end
