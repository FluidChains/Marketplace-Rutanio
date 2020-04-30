class AddColumnToService < ActiveRecord::Migration[5.2]
  def change    
    add_column :services, :currency_sugest, :string
  end
end
