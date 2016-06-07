require 'dotenv'
require 'httparty'

class Search < ActiveRecord::Base
  BASE_URL = "https://www.googleapis.com/qpxExpress/v1/"
  attr_reader :origin, :destination, :date

  # def initialize(data)
  #   @origin = data["origin"]
  #   @destination = data["destination"]
  #   @date = data["date"]
  # end

  # Sending: origin - State (SEA)
  # Sending: destination - State (NYC)
  # Sending: date - YYYY-MM-DD
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

  def self.flights_request(flight_hash)
    # origin = flight_hash["slice"]["origin"]
    # destination = flight_hash["slice"]["destination"]
    # date = flight_hash["slice"]["date"]

  #     {
  #   "request": {
  #     "passengers": {
  #       "adultCount": 1,
  #       "childCount": 1
  #     },
  #     "slice": [
  #       {
  #         "origin": "OGG",
  #         "destination": "NCE",
  #         "date": "2014-09-19",
  #         "permittedDepartureTime":
  #         {
  #           "kind": "qpxexpress#timeOfDayRange",
  #           "earliestTime": "22:00",
  #           "latestTime": "23:00"
  #         }
  #       },
  #       {
  #         "origin": "NCE",
  #         "destination": "OGG",
  #         "date": "2014-09-28",
  #         "permittedDepartureTime":
  #         {
  #           "kind": "qpxexpress#timeOfDayRange",
  #           "earliestTime": "05:00",
  #           "latestTime": "12:00"
  #         }
  #       }
  #     ],
  #     "maxPrice": "USD5400",
  #     "solutions": 10
  #   }
  # }
  end

  # def flight_response
  #   {
  #    "kind": "qpxExpress#tripsSearch",
  #    "trips": {
  #     "kind": "qpxexpress#tripOptions",
  #     "requestId": "hRI7zJ7vwhikqNiwU0JKDA",
  #     "data": {
  #      "kind": "qpxexpress#data",
  #      "airport": [
  #       {
  #        "kind": "qpxexpress#airportData",
  #        "code": "CDG",
  #        "city": "PAR",
  #        "name": "Paris Charles de Gaulle"
  #       }
  # end

end
