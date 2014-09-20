class Disruption < ActiveRecord::Base 
  belongs_to :tims
  validates :did, :status, :severity, :interestLevel, :category, :startTime, :location, :comment, :lastModTime, :coordinatesEN, :coordinatesLL


  def new
    @disruption = Disruption.new
  end

  def create
    @disruption = Disruption.new(disruption_params)
    @disruption.save
  end

  private
    def disruption_params
      params.require(:disruption).permit(:did, :status, :severity, :interestLevel, :category, :startTime, :location, :comment, :lastModTime, :coordinatesEN, :coordinatesLL)
    end
end
