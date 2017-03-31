Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :users
  resources :posts do  
  	resources :comments
  end 
  
  root 'posts#index'
end
