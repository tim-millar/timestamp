class Dates
  class UnixConverter
    attr_reader :date
    private :date

    def initialize(date)
      @date = date
    end

    def adapt
      {
        unix: date.to_i,
        natural: formatted_date,
      }
    end

    private

    def formatted_date
      natural_date.strftime('%B, %d, %Y')
    end

    def natural_date
      Time.at(date.to_i)
    end
  end
end
