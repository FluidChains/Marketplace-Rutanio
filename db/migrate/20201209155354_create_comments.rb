class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.integer :calificacion

      t.timestamps
    end
  end
end
