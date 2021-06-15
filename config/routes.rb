Rails.application.routes.draw do


  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        password: 'admins/passwords',
      }
  namespace :admin do
    root to: 'homes#top'
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end

  devise_for :customers, controllers: {
        registrations: 'customers/registrations',
        sessions: 'customers/sessions',
        password: 'customers/passwords',
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :items, only:[:index, :show]
  resources :cart_items, only:[:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end

  resources :customer, only:[:show, :edit, :update] do
    collection do
      get 'unsubscribe'
      patch 'withdrawal'
    end
  end

  resources :orders, only:[:new, :create, :index, :show]  do
    collection do
      post 'comfirm'
      get 'complete'
    end
  end
  resources :addresses, except:[:show, :new]

end
