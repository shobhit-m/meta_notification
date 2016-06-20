require 'rails_helper'

module MetaNotification
  RSpec.describe NotificationTypesController, type: :controller do

    describe "GET #create" do
      it "returns http success" do
        get :create
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #update" do
      it "returns http success" do
        get :update
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #destroy" do
      it "returns http success" do
        get :destroy
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show
        expect(response).to have_http_status(:success)
      end
    end

  end
end
