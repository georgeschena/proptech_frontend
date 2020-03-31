Rails.application.routes.draw do
  root "properties#index"

  resources :search_properties
end
