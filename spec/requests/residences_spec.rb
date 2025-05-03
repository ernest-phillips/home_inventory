# frozen string_literal: true
require 'rails_helper'

RSpec.describe "Residences API", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:residence) { create(:residence, user: user) }
  let!(:other_residence) { create(:residence, user: other_user) }


  before do
    sign_in user
  end

  describe "GET /residences/:id" do
    it "returns the user's own residence" do
      get "/api/v1/residences/#{residence.id}"
      expect(response).to have_http_status(:ok)
      expect(json_response['id']).to eq(residence.id)
    end

    it "returns 404 for another user's residence" do
      expect {
        get "/api/v1/residences/#{other_residence.id}"
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

  end
end
