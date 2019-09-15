Rails.application.routes.draw do
  get '/login', to:'seesions#new'
  post '/login', to: 'seesions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    get 'users/new'
    get 'users/edit'
    get 'users/show'
    get 'users/index'
  end
  namespace :admin do
    resources :users
  end
  root to:'tasks#index'
  resources :tasks
end
