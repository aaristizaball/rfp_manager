class CreateImpacts < ActiveRecord::Migration
  def self.up
    create_table :impacts do |t|
      t.string :title
      t.integer :value
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :impacts
  end
end
