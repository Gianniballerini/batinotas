Rails.application.routes.draw do
	root to: 'lists#new'
  	resources :lists do
  		resources :long_tasks
  		resources :simple_tasks
  		resources :temporal_tasks
  	end
  	get '/:id', to: 'lists#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
