require_dependency "meta_notification/application_controller"
require "meta_notification_authority"

module MetaNotification
  module Api
    module V1
      class NotificationTypesController < ApplicationController
        include MetaNotificationAuthority

        before_action :set_type, only: [:update, :show]
        before_action :authorize

        def create
          @type = NotificationType.create(type_params)
          render :json => @type
        end

        def update
          @type.update(type_params)
          render :json => @type
        end

        def index
          @types = NotificationType.all
          render :json => controller_name.classify
          # render :json => @types
        end

        def show
          render :json => @type
        end

        def destroy
        end

        def set_type
          @type = NotificationType.find params[:id]
        end

        def type_params
          # return params
          params.permit(:notification_type)
        end

        private :set_type, :type_params

      end

    end
  end
end
