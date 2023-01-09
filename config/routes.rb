Rails.application.routes.draw do
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
 }

  devise_scope :customer do
    post 'customer/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    resources :reviews, only: [:create, :update, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get :quit
        patch :out
      end
      member do
        get :list
        get :bookmark
      end
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :bookmarks, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
  end

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    get 'homes/show'
    get "search"
    resources :posts, only: [:show, :edit, :create, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update] do
      member do
        get :list
      end
    end
    resources :reviews, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
