# frozen_string_literal: true

# == Schema Information
#
# Table name: category_fields
#
#  id          :integer          not null, primary key
#  info        :text
#  name        :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_category_fields_on_category_id  (category_id)
#
class CategoryField < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :category

  enum type: {
    integer: 'integer',
    float: 'float',
    string: 'string'
  }

  validates :type, presence: true
  validates :name, presence: true
  validates :info, presence: true
end
