require 'rails_helper'

class TimestampDates
  describe NaturalDateConverter do
    subject(:natural_date_converter) { NaturalDateConverter.new(date) }

    let(:date) { 'October%2025,%202016' }
    let(:unix_date) { 1477350000 }
    let(:formatted_date) { 'October, 25, 2016' }
    let(:swap_in_spaces) { 'October 25, 2016' }
    let(:natural_date) { double('Date', to_time: '1477350000') }
    let(:adapt) {
      {
        unix: unix_date,
        natural: formatted_date,
      }
    }

    before do
      allow(Date).to receive(:parse).with(swap_in_spaces).
        and_return(natural_date)
      allow(natural_date).to receive(:strftime).with('%B, %d, %Y').
        and_return(formatted_date)
    end


    describe '#adapt' do
      it 'returns a hash containing the unix and natural dates' do
        expect(natural_date_converter.adapt).to eql(adapt)
      end
    end
  end
end
