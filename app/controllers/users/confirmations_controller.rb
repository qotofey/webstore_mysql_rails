# frozen_string_literal: true

class Users::ConfirmationsController < ApplicationController
  def new

  end

  def create
    
  end

  private

  def user_params
    params.require(:confirmation).permit(:code)
  end
end