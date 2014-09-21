class DisruptionsController < ApplicationController
  def index #list all disruptions
    @disruptions = Disruption.all
    @hash = Gmaps4rails.build_markers(@disruptions) do |disruption, marker|
      marker.lng disruption.coordinatesLL.split(',')[0]
      marker.lat disruption.coordinatesLL.split(',')[1]
      marker.infowindow	disruption.category
#     marker.picture({
#      "url" => "/logo.png",
#      "width" =>  32,
#      "height" => 32})
#     marker.json({:id => user.id })
    end 
  end  
end
