class AddRightColumns < ActiveRecord::Migration
  def change
    change_table :disruptions do |t|
      t.remove :comments, :startTime, :lastModTime
      t.text :comments
      t.datetime :startTime, :lastModTime
    end
  end
end
