class RenameUsersModeratorsToModerator < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :moderators, :moderator
  end
end
