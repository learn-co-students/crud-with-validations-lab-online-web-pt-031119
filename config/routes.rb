Rails.application.routes.draw do
  resources :songs, except: :destroy

  get '/', to: 'songs#index', as: 'root'

  delete '/songs/:id', to: 'songs#destroy', as: 'delete_song'
end
