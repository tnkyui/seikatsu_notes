Rails.application.routes.draw do
  devise_for :users, :path => "/"

  root to: 'homes#top'
  get 'home' => 'homes#index'

  get 'users/information/edit' => 'users#edit'
  patch 'users/information' => 'users#update'
  delete 'users/destroy' => 'users#destroy'

  resources :stocks, only:[:index, :show, :create, :update, :destroy]
  resources :lists,  only:[:index]
  resources :shopping_lists, only:[:create, :destroy]
  resources :todo_lists, only:[:create, :update, :destroy]
  # resources :categories, only:[:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
