require 'rails_helper'

class Dates
  describe UnixConverter do
    subject(:unix_date_converter) { UnixConverter.new(date) }

    let(:date) { '1477350000' }
    let(:unix_date) { 1477350000 }
    let(:natural_date) { double('Time') }
    let(:formatted_date) { 'October, 25, 2016' }
    let(:adapt) {
      {
        unix: unix_date,
        natural: formatted_date,
      }
    }

    before do
      allow(Time).to receive(:at).with(date.to_i).and_return(natural_date)
      allow(natural_date).to receive(:strftime).with('%B, %d, %Y').
        and_return(formatted_date)
    end


    describe '#adapt' do
      it 'returns a hash containing unix and natural dates' do
        expect(unix_date_converter.adapt).to eql(adapt)
      end
    end
  end
end
