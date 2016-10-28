require 'rails_helper'

class Dates
  describe DateParam do
    subject(:date_param) { DateParam.new(date_string)}

    describe '#is_unix?' do
      let(:date_string) { '1477263600' }

      it 'should return true if given a unix timestamp' do
        expect(date_param.is_unix?).to eql(true)
      end
    end

    describe 'is_natural?' do
      let(:date_string) { 'October, 24, 2016' }

      it 'should return true of given a natural date' do
        expect(date_param.is_natural?).to eql(true)
      end
    end
  end
end
