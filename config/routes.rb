Rails.application.routes.draw do
  # get 'quote/new'
  # get 'quote/edit'
  # get 'quote/create'
  # get 'quote/update'
  # get 'games/index'
  get 'dashboard/index'
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  devise_scope :user do
    get "/users/password", to: "devise/passwords#new"

    get "/signin", to: "devise/sessions#new"
    get "/unauthorized", to: "devise/sessions#new"
    get "/signup", to: "registrations#new"
    delete "/signout", to: "devise/sessions#destroy"
  end

  resources :games

  resources :quotes do
    collection do
      post :buy
    end
  end
end
