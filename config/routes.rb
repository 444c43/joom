Joom::Application.routes.draw do

  root to: 'pages#index'

  resources :posts
  resources :blog, controller: :posts

  get '/who_is',       to: 'pages#who_is_dl'
  get '/issues',       to: 'pages#issues'

  get  '/sign_in',  to: 'sessions#new',     as: :sign_in
  post '/sign_in',  to: 'sessions#create',  as: :create_session
  get  '/sign_out', to: 'sessions#destroy', as: :sign_out

  get '/:topic',      to: 'pages#topics'
end
