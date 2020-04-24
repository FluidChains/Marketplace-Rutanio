class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :information
      t.text :skills
      t.integer :precio
      t.date :valid_until
      t.text :aditional_info

      t.timestamps
    end
  end
end
