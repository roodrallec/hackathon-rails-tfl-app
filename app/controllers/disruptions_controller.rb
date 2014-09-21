class DisruptionsController < ApplicationController
#TimsUpdater.perform_async
  def index #list all disruptions
    @disruptions = Disruption.all
    @hash = Gmaps4rails.build_markers(@disruptions) do |disruption, marker|
      marker.lng disruption.coordinatesLL.split(',')[0]
      marker.lat disruption.coordinatesLL.split(',')[1]
      marker.infowindow	disruption.comments
#     marker.picture({
#      "url" => "/logo.png",
#      "width" =>  32,
#      "height" => 32})
#     marker.json({:id => user.id })
    end 
  end  
end
