Rails.application.routes.draw do
  get 'admin/user'
  get 'admin/post'
  get 'admin/transaction'
  post "users/:id/update"  => "users#update"
  get "users/:id/edit"     => "users#edit"
  post "users/create"      => "users#create"
  get "signup"             => "users#new"
  get "users/index"        => "users#index"
  get "users/:id"          => "users#show"
  post "login"             => "users#login"
  post "logout"            => "users#logout"
  get "login"              => "users#login_form"

  get "posts/search" => "posts#search"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  post "chats/:book_id/start"             => "chats#start"
  post "chats/:transaction_id/send_chat"  => "chats#send_chat"
  get "chats/:transaction_id/chat"        => "chats#chat"
  post "chats/:transaction_id/cansel_exhibit"  => "chats#cansel_exhibit"
  post "chats/:transaction_id/cansel_parchase" => "chats#cansel_parchase"

  get "admin/user" => "admin#user"
  post "admin/user" => "admin#user"
  post "admin/user/:user_id/ban" =>"admin#userBan"

  root 'home#top'
  get "/about" => 'home#about'
  get "/policy" => 'home#policy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'index/index'
  # post "index/index"
  #
  # get 'index', to: 'index#index'
  # get 'index/chatani'
end
