Rails.application.routes.draw do
  get 'welcome/index'
  get 'authentication/index' 
  
  resources :stats
  post 'search' => 'stats#search'

  resources :activities
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'authentication#index'
end
