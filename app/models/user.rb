# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  birth_date         :date
#  blocked_at         :datetime
#  confirmed_at       :datetime
#  deleted_at         :datetime
#  failed_attempts    :integer          default(0), not null
#  first_name         :string
#  gender             :string
#  last_name          :string
#  locked_at          :datetime
#  middle_name        :string
#  phone              :string           default(""), not null
#  promo              :string           default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  blocked_by_user_id :integer
#  created_by_user_id :integer
#  deleted_by_user_id :integer
#  updated_by_user_id :integer
#
# Indexes
#
#  index_users_on_blocked_by_user_id  (blocked_by_user_id)
#  index_users_on_created_by_user_id  (created_by_user_id)
#  index_users_on_deleted_by_user_id  (deleted_by_user_id)
#  index_users_on_phone               (phone) UNIQUE
#  index_users_on_promo               (promo) UNIQUE
#  index_users_on_updated_by_user_id  (updated_by_user_id)
#
class User < ApplicationRecord
  include Blockable
  include Deletable
  include Confirmable
  include Roleable

  belongs_to :created_by_user, class_name: 'User', optional: true
  belongs_to :updated_by_user, class_name: 'User', optional: true

  enum gender: {
    male: 'male',
    female: 'female'
  }

  validates :phone, presence: true, length: { is: 11 }, uniqueness: true
  validates :promo, promo: true, presence: true, length: { maximum: 16 }

  with_options if: :confirmed? do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end

  # TODO: важна последовательность, напиши тест
  before_validation :identifiers_preprocess, :names_preprocess, :key_fields_preprocess

  def full_name
    [first_name, middle_name.presence, last_name].compact.join(' ')
  end

  def full_name_with_id
    "#{full_name} (id: #{id})"
  end

  private

  def names_preprocess
    self.first_name = Preprocessor.for_name(first_name)
    self.last_name = Preprocessor.for_name(last_name)
    self.middle_name = Preprocessor.for_name(middle_name)
  end

  def key_fields_preprocess
    self.phone = Preprocessor.for_phone(phone)
    self.promo = Preprocessor.for_promo(promo)
  end

  def identifiers_preprocess
    set_default_promo unless promo.present?
  end

  # TODO: возможна коллизия, переписать
  def set_default_promo
    self.promo = SecureRandom.random_number(1_000_000).to_s.rjust(6, '0')
  end
end
