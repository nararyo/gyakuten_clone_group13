Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'movies#index'

  get '/questions', to: 'questions#index'
  get '/questions/new', to: 'questions#new'
  post '/questions', to: 'questions#create'



end
