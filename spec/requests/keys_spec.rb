require 'rails_helper'

RSpec.describe "Keys", type: :request do
  describe "GET /keys" do
    it "works! (now write some real specs)" do
      get api_keys_path
      expect(response).to have_http_status(200)
    end
  end
end
