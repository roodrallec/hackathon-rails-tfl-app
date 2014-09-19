class CreateEvent < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
    t.id :id
    t.string :decription
    t.string :status
    t.decimal :latitude
    t.decimal :longitude      #( you'll want to set the precision and scale properly here)
  end
end


data = Hash.from_xml <<EOX
<event>
<id>489875230</id>
<description>Open Bar</description>
<status>Live</status>
<latitude>29.74</latitude>
<longitude>-95.37</longitude>
</event>
EOX

Event.create!(hash[:event])
