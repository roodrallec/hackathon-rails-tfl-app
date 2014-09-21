class ChangeTimeFormat < ActiveRecord::Migration
  def change
    remove_column :modDate, :datetime
    add_column :modDate, :integer
  end
end
