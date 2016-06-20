require_dependency "meta_notification/application_controller"

module MetaNotification
  module Api
    module V1
      class NotificationTypesController < ApplicationController
        def create
        end

        def update
        end

        def destroy
        end

        def index
          types = NotificationType.all
          render :json => types
        end

        def show
        end
      end
    end
  end
end
