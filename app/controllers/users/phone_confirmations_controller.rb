# frozen_string_literal: true

class Users::PhoneConfirmationsController < ApplicationController
  before_action :set_confirmation, only: %i[create]

  skip_before_action :authenticate

  def new; end

  def create
    # code = user_params[:confirmation_code]

    # проверить действителен ли код
    # @user.valid
    # user.confirm
    #
    # user.confirmed?
    #

    respond_to do |format|
      if @user
        format.html {  }
        format.json {  }
      else
        format.html {  }
        format.json {  }
      end
    end
    if @user
      session[:confirmed?] = true

      redirect_to edit_user_path(@user), notice: 'Session was successfully created.'
    else
      render :new
    end
  end

  private

  def set_confirmation
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:phone)
  end
end
