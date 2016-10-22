class TimestampController < ApplicationController
  def show
    render json: convert_timestamp
  end

  private

  def date_param
    params[:date]
  end

  def convert_timestamp
    if is_integer?(date_param)
      {
        unix: Integer(date_param),
        natural: Time.at(Integer(date_param)).to_date.strftime('%B, %d, %Y'),
      }
    elsif !Date._parse(date_param).empty?
      {
        unix: Date.parse(parse_param).to_time.to_i,
        natural: Date.parse(parse_param).strftime('%B, %d, %Y'),
      }
    else
      {
        unix: 'null',
        natural: 'null',
      }
    end
  end

  def parse_param
    date_param.gsub(/%20/, ' ')
  end

  def is_integer?(string)
    true if Integer(string) rescue false
  end
end
