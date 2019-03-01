Rails.application.routes.draw do
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"

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
