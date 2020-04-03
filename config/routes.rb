Rails.application.routes.draw do
  devise_for :users
  root "properties#index"

  resources :search_properties
end
