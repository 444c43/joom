Dl::Application.routes.draw do
  match 'ui(/:action)', controller: 'ui'
  root to: 'pages#home'

  get '/sign_in', to: 'sessions#new', as: :sign_in
  post '/sign_in', to: 'sessions#create', as: :sign_in
  get '/sign_out', to: 'sessions#destroy', as: :sign_out
  get '/photos/', to: 'photos#index', as: :photos

  resources :posts
  resources :blog, controller: :posts
  get '/blog', to: 'posts#index', as: :blog_home
  # get '/blog/:id', to: 'pots#show', as: :blog
  # get '/blog/:id/edit', to: 'posts#edit', as: :blog
  # put '/blog/:id', to: 'posts#update', as: :blog


  resources :posts

  get '/heartbeat', to: proc { [200, {}, ''.chars] }

end
