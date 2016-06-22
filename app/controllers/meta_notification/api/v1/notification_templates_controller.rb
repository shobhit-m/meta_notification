require_dependency "meta_notification/application_controller"

module MetaNotification
  class Api::V1::NotificationTemplatesController < ApplicationController
    before_action :set_template, only: [:update, :show]

    def index
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
    end

    def set_template
      @template = NotificationTemplate.find params[:id]
    end
  end
end
