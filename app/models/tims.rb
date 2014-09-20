require 'open-uri' 

class Tims < ActiveRecord::Base	
  attr_accessor :url => "http://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=5ab7117a&app_key=e975ed062b4650c6b17c180fd02712db"
  has_many :disruptions
  def pull_tims_data
    @doc = Nokogiri::XML(open(url))
  end
end
