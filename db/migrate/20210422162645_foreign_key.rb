class ForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :outlays_groups, :outlays
    add_foreign_key :outlays_groups, :groups
    add_foreign_key :groups, :users
  end
end
