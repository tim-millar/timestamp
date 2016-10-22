class TimestampController < ApplicationController
  def show
    render json: {
             foo: params[:date],
             unix: Date.today.to_time.to_i,
             natural: Date.today.strftime("%B, %d, %Y"),
           }
  end
end
