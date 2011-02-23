Jigimojo::Application.routes.draw do
  resources :attendees

  resources :events

  resources :venues

  devise_for :users
	
	match "venues_lookup" => "venues#lookup" 
	match "venues_search" => "venues#search"
	
  get "home/index"
	root :to => "home#index"
end
