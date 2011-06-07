class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.date :due_date
      t.boolean :requirements_finished
      t.boolean :questions_finished
      t.string :state
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
