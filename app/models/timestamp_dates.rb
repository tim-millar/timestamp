class TimestampDates
  attr_reader :date
  private :date

  def initialize(date)
    @date = date
  end

  def as_json
    convert_timestamp
  end

  private

  def convert_timestamp
    if is_integer?(date)
      {
        unix: Integer(date),
        natural: Time.at(Integer(date)).to_date.strftime('%B, %d, %Y'),
      }
    elsif !Date._parse(date).empty?
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

  def parse_date
    date.gsub(/%20/, ' ')
  end

  def is_integer?(string)
    true if Integer(string) rescue false
  end
end
