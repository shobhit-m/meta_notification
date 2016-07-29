require_dependency "meta_notification/application_controller"

module MetaNotification
  class Api::V1::NotificationsController < ApplicationController

    def resource_notification
      if params[:resource_type].present? && params[:resource_id].present?
        mobile_or_in_app = (params[:platform] == 'mobile') ? 'mobile'.to_sym : 'in_app'.to_sym
        @notifications =  MetaNotification::Notification.select("mn_notifications.*", mobile_or_in_app, "mn_notification_types.name", "mn_notification_types.icon", "mn_notification_types.label")
        .joins('JOIN mn_notification_templates on mn_notification_templates.id = mn_notifications.notification_template_id')
        .joins('JOIN mn_notification_types on mn_notification_types.id = mn_notification_templates.notification_type_id')
        .where(resource_type: params[:resource_type], resource_id: params[:resource_id])
        .includes(:users)
        @created_by_users = User.where(id: @notifications.map(&:created_by_id).uniq)

      end
      # @notifications = MetaNotification::Notification.includes(:users).where(resource_type: params[:resource_type], resource_id: params[:resource_id])
      # @templates = MetaNotification::NotificationTemplate.includes(:notification_type).where(id: @notifications.map(&:notification_template_id).uniq)
    end

  end
end
