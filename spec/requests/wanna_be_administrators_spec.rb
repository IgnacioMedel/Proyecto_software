require 'rails_helper'

RSpec.describe "WannaBeAdministrators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/wanna_be_administrators/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/wanna_be_administrators/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/wanna_be_administrators/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
