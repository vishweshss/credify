class ChangeUserstasksTotasksusers < ActiveRecord::Migration
  def self.up
    rename_table :users_tasks, :tasks_users
  end
  def self.down
    rename_table :users_tasks, :tasks_users
  end
end
