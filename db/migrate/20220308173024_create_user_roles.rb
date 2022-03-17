class CreateUserRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_roles do |t|
      t.string :position
      t.references :user, references: :users

      t.timestamps
    end

    add_index :user_roles, %i[user_id position], unique: true
  end
end
