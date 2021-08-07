Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root 'home#index'
  get 'home/index'

  namespace :api, {format: 'json'} do
    namespace :pj1 do
      resources :clients, only: [:index, :show]
    end
  end

end
