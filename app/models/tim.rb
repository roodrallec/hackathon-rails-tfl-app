require 'open-uri'
class Tim
  
  def update
    url = "http://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=5ab7117a&app_key=e975ed062b4650c6b17c180fd02712db"
    Nokogiri::XML(open(url)).remove_namespaces!.xpath("//Disruption").each do |disruption|
      disruption_hash = {
      did: disruption.attr("id"),
      status: disruption.at_xpath("status").text,
      severity: disruption.at_xpath("severity").text, 
      interestLevel: disruption.at_xpath("levelOfInterest").text,
      category: disruption.at_xpath("category").text,
      startTime:disruption.at_xpath("startTime").text,
      location: disruption.at_xpath("location").text, 
      lastModTime:  disruption.at_xpath("lastModTime").text,
      coordinatesEN: disruption.at_xpath("CauseArea/DisplayPoint/Point/coordinatesEN").text,
      coordinatesLL: disruption.at_xpath("CauseArea/DisplayPoint/Point/coordinatesLL").text
#     comments: disruption.at_xpath("comments").text,
      } 
      disruption_record = Disruption.new(disruption_hash)
      disruption_record.save
    end
  end
end
