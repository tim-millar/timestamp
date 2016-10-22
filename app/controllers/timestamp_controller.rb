class TimestampController < ApplicationController
  def show
    render json: { foo: "hello world" }
  end
end
