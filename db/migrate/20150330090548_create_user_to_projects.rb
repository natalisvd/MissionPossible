class CreateUserToProjects < ActiveRecord::Migration
  def change
    create_table :user_to_projects do |t|
      t.integer :user_id
      t.integer :project_id
      t.timestamps null: false
    end
  end
end
