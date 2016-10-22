class TimestampController < ApplicationController
  def show
    render json: timestamp_converter
  end

  private

  def timestamp_converter
    {
      unix: Date.today.to_time.to_i,
      natural: Date.today.strftime("%B, %d, %Y"),
    }
  end
end
