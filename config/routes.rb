Jigimojo::Application.routes.draw do
  resources :venues

  get "venue/index"

  get "venue/show"

  get "venue/new"

  get "venue/edit"

  get "venue/create"

  get "venue/destroy"

  devise_for :users

  get "home/index"
	root :to => "home#index"
end
