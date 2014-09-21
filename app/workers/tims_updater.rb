require 'open-uri'
class TimsUpdater
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly }

  @@url = "http://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=5ab7117a&app_key=e975ed062b4650c6b17c180fd02712db"

  def perform
    puts "Updating TIMS"
    update
  end
  def update
    feed = parseXml
    addNew(feed[:disruptions], feed[:dtime])
    removeOld(feed[:dtime])
  end
  def parseXml
    doc = Nokogiri::XML(open(@@url)).remove_namespaces!
    time=doc.xpath("//PublishDateTime/@canonical").text
    dtime=Time.new(time[0..3],time[5..6],time[8..9],time[11..12],time[14..15],time[17..18]).to_i
    disruptions = doc.xpath("//Disruption")
    feed = { :disruptions => disruptions, :dtime => dtime}
  end
  def addNew(disruptions, dtime)
    disruptions.each do |disruption|
        disruption_hash = {
        did: disruption.attr("id"),
        status: disruption.at_xpath("status").text,
        severity: disruption.at_xpath("severity").text,
        interestLevel: disruption.at_xpath("levelOfInterest").text,
        category: disruption.at_xpath("category").text,
        startTime:disruption.at_xpath("startTime").text,
  #     endTime											  optional values
        location: disruption.at_xpath("location").text,
  #     corridor string
        comments: disruption.at_xpath("comments").text,
  #     currentUpdate string
  #     remarkTime dateTime
        lastModTime:  disruption.at_xpath("lastModTime").text,
        coordinatesEN: disruption.at_xpath("CauseArea/DisplayPoint/Point/coordinatesEN").text,
        coordinatesLL: disruption.at_xpath("CauseArea/DisplayPoint/Point/coordinatesLL").text,
  # Streets name	string
  # Streets closure string
  # Streets directions  string
  # Streets toid	string maxLength	    Cause area will hold either a Streets which will hold coordinates for a line or a Boundary object with coordinates for a polygon
  # Streets coordinatesEN	string
  # Streets coordinatesLL	string
  # Boundary coordinatesEN  string
  # Boundary coordinatesLL string
	modDate: dtime
        }
        disruption_record = Disruption.new(disruption_hash)
        disruption_record.save	
    end
  end 
  def removeOld(dtime)
    Disruption.where.not(modDate: dtime).destroy_all
  end
end
