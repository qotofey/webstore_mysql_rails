# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  approved_at :datetime
#  deleted_at  :datetime
#  name        :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#  index_categories_on_slug  (slug) UNIQUE
#
class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  has_many :fields, class_name: 'CategoryField'
  accepts_nested_attributes_for :fields, allow_destroy: true

  before_validation :names_preprocess, :identifiers_preprocess

  def field_names
    fields.map(&:name).compact.join(', ').capitalize
  end

  def to_param
    slug
  end

  private

  def names_preprocess
    self.name = name.strip.capitalize.gsub(/\s{2,}/, ' ')
  end

  def identifiers_preprocess
    self.slug = name.parameterize unless slug.present?
  end
end
