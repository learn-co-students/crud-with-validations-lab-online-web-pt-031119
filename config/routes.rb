Rails.application.routes.draw do
	
  delete '/songs/:id', to: 'songs#destroy'
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
