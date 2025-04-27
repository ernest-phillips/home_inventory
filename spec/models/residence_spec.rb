require 'rails_helper'

RSpec.describe Residence, type: :model do
  it "is valid with valid attributes" do
    residence = Residence.new(name: "My House", address: "1234 Main St")
    expect(residence).to be_valid
  end

  it "is invalid without a name" do
    residence = Residence.new(name: nil, address: "1234 Main St")
    expect(residence).to_not be_valid
  end

  it "is invalid without an address" do
    residence = Residence.new(name: "My House", address: nil)
    expect(residence).to_not be_valid
  end

  it "has many items" do
    assoc = Residence.reflect_on_association(:items)
    expect(assoc.macro).to eq :has_many
  end
end
