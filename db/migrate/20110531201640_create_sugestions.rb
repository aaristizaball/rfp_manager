class CreateSugestions < ActiveRecord::Migration
  def self.up
    create_table :sugestions do |t|
      t.string :title
      t.integer :component_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sugestions
  end
end
