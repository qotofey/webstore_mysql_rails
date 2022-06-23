# frozen_string_literal: true

class User::PhoneConfirmationService
  def initialize(user, code)
    @user = user
    @code = code
  end

  def call
    return if @user.locked? || @user.blocked? || @user.deleted?

    if confirmation_code_correct?
      @user.confirm
    else
      @user.fail_confirmation_attempts
    end
  end

  private

  def confirmation_code_correct?
    @user.confirmation_code == @code
  end
end
