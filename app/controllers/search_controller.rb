class SearchController < ApplicationController

  def index
  end

  def create
    @search = Search.create(flight_request_params)
    if @search.save
      redirect_to root
    else
      render :new
    end
  end

  def show
  end

  def flight_request
    search = flight_request_params
    @flights = Search.get_flight(search)
    render :show
  end

  def flight_request_params
    params.permit([:origin, :destination, :date])
  end
end
