require_dependency 'meta_notification/application_controller'
require "meta_notification_authority"

module MetaNotification
    module Api
        module V1
            class UserNotificationsController < ApplicationController
                before_action :init_authorizer

                before_action :set_user_notification, only: [:update, :show]
                before_action :set_notification_type_ids_for_filter, only: [:notifications, :mark_all_read]

                def show
                end

                def update
                  if @user_notifications_authorizer.updatable_by?(current_user, @user_notification)
                    @user_notification.update(user_notification_params)
                    render :json => {marked: true}, status: 200 and return
                  end
                  render :json => "You are not authorize to complete this action.",  status: 422
                end

                def notifications
                  if MnAuthorizers::UserNotificationAuthorizer.readable_by?(current_user)
                    mobile_or_in_app = (params[:platform] == 'mobile') ? 'mobile'.to_sym : 'in_app'.to_sym
                    @notifications =  MetaNotification::Notification.select(:id, "mn_notifications.*", "mn_user_notifications.id","mn_user_notifications.user_id", mobile_or_in_app, "mn_user_notifications.is_read", "mn_notification_types.name", "mn_notification_types.icon", "mn_notification_types.label", "mn_notifications.created_by_id", "mn_notifications.created_at")
                    .joins('JOIN mn_user_notifications on mn_user_notifications.notification_id = mn_notifications.id')
                    .joins('JOIN mn_notification_types on mn_notification_types.id = mn_user_notifications.notification_type_id')
                    .where("mn_user_notifications.user_id": params[:user_id], "mn_user_notifications.notification_type_id": @notification_type_in_ids)
                    .where.not("mn_user_notifications.notification_type_id": @notification_type_not_in_ids)
                    @unread_count = @notifications.select { |n| n.is_read == 0 }.length
                    @notifications = @notifications.where("mn_user_notifications.is_read": ((params[:is_fetch_unread].try(:to_bool).present?) ? false : [true, false]) )
                    @notifications = @notifications.where("mn_notifications.resource_type": params[:resource_type], "mn_notifications.resource_id": params[:resource_id]) if params[:resource_id].present? && params[:resource_type].present?
                    @notifications = @notifications.page(params[:current_page]) if params[:current_page].present?

                    @created_by_users = User.where(id: @notifications.map(&:created_by_id).compact.uniq)
                    # mobile_or_in_app = (params[:platform] == 'mobile') ? 'mobile'.to_sym : 'in_app'.to_sym
                    # @notifications =  MetaNotification::UserNotification.select(:id,:user_id, mobile_or_in_app, :is_read, "mn_notification_types.name", "mn_notification_types.icon", "mn_notification_types.label", "mn_notifications.created_by_id", "mn_notifications.created_at", "mn_notifications.attachment")
                    # .joins('JOIN mn_notifications on mn_notifications.id = mn_user_notifications.notification_id')
                    # .joins('JOIN mn_notification_types on mn_notification_types.id = mn_user_notifications.notification_type_id')
                    # .where(user_id: params[:user_id], notification_type_id: @notification_type_in_ids)
                    # .where.not(notification_type_id: @notification_type_not_in_ids)
                    # @unread_count = @notifications.select { |n| !n.is_read }.length
                    #
                    # @notifications = @notifications.where(is_read: ((params[:is_fetch_unread].try(:to_bool).present?) ? false : [true, false]) )
                    # @notifications = @notifications.page(params[:current_page]) if params[:current_page].present?
                    #
                    # @created_by_users = User.where(id: @notifications.map(&:created_by_id).compact.uniq)
                    return
                  end
                  render :json => "You are not authorize to complete this action.",  status: 422
                end

                def mark_all_read
                  @user_notifications =  MetaNotification::UserNotification.where(user_id: current_user.id, is_read: false, notification_type_id: @notification_type_in_ids)
                  .where.not(notification_type_id: @notification_type_not_in_ids)
                  @user_notifications.update_all({is_read: true})
                  render :json => {marked: true}, status: 200 and return
                end

                def destroy
                end

                def set_user_notification
                    @user_notification = UserNotification.find params[:id]
                end

                def set_notification_type_ids_for_filter
                  @notification_type_not_in_ids = (params[:notification_type_not_in].present?) ? MetaNotification::NotificationType.where(name: params[:notification_type_not_in]).pluck(:id) : nil
                  @notification_type_in_ids = (params[:notification_type_in].present?) ? MetaNotification::NotificationType.where(name: params[:notification_type_in]).pluck(:id) : MetaNotification::NotificationType.all.pluck(:id)
                end

                def user_notification_params
                    params.permit(:is_read)
                end

                def init_authorizer
                  @user_notifications_authorizer = MnAuthorizers::UserNotificationAuthorizer.new
                end

                private :set_user_notification, :user_notification_params, :init_authorizer, :set_notification_type_ids_for_filter
            end
          end
    end
end
