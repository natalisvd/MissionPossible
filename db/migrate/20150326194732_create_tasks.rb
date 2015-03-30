class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description, default: ''
      t.integer :project_id
      t.integer :requester_id
      t.integer :owner_id
      t.integer :parent_id
      t.timestamps null: false
    end
  end
end
