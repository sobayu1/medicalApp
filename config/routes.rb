Rails.application.routes.draw do
  root 'user_top#home'
  get 'user_top/home'
  get 'user_top/help'
  get 'doctor_top/home'
  get 'doctor_top/help'
  
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

  resources :users, :only => [:show] ,shallow: true do
    resources :user_informations 
    resources :consultations 
    end

  resources :doctors, :only => [:index,:show] ,shallow: true do
    resources :doctor_informations
  end

  post 'answers/create'

end
