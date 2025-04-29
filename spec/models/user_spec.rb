# spec/models/user_spec.rb

require 'rails_helper'
# This file is copied to spec/ when you run 'rails generate rspec:install'
# spec/rails_helper.rb

RSpec.describe User, type: :model do
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(email: 'user@example.com', password: 'password123')
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(password: 'password123')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid without a password' do
      user = User.new(email: 'user@example.com')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is not valid with a duplicate email' do
      User.create!(email: 'user@example.com', password: 'password123')
      user = User.new(email: 'user@example.com', password: 'differentpass')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end
  end

  describe 'associations' do
    it { should have_many(:items) }
    it { should have_many(:residences) }
  end

  describe 'instance methods' do
    it 'returns the full name' do
      user = User.new(first_name: 'John', last_name: 'Doe')
      expect(user.full_name).to eq('John Doe')
    end
  end
end
