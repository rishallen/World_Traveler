require 'dotenv'
require 'httparty'

class Search < ActiveRecord::Base
  BASE_URL = "https://www.googleapis.com/qpxExpress/v1/"
  attr_reader :origin, :destination, :date

  def self.get_flight(search)
    data = HTTParty.post(BASE_URL + "trips/search?key=#{ENV["QPX_KEY"]}", :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json' },
      :body => {
        "request": {
        "passengers": {
          "adultCount": 1,
        },
        "slice": [
          {
            "origin": search[:origin],
            "destination": search[:destination],
            "date": search[:date]
          },
        ]
      }
      }.to_json)
  end
end
