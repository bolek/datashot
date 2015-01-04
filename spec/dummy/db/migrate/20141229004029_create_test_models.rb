class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models do |t|
      t.string :a
      t.integer :b
      t.string :c

      t.timestamps
    end
  end
end
