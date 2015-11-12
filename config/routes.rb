Joom::Application.routes.draw do

  root to: 'posts#index'

  resources :posts
  resources :blog, controller: :posts

  get   '/sign_in', to: 'sessions#new', as: :sign_in
  post  '/sign_in', to: 'sessions#create', as: :create_session

  get   '/sign_out', to: 'sessions#destroy', as: :sign_out

  get   '/blog', to: 'posts#index', as: :blog_home
  # get '/blog/:id', to: 'pots#show', as: :blog
  # get '/blog/:id/edit', to: 'posts#edit', as: :blog
  # put '/blog/:id', to: 'posts#update', as: :blog

  get '/heartbeat', to: proc { [200, {}, ''.chars] }
end
