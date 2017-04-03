Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  get 'home/index'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'plants#index', as: :authenticated_root
    end

    devise_scope :user do
      authenticated :user do
        resources :plants
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :plants


  resources :users do
    resources :plants
  end


  namespace :api do
    namespace :v1 do
      resources :plants
    end
  end

  namespace :api do
    namespace :v1 do
      resources :weathers
    end
  end


  resources :plants do
    resources :timers
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
