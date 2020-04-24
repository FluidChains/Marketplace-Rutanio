class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :nombre_categoria
      t.text :description

      t.timestamps
    end
  end
end
