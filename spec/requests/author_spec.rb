require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/author/new"
      expect(response).to have_http_status(:success)
    end
  end

end
