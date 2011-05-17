class CreatePrequirements < ActiveRecord::Migration
  def self.up
    create_table :prequirements do |t|
      t.integer :requeriment_id
      t.integer :project_id
      t.integer :state
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :prequirements
  end
end
