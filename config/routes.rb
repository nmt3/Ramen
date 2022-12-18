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
    resources :reviews, only: [:index, :show, :edit, :create, :update, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get :quit
        patch :out
      end
    end
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :bookmarks, only: [:create, :index, :destroy]
    end
  end

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    get 'homes/show'
    resources :posts, only: [:index, :show, :edit, :create, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
