class Message
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :type, type: Integer
  field :repeatIndicator, type: Integer
  field :mmsi, type: Integer
  field :shipType, type: Integer

  scope :type, ->(tpe) { where(message_type: tpe) }
  scope :source, ->(src) {where(source: src)}
  scope :navire, ->(value) { where(shipType: value) }
  scope :ship, ->{select("mmsi").distinct}

  #scope for searching an area on map
  scope :mapsearch, ->(lat1, lat2, lng1, lng2) { where(latitude: lat1..lat2, longitude: lng1..lng2)}
  #scopes for stats page
  scope :datesearch, ->(dte1, dte2) {where(:date.gte => dte1).where(:date.lte => dte2)} #{select("date")} Message.where(:date.lte => Time.now).count
  
  def self.to_csv()
      #all = Message.type(opt)
      column_names = ['type', 'repeatIndicator', 'mmsi']
       CSV.generate do |csv|
            csv << column_names
            all.each do |message|
                    csv << message.attributes.values_at(*column_names)
            end
       end
  end


  def self.getLatLong(latitude)
    tempSize = latitude.split(" ").second.size
    return latitude.split(" ").first.to_i + (latitude.split(" ").second[0..tempSize-1].to_f / 60)
  end





def self.today
  map = %Q{
    function() {
      emit(this.mmsi, {count: 1})
    }
  }

  reduce = %Q{
    function(key, values) {
      var result = {count: 0};
      values.forEach(function(value) {
        result.count += value.count;
      });
      return result;
    }
  }

  self.map_reduce(map, reduce).out(inline: true)
end


end
