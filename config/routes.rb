Rails.application.routes.draw do
  get 'users/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index/index'
  post "index/index"
  
  get 'index', to: 'index#index'
  get 'index/chatani'
end
