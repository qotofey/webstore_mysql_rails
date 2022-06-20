# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :ensure_authentication

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

  def ensure_authentication
    return if user_signed_in?

    render_unauthorized
  end

  def render_unauthorized
    render status: :unauthorized, html: '401'
  end

  def render_forbidden
    render status: :forbidden, html: '403'
  end

  def render_no_content
    render status: :no_content
  end
end
