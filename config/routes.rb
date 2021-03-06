Rails.application.routes.draw do
  root 'user_top#home'
  get 'user_top/home'
  get 'user_top/help'
  get 'doctor_top/home'
  get 'doctor_top/help'
  get 'doctors/review'
  post '/rate' => 'rater#create', :as => 'rate'
  
  devise_for :users, controllers: {
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :registrations => 'users/registrations'
  }
  devise_for :doctors, controllers: {
    :sessions => 'doctors/sessions',
    :passwords => 'doctors/passwords',
    :registrations => 'doctors/registrations'
  }

  resources :users, :only => [:show] do
    resources :user_informations  
    end

  resources :doctors, :only => [:index,:show] do
    resources :doctor_informations
  end

  resources :consultations do
    resources :rates, :only => [:new, :create]
  end

  resources :rooms, :only => [:show] do
    resources :room_messages, :only => [:create]
  end

end
