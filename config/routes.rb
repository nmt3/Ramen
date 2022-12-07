Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    resources :reviews, only: [:index, :show, :edit, :create, :update, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get :quit
        patch :out
      end
    end
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  end

    devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
    }

  namespace :admin do
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
