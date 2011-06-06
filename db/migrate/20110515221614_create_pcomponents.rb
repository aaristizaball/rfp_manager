class CreatePcomponents < ActiveRecord::Migration
  def self.up
    create_table :pcomponents do |t|
      t.integer :project_id
      t.integer :component_id
      t.integer :user_id
      t.integer :status_id, :default => 1
      t.boolean :reminded, :default => false
      t.boolean :chief_reminded, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :pcomponents
  end
end
