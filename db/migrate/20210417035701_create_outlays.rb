class CreateOutlays < ActiveRecord::Migration[6.1]
  def change
    create_table :outlays do |t|
      t.string :name
      t.integer :amount
      t.bigint :user_id

      t.timestamps
    end
    add_index :outlays, :name
    add_index :outlays, :user_id
  end
end
