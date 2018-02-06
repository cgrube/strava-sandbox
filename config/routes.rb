Rails.application.routes.draw do
  get 'welcome/index'
  get 'authentication/index'
  get 'authentication/doOauth'
  get 'authentication/doTokenExchange'
  
  resources :stats
  post 'search' => 'stats#search'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'authentication#index'
end
