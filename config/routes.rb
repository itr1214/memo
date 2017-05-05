Rails.application.routes.draw do

	namespace :api, default: {format: :json} do
		resources :memoos, only: :create
	end
	
  
end
