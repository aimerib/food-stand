Rails.application.routes.draw do
  post "/", to: "public#search"
  resources :stands, only: [:show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "public#index"
end
