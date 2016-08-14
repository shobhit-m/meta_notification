require_dependency "meta_notification/application_controller"
require "meta_notification_authority"

module MetaNotification
  class Api::V1::NotificationTemplatesController < ApplicationController
    before_action :init_authorizer

    before_action :set_template, only: [:update, :show]

    def index
      if MnAuthorizers::NotificationTemplateAuthorizer.readable_by?(current_user)
        @templates = MetaNotification::NotificationTemplate.where(notification_type_id: params[:notification_type_id])
        render :json => @templates.first, status: 200 and return
      end
      render :json => "You are not authorize to complete this action.",  status: 422
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
      if MnAuthorizers::NotificationTemplateAuthorizer.updatable_by?(current_user) && @notification_template_authorizer.updatable_by?(current_user, @template)
        @template.update(template_params[:notification_template])
        render :json => { errors: @template.errors.messages }, status: 422 and return if @template.errors.present?
        render :json => @template, status: 200 and return
      end
      render :json => "You are not authorize to complete this action.",  status: 422
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

    def init_authorizer
      @notification_template_authorizer = MnAuthorizers::NotificationTemplateAuthorizer.new
    end

    private :init_authorizer, :set_template, :template_params
  end
end
