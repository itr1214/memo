Rails.application.routes.draw do

  devise_for :users, only: []
	namespace :api, default: {format: :json} do
		resources :memoos, only: [:create, :show, :update]
		resource :login, only: [:create], controller: :sessions
		resources :users, only: [:index, :create, :update]
	end	
end
