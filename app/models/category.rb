# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  before_validation :names_preprocess, :identifiers_preprocess

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
