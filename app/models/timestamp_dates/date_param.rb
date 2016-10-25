class TimestampDates
  class DateParam
    attr_reader :date
    private :date

    def initialize(date)
      @date = date
    end

    def is_unix?
      date && numeric_chars.all?
    end

    def is_natural?
      date && parse_date.present?
    end

    private

    def numeric_chars
      date.chars.map  { |char| char =~ /[0-9]/ }
    end

    def parse_date
      Date._parse(date)
    end
  end
end
