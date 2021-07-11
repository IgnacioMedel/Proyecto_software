=begin
require 'rails_helper'

RSpec.describe "Public", type: :request do
    describe "main" do
        it "should return a successful request" do
            get "public/main`"
            expect(response).to have_http_status(:ok)
        end
    end

    describe "contact" do
        it "should return a successful request" do
            get "public/contact"
            expect(response).to have_http_status(:ok)
        end
    end
end
=end