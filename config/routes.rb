Jigimojo::Application.routes.draw do
  resources :venues

  devise_for :users

  get "home/index"
	root :to => "home#index"
end
