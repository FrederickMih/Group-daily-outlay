class ChangeGroups < ActiveRecord::Migration[6.1]
  def change
    change_table :outlays_groups do |t|
      t.rename :groups_id, :group_id
    end
  end
end
