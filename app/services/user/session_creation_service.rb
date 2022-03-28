# frozen_string_literal: true

class User::SessionCreationService
  def initialize(session, current_user)
    @user = current_user
    @session = session
  end

  def call
    @session[:current_user_id] = @user.id
  end
end
