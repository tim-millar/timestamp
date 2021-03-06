require 'dates'

class TimestampController < ApplicationController
  def show
    render json: timestamp_dates
  end

  private

  def timestamp_dates
    Dates.new(date)
  end

  def date
    params[:date]
  end
end
