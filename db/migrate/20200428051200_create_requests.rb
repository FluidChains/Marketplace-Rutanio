class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.text :mensaje
      t.string :contacto_mail
      t.references :user, foreign_key: true
      t.references :service,null: false, foreign_key: true

      t.timestamps
    end
  end
end
