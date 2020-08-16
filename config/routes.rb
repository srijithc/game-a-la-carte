Rails.application.routes.draw do
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
end
