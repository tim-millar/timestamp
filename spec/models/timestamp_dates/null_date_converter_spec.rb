require 'rails_helper'

class TimestampDates
  describe :NullDateConverter do
    subject(:null_date_converter) { NullDateConverter }

    describe '.adapt' do
      let(:adapt) {
        {
          unix: 'null',
          natural: 'null',
        }
      }

      it 'returns a hash containing null dates' do
        expect(null_date_converter.adapt).to eql(adapt)
      end
    end
  end
end
