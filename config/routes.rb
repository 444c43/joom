Joom::Application.routes.draw do

  root to: 'posts#index'

  resources :posts
  resources :blog, controller: :posts

  get  '/about',    to: 'pages#about',      as: :about
  get  '/sign_in',  to: 'sessions#new',     as: :sign_in
  post '/sign_in',  to: 'sessions#create',  as: :create_session
  get  '/sign_out', to: 'sessions#destroy', as: :sign_out
end
