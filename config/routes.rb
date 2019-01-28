Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sessions/create'
      get 'sessions/destroy'
    end
  end
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
	  namespace :v1 do
	  	resources :users, only: [:index]

      post "/sign_in", :to => 'sessions#create'
      delete "/sign_out", :to => 'sessions#destroy'
      get "/profile", :to => 'registrations#profile'
      post "/profile", :to => 'registrations#profile'
      post "/sign_up", :to => 'registrations#create'
      post "/update_account", :to => 'registrations#update'
      get "/reset_password", :to => 'registrations#reset_password'
      post "/reset_password", :to => 'registrations#reset_password'
	  end
	end

end
