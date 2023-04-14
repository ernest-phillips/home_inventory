# frozen_string_literal: true

# User model

class User < ApplicationRecord # rubocop:todo Style/Documentation
  attr_accessor :password

  before_save :encrypt_password
  validates :password, confirmation: true
  validates :password, presence: { on: :create }
  validates :email, presence: true
  validates :email, uniqueness: true # rubocop:todo Rails/UniqueValidationWithoutIndex

  def self.authenticate(email, password)
    user = find_by(email:)
    return unless user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)

    user
  end

  private

  def encrypt_password
    return if password.blank?

    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
