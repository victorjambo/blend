Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :users
  resources :posts do  
  	resources :comments
  	member do
	    put "like", to: "posts#upvote"
	    put "dislike", to: "posts#downvote"
	end
  end 
  
  root 'posts#index'
  
end
