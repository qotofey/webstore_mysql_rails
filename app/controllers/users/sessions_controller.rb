# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # добавить валидацию теллефона
    phone_number = Preprocessor.for_phone(user_params[:phone])
    user = User.find_or_create_by(phone: phone_number)
    # !проверить удалён ли он, если да - восстановить данные после подтверждения (confirmations)
    # проверить заблокирован ли он, если да - то перезагрузить страницу входа и вывести сообщение о блокировке

    if user.blocked?
      render :new
    else
      redirect_to new_user_confirmation_path(user), notice: 'Session was successfully created.'
    end
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:phone)
  end
end
