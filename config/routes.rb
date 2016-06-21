require 'api_constraints'

MetaNotification::Engine.routes.draw do

  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      resources  :notification_types, path: 'types', except: [:new, :edit] do
        resources :notification_templates, path: 'templates', except: [:new, :edit]
        resources :notification_settings, path: 'settings', except: [:new, :edit, :create]
      end

      resources :user_notifications, only: [:index, :show, :update]
      # put 'user_notifications/:id' => 'user_notitfications#update'
      # get 'user_notifications' => 'user_notitfications#index'
      # get 'user_notifications/:id' => 'user_notitfications#show'

      # get 'user/:user_id/types/:notification_type_id/settings' => 'user_notitfications_settings#show'


      # get 'notification_types/update'
      # get 'notification_types/destroy'
      # get 'types/index' => 'notification_types#index', :defaults => { :format => 'json' }
      # get 'notification_types/show'

    end
    # scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
    #   resources :notification_types
    # end
  end


end
