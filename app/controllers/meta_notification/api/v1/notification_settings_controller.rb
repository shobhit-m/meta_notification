require_dependency "meta_notification/application_controller"

module MetaNotification
  class Api::V1::NotificationSettingsController < ApplicationController
    before_action :init_authorizer
    def index
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def init_authorizer
      @notification_setting_authorizer = NotificationSettingAuthorizer.new
    end
  end
end
