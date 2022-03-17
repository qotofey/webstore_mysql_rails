class CreateCategoryFields < ActiveRecord::Migration[6.1]
  def change
    create_table :category_fields do |t|
      t.string :name
      t.string :slug, null: true, index: { unique: true }
      t.string :type
      t.text :info

      t.references :category, references: :categories

      t.timestamps
    end

    add_index :category_fields, %i[category_id slug], unique: true
  end
end
