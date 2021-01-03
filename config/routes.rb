Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    member do
      get 'hide' => 'posts#hide'
      get 'unhide' => 'posts#unhide'
    end
  end
  
  resources :training_logs
  resources :resources
  resources :projects
  resources :goals

  root to: 'dashboard#index'
end
