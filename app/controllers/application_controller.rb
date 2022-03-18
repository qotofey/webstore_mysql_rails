# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?

  def current_user_id
    session[:current_user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def user_signed_in?
    !!current_user
  end
end
