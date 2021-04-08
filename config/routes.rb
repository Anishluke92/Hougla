Rails.application.routes.draw do
  root to: 'pages#home'	

  devise_for :users
  
  resources :users
    resources :projects
  end
end
