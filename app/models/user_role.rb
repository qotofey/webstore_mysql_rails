# frozen_string_literal: true

# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_user_roles_on_user_id               (user_id)
#  index_user_roles_on_user_id_and_position  (user_id,position) UNIQUE
#
class UserRole < ApplicationRecord
  belongs_to :user

  enum position: {
    admin: :admin,
    moder: :moder
  }
end
