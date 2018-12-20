Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new]
  resources :applications, only: [:create]
  resource :session, only: [:create, :new, :destroy]
  resources :jobs, only: [:index, :create, :new, ]

  root to: redirect('/jobs')

end
