# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    phone_number = Preprocessor.run_for_phone(user_params[:phone])
    user = find_user
    user.present?
    user.blocked?

    User.find_or_create_by(phone: phone_number)
    # проверить заблокирован ли он, если да - то перезагрузить страницу входа и вывести сообщение о блокировке
    # !проверить удалён ли он, если да - восстановить данные после подтверждения (phone_confirmations)

    if confirmed? || current_user&.admin?
      User::SessionCreationService.new(session, user).call

      redirect_to edit_user_path(user), notice: 'Session was successfully created.'
    else
      redirect_to new_user_phone_confirmation_path(user)
    end
  end

  def destroy
    User::SessionDeletionService.new(session).call

    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:phone, :id, :code)
  end

  def confirmed?
    @confirmed ||= session.delete(:confirmed?)
  end

  def find_user
    User.find_by(id: user_params[:id])
  end
end
