class TimestampDates
  class DateParam
    attr_reader :date_string
    private :date_string

    def initialize(date_string)
      @date_string = date_string
    end

    def is_unix?
      true if Integer(date_string) rescue false
    end

    def is_natural?
      !Date._parse(date_string).empty?
    end
  end
end
