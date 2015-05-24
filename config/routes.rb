Rails.application.routes.draw do
  root "home#index"

  get 'get_geom_by_br/:br', to: "home#get_geom_by_br", as: 'get_geom'
  get 'rodovia/:br', to: "home#rodovia", as: 'rodovia'
  get 'segmento/:id', to: "home#segmento", as: 'segmento'
end
