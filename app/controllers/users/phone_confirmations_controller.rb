# frozen_string_literal: true

class Users::PhoneConfirmationsController < ApplicationController
  before_action :set_user, only: %i[new create]

  skip_before_action :authenticate

  def new; end

  def create
    code = user_params[:confirmation_code]

    # проверить действителен ли код
    @user.valid
    # user.confirm
    #
    # user.confirmed?
    #
    #
    if @user
      session[:confirmed?] = true

      redirect_to edit_user_path(@user), notice: 'Session was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:confirmation_code, :phone)
  end
end
