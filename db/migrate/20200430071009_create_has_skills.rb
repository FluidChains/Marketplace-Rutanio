class CreateHasSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :has_skills do |t|
      t.references :service, foreign_key: true
      t.references :skill, foreign_key: true


      t.timestamps
    end
  end
end
