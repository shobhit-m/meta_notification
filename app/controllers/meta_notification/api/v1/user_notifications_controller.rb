require_dependency "meta_notification/application_controller"

module MetaNotification
  class Api::V1::UserNotificationsController < ApplicationController
    before_action :set_user_notification, only: [:update, :show]

    def show
    end

    def update
      @user_notification.update(user_notification_params)
    end

    def user_notifications
      @user_notifications = UserNotification.where(user_id: params[:user_id])
                                            .where.not(notification_type_id: NotificationType.find_by_name('message').id)
      @unread_count = @user_notifications.select{|un| !un.is_read}.length
    end

    def user_message_notifications
      @user_notifications = UserNotification.where(user_id: params[:user_id])
                                            .where(notification_type_id: NotificationType.find_by_name('message').id)
      @unread_count = @user_notifications.select{|un| !un.is_read}.length
    end

    def destroy
    end



    def set_user_notification
      @user_notification = UserNotification.find params[:id]
    end

    def user_notification_params
      params.permit(:is_read)
    end

    private :set_user_notification
  end
end
