Jtbookstore::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :images


  resources :actors


  resources :books do
    member do
      get :sendmail
    end
    collection do
      get :search
      post :search
    end
  end

  resources :stores


  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users

  resources :users

end
