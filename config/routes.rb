Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :events do
    member do
      get 'rsvp'
      get 'cancel'
    end
  end

  root to: 'events#index'

  get 'user_events', to: 'events#user_events'
  get 'user_rsvps', to: 'events#user_rsvps'


  get 'attendees', to: 'events#attendees'
end
