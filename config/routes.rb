Rails.application.routes.draw do
  root "tweets#index"


  devise_for :users


  resources :tweets do
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end



  resources :users, only: [:show] do
    resources :rooms, only: [:index, :create] do
      resources :messages, only: [:index, :create, :destroy]
    end

    resources :follows, only: [:create, :destroy] do
      collection do
        get :follow_index
        get :followed_index
      end
    end

    member do
      get :likes
    end
  end

end
