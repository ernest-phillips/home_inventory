# frozen_string_literal: true

# Controller for Users

class UsersController < ApplicationController # rubocop:todo Style/Documentation
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: 'You have successfully signed up!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :password_salt,
                                 :password_hash, :password_confirmation)
  end
end
