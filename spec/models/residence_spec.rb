require 'rails_helper'

RSpec.describe Residence, type: :model do
  it "is valid with valid attributes" do
    residence = build(:residence)
    expect(residence).to be_valid
  end

  it "is invalid without a name" do
    residence = build(:residence, name: nil)
    expect(residence).to_not be_valid
    expect(residence.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an address" do
    residence = build(:residence, address: nil)
    expect(residence).to_not be_valid
    expect(residence.errors[:address]).to include("can't be blank")
  end

  describe "associations" do
    it "has many items" do
      assoc = Residence.reflect_on_association(:items)
      expect(assoc.macro).to eq :has_many
    end
  end
end
