class ChangeTimeFormat < ActiveRecord::Migration
  def change
    change_table :disruptions do |t|
      t.change :modDate, :integer
    end
  end
end
