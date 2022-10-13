Rails.application.routes.draw do
  resources :categories, only:[:index, :new, :create] do
    resources :expenses, only:[:index, :new, :create]
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
