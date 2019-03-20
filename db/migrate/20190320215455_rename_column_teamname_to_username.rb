class RenameColumnTeamnameToUsername < ActiveRecord::Migration
  def change
    rename_column :users, :teamname, :username
  end
end
