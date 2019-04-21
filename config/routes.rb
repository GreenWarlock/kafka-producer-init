Rails.application.routes.draw do
  resources :stories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  resources :users do
    get :statistics, to: 'users#statistics'
  end

  resources :articles
end
