class Disruption < ActiveRecord::Base 
  validates :did, presence: true, uniqueness: true, numericality: true
  validates_presence_of :status, :severity, :interestLevel, :category, :startTime, :location, :lastModTime, :coordinatesEN, :coordinatesLL #,:comments
end
