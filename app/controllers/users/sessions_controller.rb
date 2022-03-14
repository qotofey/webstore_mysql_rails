# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  def new

  end

  def create

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:phone)
  end
end