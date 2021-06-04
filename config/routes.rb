Rails.application.routes.draw do
  namespace :admin do
    root to: 'homes#top'
    #resources :sessions, only: [:new, :create, :destroy]
  end
  
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about'

end
