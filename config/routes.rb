Rails.application.routes.draw do
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/songs', to: 'songs#index'

get '/songs/new', to: 'song#new', as: 'new_song'

post '/songs', to: 'songs#create'

get '/songs/:id', to: 'songs#create'

get '/songs/:id/edit', to: 'song#edit', as: 'edit_song'

patch '/songs/:id', to: 'songs#update'

delete '/songs/:id', to: 'songs#destroy'

root 'songs#index'


end
