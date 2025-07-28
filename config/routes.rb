Rails.application.routes.draw do
  # Named root route
  root 'users#index'

  # Shallow nested routes
  resources :users, shallow: true do
    resources :posts do
      collection do
        get 'recent'
      end

      member do
        get 'preview'
      end
    end
  end
end
