# frozen_string_literal: true

class User::PhoneLoginService
  def initialize(phone)
    @phone = phone
  end

  def call
    @user = find_user || create_unconfirmed_user
  end

  private

  def find_user
    User.find_by(phone: @phone)
  end

  def create_unconfirmed_user
    User.create(phone: @phone)
  end

  def user_deleted?
    @user.deleted?
  end

  def user_blocked?
    @user.blocked?
  end

  def user_locked?
    @user.locked?
  end
end
