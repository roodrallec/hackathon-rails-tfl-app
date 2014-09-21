class AddModToDisruptions < ActiveRecord::Migration
  def change
    add_column :disruptions, :modDate, :datetime
  end
end
