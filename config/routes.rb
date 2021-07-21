Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  get 'home/index'

  namespace :api, {format: 'json'} do
    namespace :pj1 do
      resources :client, only: [:index, :show]
    end
  end

end
