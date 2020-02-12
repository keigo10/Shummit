Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about'
  get 'events/main'
  get 'events/genre'

  get 'users/joining_events'
  get 'users/my_events'

  resources :join_events

  resources :events

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

resources :users do
	get 'users/withdraw'
end

namespace :admins do
	resources :genres
	resources :users
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
