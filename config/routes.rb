Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :recipes, except: [:update] do
    resources :foods, except: [:update]
    end 
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
