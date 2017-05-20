Rails.application.routes.draw do
  resources :jobs do
  	resources :postulations
  end
	root to: "welcome#index"

	resources :users, only: [:show], path: :user
	resources :companies, only: [:show], path: :company do
		get '/job/:job_id', to: 'companies#list_user_job_postulation', as: :postulations
		get '/job/:job_id/:postulation_id', to: 'companies#user_postulation_details', as: :details
	end
  devise_for :users
  devise_for :companies

  
	namespace :admin do
	  get '/', to: 'admin_panel#index'
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
