class TimestampDates
  class NullDateConverter
    def self.adapt
      {
        unix: 'null',
        natural: 'null',
      }
    end
  end
end
