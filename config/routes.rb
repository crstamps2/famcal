Rails.application.routes.draw do
  root to: 'site#index'

  namespace :api do
    resources :keys
    post 'saveKeys', to: 'keys#save_keys', as: :save_keys
  end

  # IMPORTANT #
  # This `match` must be the *last* route in routes.rb
  match '*path', to: 'site#index', via: :all
end
