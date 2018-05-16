Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'shows#home'
	get '/shows', to: 'shows#index'
	get '/shows/:id', to: 'shows#show'
	get '/episode/:id', to: 'shows#show_episode'
end
