require_dependency "meta_notification/application_controller"

module MetaNotification
  class Api::V1::NotificationTemplatesController < ApplicationController
    before_action :set_template, only: [:update, :show]

    def index
      @templates = MetaNotification::NotificationTemplate.where(notification_type_id: params[:notification_type_id])
      render :json => @templates.first
    end

    # def show
    #   render :json => @template
    # end

    # def create
    #   @template = MetaNotification::NotificationTemplate.new(template_params)
    #   render :json => { errors: @template.errors.messages }, status: 422 and return if @template.errors.present?
    # end
    #
    def update
      @template.update(template_params[:notification_template])
      render :json => { errors: @template.errors.messages }, status: 422 and return if @template.errors.present?
      render :json => @template
    end
    #
    # def destroy
    # end
    #
    # def resource_templates
    #   @templates = MetaNotification::NotificationTemplate.where(resource_type: params[:resource_type], resource_id: params[:resource_id])
    # end
    #



    def set_template
      @template = MetaNotification::NotificationTemplate.find params[:id]
    end

    def template_params
      # return params
      params.permit(notification_template: [:in_app, :mobile, :push, :email, :email_subject])
    end

    private :set_template, :template_params
  end
end
