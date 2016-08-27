require_dependency "meta_notification/application_controller"
require "meta_notification_authority"

module MetaNotification
  module Api
    module V1
      class NotificationTypesController < ApplicationController
        include MetaNotificationAuthority

        before_action :set_type, only: [:update, :show]
        # before_action :authorize
        before_action :init_authorizer

        # def create
        #   if MnAuthorizers::NotificationTypeAuthorizer.creatable?(currrent_user)
        #     @type = MetaNotification::NotificationType.create(type_params)
        #     render :json => @type
        #   end
        # end
        #
        # def update
        #   if @notification_type_authorizer.updtable_by?(current_user, @type)
        #     @type.update(type_params)
        #     render :json => @type
        #   end
        # end

        def index
          if MnAuthorizers::NotificationTypeAuthorizer.readable_by?(current_user)
            @types = MetaNotification::NotificationType.all
            render :json => @types, status: 200 and return
          end
          render :json => "You are not authorize to complete this action.",  status: 422
        end

        # def show
        #   if @notification_type_authorizer.readable_by?(current_user, @type)
        #     render :json => @type
        #   end
        # end

        def destroy
        end

        def set_type
          @type = MetaNotification::NotificationType.find params[:id]
        end

        def type_params
          # return params
          params.permit(:notification_type)
        end

        def init_authorizer
          @notification_type_authorizer = MnAuthorizers::NotificationTypeAuthorizer.new
        end

        private :set_type, :type_params, :init_authorizer

      end

    end
  end
end
