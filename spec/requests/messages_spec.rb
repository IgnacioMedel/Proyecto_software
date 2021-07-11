require 'rails_helper'

RSpec.describe "Messages", type: :request do
    describe "index" do
        it "should return a successful request" do
            get "/messages"
            expect(response).to have_http_status(:ok)
        end

        it "should render index view" do
            get "/messages"
            expect(response).to render_template(:index)
        end
    end

    describe "new" do
        it "should return a successful request" do
            get "/messages/new"
            expect(response).to have_http_status(:ok)
        end

        it "should render index view" do
            get "/messages/new"
            expect(response).to render_template(:new)
        end
    end
    describe "GET /edit" do
        it "returns http success" do
          get "/messages/#@id"
          expect(response).to have_http_status(:success)
        end
    end
end
