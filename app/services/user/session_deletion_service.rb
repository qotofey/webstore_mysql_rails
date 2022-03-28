# frozen_string_literal: true

class User::SessionDeletionService
  def initialize(session)
    @session = session
  end

  def call
    @session.delete(:current_user_id)
  end
end
