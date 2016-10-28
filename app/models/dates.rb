class Dates
  attr_reader :date
  private :date

  def initialize(date)
    @date = date
  end

  def as_json(options={})
    timestamp_builder.adapt
  end

  private

  def timestamp_builder
    if date_param.is_unix?
      UnixConverter.new(date)
    elsif date_param.is_natural?
      NaturalConverter.new(date)
    else
      NullConverter
    end
  end

  def date_param
    DateParam.new(date)
  end
end
