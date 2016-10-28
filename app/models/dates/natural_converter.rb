class Dates
  class NaturalConverter
    attr_reader :date
    private :date

    def initialize(date)
      @date = date
    end

    def adapt
      {
        unix: unix_date,
        natural: date,
      }
    end

    private

    def unix_date
      natural_date.to_time.to_i
    end

    def natural_date
      Date.parse(date)
    end
  end
end
