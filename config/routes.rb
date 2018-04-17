Rails.application.routes.draw do
  resources :songs, only: [:index, :edit, :new, :create, :update, :destroy, :show]

end
