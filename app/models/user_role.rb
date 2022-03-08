# frozen_string_literal: true

class UserRole < ApplicationRecord
  belongs_to :user

  enum position: {
    admin: :admin,
    moder: :moder
  }
end
