Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  devise_for :users
  root to: "users#index"
  get 'public_recipes', to: "recipes#public_recipes", as: "public_recipes"
  get 'general_shopping_list', to: "recipes#general_shopping_list", as: "general_shopping_list"
  resources :recipes, except: [:update] do
    resources :foods, except: [:update]
  end 
  get 'users/index'
  get 'users/show'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
