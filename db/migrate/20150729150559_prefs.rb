class Prefs < ActiveRecord::Migration
  def up
    create_table :prefs do |t|
    t.string :weather
    t.string :youtube
    end
  end
  
  def down
    drop_table :prefs
  end
end