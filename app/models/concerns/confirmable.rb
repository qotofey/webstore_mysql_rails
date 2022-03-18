# frozen_string_literal: true

module Confirmable
  extend ActiveSupport::Concern

  included do
    scope :confirmed, -> { where.not(confirmed_at: nil) }
    scope :not_confirmed, -> { where(confirmed_at: nil) }
  end

  def confirmed?
    !!confirmed_at
  end

  def confirm
    self.confirmed_at = DateTime.now
    save(validate: false)
  end

  def unconfirm
    self.confirmed_at = nil
    save(validate: false)
  end
end
