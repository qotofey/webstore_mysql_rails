# frozen_string_literal: true

class User::PhoneConfirmationService
  def initialize(user, code)
    @user = user
    @code = code
  end

  def call
    @user.confirm
  end
end
