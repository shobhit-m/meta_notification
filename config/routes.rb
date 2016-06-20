require 'api_constraints'

MetaNotification::Engine.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get 'types/create'
      get 'notification_types/update'
      get 'notification_types/destroy'
      get 'types/index' => 'notification_types#index', :defaults => { :format => 'json' }
      get 'notification_types/show'
    end
    # scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
    #   resources :notification_types
    # end
  end


end
