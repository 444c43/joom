Joom::Application.routes.draw do

  root to: 'pages#index'

  resources :posts
  resources :blog, controller: :posts

  get '/who_is',       to: 'pages#who_is_dl'
  get '/issues',       to: 'pages#issues'

  get '/culture',      to: 'pages#topics', defaults: { topic: 'culture' }
  get '/technology',   to: 'pages#topics', defaults: { topic: 'technology' }
  get '/health',       to: 'pages#topics', defaults: { topic: 'health' }
  get '/jacksonville', to: 'pages#topics', defaults: { topic: 'jacksonville' }

  get  '/sign_in',  to: 'sessions#new',     as: :sign_in
  post '/sign_in',  to: 'sessions#create',  as: :create_session
  get  '/sign_out', to: 'sessions#destroy', as: :sign_out
end
