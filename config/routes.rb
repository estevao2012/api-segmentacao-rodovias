Rails.application.routes.draw do
  root "home#index"

  get 'get_geom_by_br/:br', to: "home#get_geom_by_br", as: 'get_geom'

  resources :rodovias do
	  resources :via_caracteristics
	end
  
end
