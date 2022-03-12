# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  birth_date         :date
#  blocked_at         :datetime
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

  belongs_to :created_by_user, class_name: 'User', optional: true
  belongs_to :updated_by_user, class_name: 'User', optional: true
  has_many :roles, class_name: 'UserRole', dependent: :destroy
  accepts_nested_attributes_for :roles, allow_destroy: true

  enum gender: {
    male: 'male',
    female: 'female'
  }

  validates :phone, presence: true, length: { is: 11 }, uniqueness: true
  validates :promo, presence: true, length: { maximum: 16 }, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  # TODO: важна последовательность, напиши тест
  before_validation :identifiers_preprocess, :fields_preprocess

  def full_name_with_id
    [first_name, middle_name, last_name, "(id: #{id})"].compact.join(' ')
  end

  private

  def fields_preprocess
    self.first_name = first_name.strip.capitalize
    self.last_name = last_name.strip.capitalize
    self.middle_name = middle_name&.strip&.capitalize
    self.phone = phone.gsub(/\s/, '').sub(/^8/, '7').gsub(/\D/, '')
    self.promo.upcase!
  end

  def identifiers_preprocess
    set_default_promo unless promo.present?
  end

  # TODO: возможна коллизия, переписать
  def set_default_promo
    self.promo = SecureRandom.random_number(1_000_000).to_s.rjust(6, '0')
  end
end
