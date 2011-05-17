class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :title
      t.integer :component_id
      t.integer :impact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
