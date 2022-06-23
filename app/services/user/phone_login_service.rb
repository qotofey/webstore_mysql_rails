# frozen_string_literal: true

class User::PhoneLoginService
  def initialize(phone)
    @phone = phone
  end

  def call
    user = find_user || create_unconfirmed_user

    return if user.blocked? || user.deleted? || user.locked?

    user
  end

  private

  def find_user
    ::User.find_by(phone: @phone)
  end

  def create_unconfirmed_user
    ::User.create(phone: @phone)
  end

  def send_confirmation_code; end
end
