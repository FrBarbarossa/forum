Rails.application.routes.draw do
  root 'workplace#mainpage'

  get '/register', to: 'users#create'
  post '/register', to: 'users#register'

  get '/login', to: 'users#signin'
  post 'login', to: 'users#login'

  post '/logout', to: 'users#logout'

  get 'lks', to: 'users#lks'

  post "/avatar", to: 'users#avatar'
  post "/modal", to: 'users#modal'
  post "/name", to: 'users#name'
  post "/description", to: 'users#description'

  get "/section/:id", to: 'workplace#section'
  get "/section/:id/new_topic", to: 'workplace#new_topic'
  get "/section/:id/new_topic", to: 'workplace#new_topic'
  get "/section/:id/topic/:topic_id", to: 'workplace#topic'

  post "/section/:id/new_topic", to: 'workplace#create_topic'
  post "/section/:id/topic/:topic_id/new_message", to: "workplace#new_message"

  post 'hide/:topic_id', to: 'admin#hide_topic'
  post 'show/:topic_id', to: 'admin#show_topic'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
