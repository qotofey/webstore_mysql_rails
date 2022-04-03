# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :ensure_authentication, only: %i[index show]

  def index; end
end
