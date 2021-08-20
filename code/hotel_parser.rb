require 'yaml'

class HotelParser
  # Implement a method to parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  def self.parse(filename)
    hotels_hash = YAML.load_file(filename)
    struct = Struct.new(:hotels)
    return struct.new(get_hotels(hotels_hash["hotels"]))
  end

  private

  #recursive call to get all hotels
  def self.get_hotels(hotels_hash)
    arr = []
    hotel_struct = Struct.new(:name,:rooms)

    hotels_hash.each do |hotel|
      new_hotel = hotel_struct.new(hotel['name'],get_rooms(hotel['rooms']))
      arr.push(new_hotel)
    end

    return arr
  end

  #recursive call to get all rooms
  def self.get_rooms(rooms_hash)
    arr = []
    room_struct = Struct.new(:name,:amenities)

    rooms_hash.each do |room|
      new_room = room_struct.new(room['name'],room['amenities'])
      arr.push(new_room)
    end

    return arr
  end
end
