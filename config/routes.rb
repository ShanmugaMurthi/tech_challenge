Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meetups, only: [:index] do
    collection do
      get :events
    end
  end
end
