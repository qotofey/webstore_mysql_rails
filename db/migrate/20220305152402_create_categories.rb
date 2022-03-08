# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: true, index: { unique: true }
      t.string :slug, null: true, index: { unique: true }
      t.datetime :approved_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
