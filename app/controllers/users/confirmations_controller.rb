# frozen_string_literal: true

class Users::ConfirmationsController < ApplicationController
  before_action :set_user, only: %i[new create]

  def new; end

  def create
    # проверить есть ли пользователь
    # проверить есть ли
    # user.confirm
    #
    # user.confirmed?
    #
    #
    if @user
      session[:current_user_id] = @user.id
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
    params.require(:user).permit(:confirmation_code)
  end
end
