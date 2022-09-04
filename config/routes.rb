Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :visa_forms, only: [:new, :create, :index]
  root "visa_forms#index"
end
