Rails.application.routes.draw do
  post "/", to: "public#search"
  resources :stands, only: :show

  root "public#index"
end
