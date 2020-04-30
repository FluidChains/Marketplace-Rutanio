class AddColumnToSkill < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :color_tag, :string
  end
end
