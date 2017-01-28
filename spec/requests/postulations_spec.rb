require 'rails_helper'

RSpec.describe "Postulations", type: :request do
  describe "GET /postulations" do
    it "works! (now write some real specs)" do
      get postulations_path
      expect(response).to have_http_status(200)
    end
  end
end
