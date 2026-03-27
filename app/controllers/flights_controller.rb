class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.code, a.id ] }
    @available_dates = Flight.available_dates
    @flights = Flight.all
    @num_passengers = params[:num_passengers]
  end
end
