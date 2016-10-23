require 'rails_helper'

RSpec.describe TimestampDates do
  describe '#as_json' do
    let(:string_date) { date.strftime('%B%%20\%d,%%20\%Y') }
    let(:unix_date) { date.to_time.to_i }
    let(:formatted_date) { date.strftime('%B, %d, %Y') }
    let(:date) { Date.today }
    let(:timestamp_dates) {
      {
        unix: unix_date,
        natural: formatted_date,
      }
    }

    context 'when given a natural language date' do
      subject(:timestamp) { TimestampDates.new(string_date) }

      it 'returns JSON containing the unix timestamp' do
        expect(timestamp.as_json).to eql(timestamp_dates)
      end
    end

    context 'when given a unix timestamp' do
      subject(:timestamp) { TimestampDates.new(unix_date) }

      it 'returns JSON containing the natural language date' do
        expect(timestamp.as_json).to eql(timestamp_dates)
      end
    end

    context 'when given an incorrectly formatted date' do
      subject(:timestamp) { TimestampDates.new('incorrect_argument') }
      let(:null_dates) {
        {
          unix: 'null',
          natural: 'null',
        }
      }

      it 'returns JSON containing nulls' do
        expect(timestamp.as_json).to eql(null_dates)
      end
    end
  end
end
