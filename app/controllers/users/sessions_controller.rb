# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save(validation: true)
      redirect_to @user, notice: 'Session was successfully created.'
    else
      render :new
    end
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:phone)
  end
end