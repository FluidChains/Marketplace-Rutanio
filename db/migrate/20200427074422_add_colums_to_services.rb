class AddColumsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :lenguaje, :text
    add_column :services, :exos_amount, :integer
    add_column :services, :mail_servicio, :string
    add_column :services, :horas, :integer
    add_column :services, :wpp, :string
    add_column :services, :web, :text
  end
end
