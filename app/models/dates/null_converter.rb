class Dates
  class NullConverter
    def self.adapt
      {
        unix: 'null',
        natural: 'null',
      }
    end
  end
end
