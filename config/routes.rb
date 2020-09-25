Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts
  resources :training_logs

  root to: 'dashboard#index'
end
