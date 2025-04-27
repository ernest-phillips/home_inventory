require 'rails_helper'

RSpec.describe Residence, type: :model do
  it 'is valid with valid attributes' do
    residence = build(:residence)
    expect(residence).to be_valid
  end

  it 'is invalid without a name' do
    residence = build(:residence, name: nil)

    expect(residence.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an address' do
    residence = build(:residence, address: nil)

    expect(residence.errors[:address]).to include("can't be blank")
  end

  it 'is invalid without a city' do
    residence = build(:residence, city: nil)

    expect(residence.errors[:city]).to include("can't be blank")
  end

  it 'is invalid without a state' do
    residence = build(:residence, state: nil)

    expect(residence.errors[:state]).to include("can't be blank")
  end

  it 'is invalid without a zip code' do
    residence = build(:residence, zip_code: nil)

    expect(residence.errors[:zip_code]).to include("can't be blank")
  end

  # state has to be exactly 2 characters
  it 'is invalid with a state longer than 2 characters' do
    residence = build(:residence, state: 'California')

    expect(residence.errors[:state]).to include('is the wrong length (should be 2 characters)')
  end

  # zip_code has to be exactly 5 characters
  it 'is invalid with a zip code longer than 5 characters' do
    residence = build(:residence, zip_code: '123456')

    expect(residence.errors[:zip_code]).to include('is the wrong length (should be 5 characters)')
  end

  it 'is invalid with a zip code shorter than 5 characters' do
    residence = build(:residence, zip_code: '123')

    expect(residence.errors[:zip_code]).to include('is the wrong length (should be 5 characters)')
  end

  it 'is invalid with a non-numeric zip code' do
    residence = build(:residence, zip_code: 'abcde')

    expect(residence.errors[:zip_code]).to include('must be 5 digits')
  end

  # state must be a valid U.S. state abbreviation
  it 'is invalid with an invalid state' do
    residence = build(:residence, state: 'ZZ')

    expect(residence.errors[:state]).to include('is not a valid U.S. state abbreviation')
  end

  it 'is invalid with a duplicate residence' do
    create(:residence, address: '123 Main St', city: 'Springfield', state: 'IL', zip_code: '62701')
    residence = build(:residence, address: '123 Main St', city: 'Springfield', state: 'IL', zip_code: '62701')

    expect(residence.errors[:zip_code]).to include('Residence with the same address already exists')
  end

  describe 'associations' do
    it 'has many items' do
      assoc = described_class.reflect_on_association(:items)
      expect(assoc.macro).to eq :has_many
    end
  end
end
