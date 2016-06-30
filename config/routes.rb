Rails.application.routes.draw do
  root "dashboard#index"

  namespace :api do
    namespace :v1 do
      resources :ideas, only: [:index, :show, :create, :destroy, :update]
      resources :qualities, only: [:index]
    end
  end
end
