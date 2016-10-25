class TimestampDates
  attr_reader :date
  private :date

  def initialize(date)
    @date = date
  end

  def as_json(options={})
    convert_timestamp
  end

  private

  def convert_timestamp
    if date_param.is_unix?
      {
        unix: Integer(date),
        natural: Time.at(Integer(date)).to_date.strftime('%B, %d, %Y'),
      }
    elsif date_param.is_natural?
      {
        unix: Date.parse(parse_date).to_time.to_i,
        natural: Date.parse(parse_date).strftime('%B, %d, %Y'),
      }
    else
      {
        unix: 'null',
        natural: 'null',
      }
    end
  end

  def date_param
    DateParam.new(date)
  end

  def parse_date
    date.gsub(/%20/, ' ')
  end
end
