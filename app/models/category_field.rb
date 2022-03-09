# frozen_string_literal: true

# == Schema Information
#
# Table name: category_fields
#
#  id          :integer          not null, primary key
#  info        :text
#  name        :string
#  slug        :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_category_fields_on_category_id           (category_id)
#  index_category_fields_on_category_id_and_slug  (category_id,slug) UNIQUE
#  index_category_fields_on_slug                  (slug) UNIQUE
#
class CategoryField < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :category

  enum type: {
    integer: :integer,
    float: :float,
    string: :string
  }

  validates :type, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :slug, presence: true

  before_validation :names_preprocess, :identifiers_preprocess

  private

  def names_preprocess
    self.name = name.strip.capitalize.gsub(/\s{2,}/, ' ')
  end

  def identifiers_preprocess
    self.slug = name.parameterize unless slug.present?
  end
end
