class AddColumnStateToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :state, :string, default: "published"      
  end
end
