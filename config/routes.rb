Rails.application.routes.draw do
  root 'workplace#mainpage'

  get '/register', to: 'users#create'
  post '/register', to: 'users#register'

  get '/login', to: 'users#signin'
  post 'login', to: 'users#login'

  post '/logout', to: 'users#logout'

  get 'lks', to: 'users#lks'

  post "avatar", to: 'users#avatar'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
