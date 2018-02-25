Rails.application.routes.draw do

  resources :snippets, except: [:update, :destroy]

  ##API routes
  namespace :api do
    namespace :v1 do
      resources :snippets
    end
  end

  ##Home page
  root 'snippets#index'

end
