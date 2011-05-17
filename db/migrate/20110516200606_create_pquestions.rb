class CreatePquestions < ActiveRecord::Migration
  def self.up
    create_table :pquestions do |t|
      t.integer :question_id
      t.integer :project_id
      t.float :rate
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :pquestions
  end
end
