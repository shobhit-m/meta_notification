require_dependency "meta_notification/application_controller"

module MetaNotification
  class Api::V1::NotificationTemplatesController < ApplicationController
    before_action :set_template, only: [:update, :show]

    def index
      @templates = NotificationTemplate.all
    end

    def show
    end

    def create
      @template = NotificationTemplate.new(template_params)
      render :json => { errors: @template.errors.messages }, status: 422 and return if @template.errors.present?
    end

    def update
      @template.update(template_params)
      render :json => { errors: @template.errors.messages }, status: 422 and return if @template.errors.present?
    end

    def destroy
    end

    def resource_templates
      @templates = NotificationTemplate.where(resource_type: params[:resource_type], resource_id: params[:resource_id])
    end
    



    def set_template
      @template = NotificationTemplate.find params[:id]
    end

    def template_params
      # return params
      params.permit(:notification_template)
    end

    private :set_template, :template_params
  end
end
