Rails.application.routes.draw do
  root to: 'site#index'

  namespace :api do
    resources :keys
  end
end
