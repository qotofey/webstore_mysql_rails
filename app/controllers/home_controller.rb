# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate, only: %i[index show]

  def index; end
end
