# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  birth_date         :date
#  deleted_at         :datetime
#  first_name         :string
#  gender             :string
#  last_name          :string
#  middle_name        :string
#  phone              :string
#  promo              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  created_by_user_id :integer
#  deleted_by_user_id :integer
#  updated_by_user_id :integer
#
# Indexes
#
#  index_users_on_created_by_user_id  (created_by_user_id)
#  index_users_on_deleted_by_user_id  (deleted_by_user_id)
#  index_users_on_phone               (phone) UNIQUE
#  index_users_on_promo               (promo) UNIQUE
#  index_users_on_updated_by_user_id  (updated_by_user_id)
#
class User < ApplicationRecord
  enum gender: {
    male: 'male',
    female: 'female'
  }
end
