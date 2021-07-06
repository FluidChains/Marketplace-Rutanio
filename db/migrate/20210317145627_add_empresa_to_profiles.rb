class AddEmpresaToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :empresa, :string
  end
end
