Rails.application.routes.draw do

  devise_for :accounts, :controllers =>{:registrations => 'accounts/registrations',:confirmations => 'accounts/confirmations'}
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get 'admin/user'
  get 'admin/post'
  get 'admin/transaction'
  post "users/:id/update"  => "users#update"
  get "users/edit"     => "users#edit"
  post "users/edit_confirm" => "users#edit_confirm"
  post "users/update"      => "users#update"
  post "users/create"      => "users#create"
  get "users/index"        => "users#index"
  get "users/show/:id"          => "users#show"
  post "login"             => "home#login"
  post "logout"            => "home#logout"
  get "login"              => "home#login"
  get "users/mail_confirm"       => "users#mail_confirm", as: 'users_mail_confirm'
  get "users/signup"             => "users#signup", as: 'users_signup'
  get "users/signup_confirm"     => "users#signup_confirm"
  post "users/signup_confirm"    => "users#signup_confirm"

  get "posts/search" => "posts#search"
  post "posts/search" => "posts#search"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/show/:id" => "posts#show"
  post "posts/create" => "posts#create"
    post "posts/create_confirm" => "posts#create_confirm"
  get "posts/edit/:id" => "posts#edit"
  post "posts/update/:id" => "posts#update"
  post "posts/destroy/:id" => "posts#destroy"

  post "chats/:book_id/start"             => "chats#start"
  post "chats/:transaction_id/send_chat"  => "chats#send_chat"
  get "chats/:transaction_id/chat"        => "chats#chat"
  post "chats/:transaction_id/cansel_exhibit"  => "chats#cansel_exhibit"
  post "chats/:transaction_id/cansel_parchase" => "chats#cansel_parchase"
  get "chats/:transaction_id/buy_complete_comfirm" => "chats#buy_complete_comfirm"
  get "chats/:transaction_id/buy_complete_comfirm_done" => "chats#buy_complete_comfirm_done"

  get "admin/user" => "admin#user"
  post "admin/user" => "admin#user"
  post "admin/user/:user_id/ban" =>"admin#userBan"

  root 'home#top'
  get 'home/top' => 'home#top'
  get "/about" => 'home#about'
  get "/policy" => 'home#policy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'index/index'
  # post "index/index"
  #
  # get 'index', to: 'index#index'
  # get 'index/chatani'
end
