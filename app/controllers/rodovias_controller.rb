class RodoviasController < ApplicationController
	def show
		@rodovia = Rodovia.find(params[:id])
		render layout: false
	end
end
