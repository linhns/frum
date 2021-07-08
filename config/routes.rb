Rails.application.routes.draw do
  resources :posts do
    resources :replies
  end
  get 'profile', to: 'profile#index'
  devise_for :users, :skip => [:registrations]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
end
