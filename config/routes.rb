Rails.application.routes.draw do


  
  resources :payments

  resources :orders do 
    
  end

  resources :addresses do 
    member do 
      post :set_to_default
    end
  end

  resources :shopping_carts
  namespace :admin do
    root "products#index"
    resources :sessions, only: [:new, :create, :destroy]
    resources :products
    resources :categories do 
      member do 
        get 'sub_index'
      end
    end
  end

  
	root "products#index"
  resources :products do 
    collection do 
      get :search
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  delete 'sessions/destroy', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
