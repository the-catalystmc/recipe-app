Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/new'
  get 'foods/create'
  get 'foods/show'
  get 'foods/destroy'
  devise_for :users
  root to: "users#index"
  resources :recipes, except: [:update] do
    resources :foods, except: [:update]
    end 
  resources :foods, except: [:update, :show]
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
