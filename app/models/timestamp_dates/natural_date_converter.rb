class TimestampDates
  class NaturalDateConverter
    attr_reader :date
    private :date

    def initialize(date)
      @date = date
    end

    def adapt
      {
        unix: unix_date,
        natural: formatted_date,
      }
    end

    private

    def unix_date
      natural_date.to_time.to_i
    end

    def formatted_date
      natural_date.strftime('%B, %d, %Y')
    end

    def natural_date
      Date.parse(swap_in_spaces)
    end

    def swap_in_spaces
      date.gsub(/%20/, ' ')
    end
  end
end
