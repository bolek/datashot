class AddErrorMessageToSnapshots < ActiveRecord::Migration
  def change
    add_column :datashot_snapshots, :error_message, :string
  end
end
