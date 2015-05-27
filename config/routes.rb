Rails.application.routes.draw do
  root "home#index"

  get 'get_geom_by_br/:br', to: "home#get_geom_by_br", as: 'get_geom'
  get 'informacao-rodovia/:br', to: "home#info_rodo", as: 'info_rodo'
end
