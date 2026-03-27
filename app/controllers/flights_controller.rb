class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.code, a.id ] }
    @available_dates = Flight.available_dates
    @num_passengers = params[:num_passengers]

    if params[:arrival_airport_id] && params[:departure_airport_id] && params[:date] && params[:num_passengers]
      selected_date = Date.parse(params[:date])

      @flights = Flight.where(
                departure_airport_id: params[:departure_airport_id],
                arrival_airport_id: params[:arrival_airport_id],
                date: selected_date.beginning_of_day..selected_date.end_of_day,
      )
      @num_passengers = params[:num_passengers]
    end
  end
end
