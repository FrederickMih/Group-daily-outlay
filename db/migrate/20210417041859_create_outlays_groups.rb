class CreateOutlaysGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :outlays_groups do |t|
      t.bigint :outlay_id
      t.bigint :group_id

      t.timestamps
    end
    add_index :outlays_groups, :outlay_id
    add_index :outlays_groups, :group_id
  end
end
