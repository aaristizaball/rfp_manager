class CreateRequirements < ActiveRecord::Migration
  def self.up
    create_table :requirements do |t|
      t.string :title
      t.integer :component_id

      t.timestamps
    end
  end

  def self.down
    drop_table :requirements
  end
end
