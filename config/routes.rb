Dl::Application.routes.draw do
  match 'ui(/:action)', controller: 'ui'
  root to: 'pages#home'

  get '/blog', to: 'posts#index', as: :blog
  get '/sign_in', to: 'sessions#new', as: :sign_in
  post '/sign_in', to: 'sessions#create', as: :sign_in
  get '/sign_out', to: 'sessions#destroy', as: :sign_out

  resources :posts

end
