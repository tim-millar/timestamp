require 'rails_helper'

describe TimestampDates do
  describe '#as_json' do
    subject(:timestamp) { TimestampDates.new(date) }

    let(:timestamp_dates) {
      {
        unix: unix_date,
        natural: natural_date,
      }
    }

    let(:date_param) {
      double(
        'DateParam',
        is_unix?: is_unix,
        is_natural?: is_natural,
      )
    }

    let(:string_date) { todays_date.strftime('%B%%20\%d,%%20\%Y') }
    let(:unix_date) { todays_date.to_time.to_i }
    let(:natural_date) { todays_date.strftime('%B, %d, %Y') }
    let(:todays_date) { Date.today }
    let(:is_unix) { false }
    let(:is_natural) { false }

    before do
      allow(TimestampDates::DateParam).to receive(:new).with(date).
        and_return(date_param)
    end

    context 'when given a unix timestamp' do
      let(:date) { unix_date }
      let(:is_unix) { true }

      it 'returns JSON containing the natural language date' do
        expect(timestamp.as_json).to eql(timestamp_dates)
      end
    end

    context 'when given a natural language date' do
      let(:date) { string_date }
      let(:is_natural) { true }

      it 'returns JSON containing the unix timestamp' do
        expect(timestamp.as_json).to eql(timestamp_dates)
      end
    end

    context 'when given an incorrectly formatted date' do
      let(:date) { 'incorrect_arg' }
      let(:unix_date) { 'null' }
      let(:natural_date) { 'null' }

      it 'returns JSON containing nulls' do
        expect(timestamp.as_json).to eql(timestamp_dates)
      end
    end
  end
end
