# frozen_string_literal: true

class CreateCategoryFields < ActiveRecord::Migration[6.1]
  def change
    create_table :category_fields do |t|
      t.string :name
      t.string :field_type
      t.text :info

      t.references :category, references: :categories

      t.timestamps
    end
  end
end
