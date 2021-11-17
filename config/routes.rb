Rails.application.routes.draw do
  # get 'recipe_foods/new'
  # get 'recipe_foods/create'
  # get 'recipe_foods/destroy'
  # get 'recipe_foods/edit'
  # get 'recipe_foods/update'
  # get 'recipes/show'
  # get 'foods/index'
  # get 'foods/new'
  # get 'foods/create'
  # get 'foods/show'
  # get 'foods/destroy'
  devise_for :users
  root to: "users#index"
  resources :recipes do
    resources :recipe_foods, except: [:show]
  end
  resources :foods, except: [:update, :show]
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
