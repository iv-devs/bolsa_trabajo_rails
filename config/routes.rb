Rails.application.routes.draw do
	root to: "welcome#index"

  devise_for :users
  devise_for :companies
  
  resources :jobs do
  	resources :postulations, only: [:new, :show, :create, :index]
  end

	resources :users, only: [:show], path: :user
	
	resources :companies, only: [:show], path: :company do
		get '/job/:job_id', to: 'companies#list_user_job_postulation', as: :postulations
		get '/job/:job_id/:postulation_id', to: 'companies#user_postulation_details', as: :details
	end

  
	namespace :admin do
	  get '/', to: 'admin_panel#index'
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
