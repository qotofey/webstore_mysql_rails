# frozen_string_literal: true

module Deletable
  extend ActiveSupport::Concern

  included do
    attr_writer :deleted

    belongs_to :deleted_by_user, class_name: 'User', optional: true

    before_save :check_deletion
  end

  def deleted?
    !!deleted_at
  end

  private

  def check_deletion
    return unless [false, true].include? @deleted

    self.deleted_at = @deleted ? DateTime.now : nil
  end
end
