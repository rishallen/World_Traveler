require 'httparty'

module TravelWrapper

BASE_URL = "https://www.googleapis.com/qpxExpress/v1/"
attr_reader :origin, :destination, :date

# Sending: Origin - A
# Sending: Destination - Country, State, City, Zip
def self.get_flight(collection)
  data = HTTParty.post(BASE_URL + "trips/search?key=ENV["QPX_KEY"]", :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json' },
    body: {
      "slice": {
        collection[:origin],
        collection[:destination],
        collection[:date]
        }
      }
    )
end

  # def self.find(id)
  #   # http://pokeapi.co/api/v2/pokemon/25/
  #   # find a pokemon with the passed id
  #   data = HTTParty.get(BASE_URL + "pokemon/#{id}/").parsed_response
  #
  #   # return an instance of pokemon for that id
  #   self.new(data)
  # end


end
