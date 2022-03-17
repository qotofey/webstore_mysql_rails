# frozen_string_literal: true

module Users
  class SessionsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      user = User.find_or_create_by(user_params)

      if user
        redirect_to new_user_confirmation_path(user), notice: 'Session was successfully created.'
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
end
