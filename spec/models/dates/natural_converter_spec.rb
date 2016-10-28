require 'rails_helper'

class Dates
  describe NaturalConverter do
    subject(:natural_date_converter) { NaturalConverter.new(date) }

    let(:date) { 'October, 25, 2016' }
    let(:unix_date) { 1477350000 }
    let(:natural_date) { double('Date', to_time: '1477350000') }
    let(:adapt) {
      {
        unix: unix_date,
        natural: date,
      }
    }

    before do
      allow(Date).to receive(:parse).with(date).
        and_return(natural_date)
      allow(natural_date).to receive(:strftime).with('%B, %d, %Y').
        and_return(date)
    end


    describe '#adapt' do
      it 'returns a hash containing the unix and natural dates' do
        expect(natural_date_converter.adapt).to eql(adapt)
      end
    end
  end
end
