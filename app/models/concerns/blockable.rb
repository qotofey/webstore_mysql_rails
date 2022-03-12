# frozen_string_literal: true

module Blockable
  extend ActiveSupport::Concern

  included do
    attr_writer :blocked

    belongs_to :blocked_by_user, class_name: 'User', optional: true

    before_save :check_blocking
  end

  def blocked?
    !!blocked_at
  end

  private

  def check_blocking
    return unless @blocked.in? [false, true]

    self.blocked_at = @blocked ? DateTime.now : nil
  end
end