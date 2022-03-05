# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  before_validation :names_preprocess, :identifiers_preprocess

  private

  def names_preprocess
    self.name = name.strip.capitalize.gsub(/\s{2,}/, ' ')
  end

  def identifiers_preprocess
    self.slug = "#{id}-#{name.parameterize}" unless slug.present?
  end
end
