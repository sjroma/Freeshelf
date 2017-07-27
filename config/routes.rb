Rails.application.routes.draw do
	get 'signup' => 'users#new'
	resources :users
	
  get 'welcome/index'
	resources :books
	
	get '/login' => 'sessions#new'
	
	post 'login' => 'sessions#create'
	
	delete 'logout' => 'sessions#destroy'
	
	root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
