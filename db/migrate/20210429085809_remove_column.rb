class AddColumn < ActiveRecord::Migration[6.1]
  def self.down
  add_column :users, :avatar, :String
  end
end
