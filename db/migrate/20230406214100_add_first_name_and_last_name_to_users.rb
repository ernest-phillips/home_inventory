# frozen_string_literal: true

# This class represents a user of the application.
#
# Users have a unique email address and a password that is encrypted
# using BCrypt. They can register and log in to the application to
# access protected resources.
class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
