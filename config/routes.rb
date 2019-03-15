Rails.application.routes.draw do
  post "users/:id/update"  => "users#update"
  get "users/:id/edit"     => "users#edit"
  post "users/create"      => "users#create"
  get "signup"             => "users#new"
  get "users/index"        => "users#index"
  get "users/:id"          => "users#show"
  post "login"             => "users#login"
  post "logout"            => "users#logout"
  get "login"              => "users#login_form"

  post "chats/:book_id/start"             => "chats#start"
  post "chats/:transaction_id/send_chat"  => "chats#send_chat"
  get "chats/:transaction_id/chat"        => "chats#chat"
  post "chats/:transaction_id/cansel_exhibit"  => "chats#cansel_exhibit"
  post "chats/:transaction_id/cansel_parchase" => "chats#cansel_parchase"

  get "/" => 'home#top'
  get "/about" => 'home#about'
  get "/policy" => 'home#policy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'index/index'
  # post "index/index"
  #
  # get 'index', to: 'index#index'
  # get 'index/chatani'
end
