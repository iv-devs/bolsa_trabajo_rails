Rails.application.routes.draw do
  resources :jobs do
  	resources :postulations
  end
	root to: "welcome#index"

	resources :users, only: [:show], path: :user
	resources :companies, only: [:show], path: :company
  devise_for :users
  devise_for :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
