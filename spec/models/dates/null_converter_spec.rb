require 'rails_helper'

class Dates
  describe NullConverter do
    subject(:null_date_converter) { NullConverter }

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
