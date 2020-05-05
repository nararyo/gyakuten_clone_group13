Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'movies#index'
  resources :rails_texts
  resources :questions
  resources :questions do
    resources :solutions, only: [:create]
  end

  resources :rails_texts do
  get :search, on: :collection
end

  resources :aws_texts, only:["index", "show"]
  resources :line_texts, only: [:index, :show]

end
