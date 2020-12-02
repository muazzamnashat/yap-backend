Rails.application.routes.draw do
  resources :reviews
  resources :businesses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/test", to: "application#test"
  resources :users
end
