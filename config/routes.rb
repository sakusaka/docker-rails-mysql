Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :test
  get "test/index"
  post "test/index"
  resources :api
end
