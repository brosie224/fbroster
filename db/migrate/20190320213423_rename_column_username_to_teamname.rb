class RenameColumnUsernameToTeamname < ActiveRecord::Migration
  def change
    rename_column :users, :username, :teamname
  end
end
