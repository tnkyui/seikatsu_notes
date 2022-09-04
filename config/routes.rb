Rails.application.routes.draw do
  get 'stocks/index'
  get 'stocks/show'
  get 'stocks/create'
  get 'stocks/update'
  get 'stocks/destroy'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'homes/top'
  get 'homes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
