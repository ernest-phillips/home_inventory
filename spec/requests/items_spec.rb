# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "Items API", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:residence) { create(:residence, user: user) }
  let!(:other_residence) { create(:residence, user: other_user) }
  let!(:item) { create(:item, residence: residence) }
  let!(:other_item) { create(:item, residence: other_residence) }

  before do
    sign_in user
  end

  describe "GET /residences/:residence_id/items/:id" do
    it "returns the user's own item" do
      get "/api/v1/residences/#{residence.id}/items/#{item.id}"
      expect(response).to have_http_status(:ok)
      expect(json_response['id']).to eq(item.id)
    end

    it "returns 404 for another user's item" do
      expect {
        get "/api/v1/residences/#{other_residence.id}/items/#{other_item.id}"
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
