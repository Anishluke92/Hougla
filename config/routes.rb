Rails.application.routes.draw do
  get 'about_us/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  devise_for :users

  resources :projects do
    resources :tasks
  end
end
