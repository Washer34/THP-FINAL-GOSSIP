Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :gossip do
    resources :comment 
  end
  resources :session, only: [:new, :create, :destroy]
  resources :tag
  resources :user
  resources :city
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'welcome/:user_name', to: 'welcome#show'
  root 'gossip#index'
  put '/gossip/:id/pouce', to: 'gossip#pouce', as: 'pouce'
  put '/gossip/:id/dispouce', to: 'gossip#dispouce', as: 'dispouce'
  # Defines the root path route ("/")
  # root "articles#index"
end

#Rails.application.routes.draw do
#  root 'static#home'
#  get 'team', to: 'static#team'
#  get 'contact', to: 'static#contact'
#  get 'welcome/:user_name', to: 'static#welcome'
#  get 'gossip/:gossip_id', to: 'static#gossip', as: 'gossip_pre'
#
#  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#
#  # Defines the root path route ("/")
#  # root "articles#index"
#end