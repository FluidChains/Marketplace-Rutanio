class AddWalletsToProfiles < ActiveRecord::Migration[6.0]
  def change
      add_column :profiles, :wallet_uno, :text
      add_column :profiles, :wallet_dos, :text

  end
end
