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

  post '/section/:id/hide/:topic_id', to: 'admin#hide_topic'
  post '/section/:id/show/:topic_id', to: 'admin#show_topic'
  post '/section/:id/delete/:topic_id', to: 'admin#delete_topic'
  post '/section/:id/restore/:topic_id', to: 'admin#restore_topic'

  post '/section/:id/pin/:topic_id', to: 'admin#pin_topic'
  post '/section/:id/unpin/:topic_id', to: 'admin#unpin_topic'

  post '/section/:id/open/:topic_id', to: 'admin#open_topic'
  post '/section/:id/close/:topic_id', to: 'admin#close_topic'

  post '/section/:id/topic/:topic_id/hide_msg/:msg_id', to: 'admin#hide_msg'
  post '/section/:id/topic/:topic_id/show_msg/:msg_id', to: 'admin#show_msg'
  post '/section/:id/topic/:topic_id/delete_msg/:msg_id', to: 'admin#delete_msg'
  post '/section/:id/topic/:topic_id/restore_msg/:msg_id', to: 'admin#restore_msg'

  post "/section/:id/topic/:topic_id/like_msg/:msg_id", to: 'workplace#like_msg'
  post "/section/:id/topic/:topic_id/unlike_msg/:msg_id", to: 'workplace#unlike_msg'

  post "/info/:account_id", to: 'users#short_info'

  get "/new_section/:chapter_id", to: 'admin#new_section'
  post "/create_section/:chapter_id", to: 'admin#create_section'

  post "/hide/:section_id", to: 'admin#hide_section'
  post "/show/:section_id", to: 'admin#show_section'
  post "/delete/:section_id", to: 'admin#delete_section'
  post "/restore/:section_id", to: 'admin#restore_section'

  post "/open_pretenders/:section_id", to: 'admin#open_pretenders'
  post "/make_moder/:section_id/:account_id", to: 'admin#make_moder'
  post "/dismiss_moder/:section_id/:account_id", to: 'admin#dismiss_moder'
  post "section/:section_id/find_pretender", to: "admin#find_pretender"







  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
