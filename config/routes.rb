Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      post 'talks/(:id)/messages', to: 'talks#create_message'
      resources :talks do
        member do
          get 'messages', to: 'talks#messages'
        end
      end

      mount_devise_token_auth_for 'User', at: 'auth'

      get 'users/wishlist', to: 'users#wishlist'
      put 'users', to: 'users#update'
      get 'current_user', to: 'users#current_user'

      get 'get_by_property', to: 'reservations#get_by_property'
      resources :reservations do
        member do
          post 'evaluation', to: 'reservations#evaluation'
          put 'cancel', to: 'reservations#cancel'
        end
      end

      get 'featured', to: 'properties#featured'
      get 'search', to: 'properties#search'
      get 'autocomplete', to: 'properties#autocomplete'
      get 'trips', to: 'properties#trips'
      get 'my_properties', to: 'properties#my_properties'
      resources :properties do
        member do
          post 'wishlist', to: 'properties#add_to_wishlist'
          post 'visitproperty', to: 'properties#visit_property'
          delete 'wishlist', to: 'properties#remove_from_wishlist'
          get 'check_availability', to: 'properties#check_availability'
        end
      end
    end
  end
end
