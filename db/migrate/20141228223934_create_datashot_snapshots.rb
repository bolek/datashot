class CreateDatashotSnapshots < ActiveRecord::Migration
  def change
    create_table :datashot_snapshots do |t|
      t.string :name
      t.text :query
      t.text :result
      t.datetime :last_ran_at

      t.timestamps
    end
  end
end
