class ModifyPrefs < ActiveRecord::Migration
  def up
    add_column :prefs, :user_id, :integer
  end
  
  def down
    remove_column :prefs, :user_id, :integer
  end
end
