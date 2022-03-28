# frozen_string_literal: true

class User::PhoneConfirmationService
  def initialize(user, current_user = nil)
    @user = user
    @current_user = current_user
  end

  def call; end
end
