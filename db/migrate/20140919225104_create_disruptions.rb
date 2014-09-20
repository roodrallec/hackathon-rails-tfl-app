class CreateDisruptions < ActiveRecord::Migration
  def change
    create_table :disruptions do |t|
      t.integer :did
      t.string :status
      t.string :severity
      t.string :interestLevel
      t.string :category
      t.string :startTime
#     t.string :endTime		  optional
      t.string :location
#     t.string :corridor	  optional
      t.string :comments
#     t.string :currentUpdate	  optional
#     t.string :remarkTime	  optional
      t.string :lastModTime
      t.string :coordinatesEN	  #British National Grid coordinates
      t.string :coordinatesLL	  #Google Maps longitude, latitude coordinates
#     t.string :streetName
#     t.string :streetClosure	  #Either streets or boundary will be defined
#     t.string :streetDirections 
#     t.string :linkToid
#     t.string :linkCoordEn
#     t.string :linkCoordLl 
#     t.string :boundaryPolygon
#     t.string :boundaryCoordEn 
#     t.string :boundaryCoordLl 
    end
  end
end
