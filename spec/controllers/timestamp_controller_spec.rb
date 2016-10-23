require 'rails_helper'

describe TimestampController do
  describe 'GET show' do
    let(:timestamp_dates) { double('TimestampDates', as_json: dates) }
    let(:todays_date) { Date.today }
    let(:formatted_date) { todays_date.strftime('%B%%20\%d,%%20\%Y') }
    let(:unix_date) { todays_date.to_time.to_i }
    let(:natural_date) { todays_date.strftime('%B, %d, %Y') }
    let(:dates) {
      {
        unix: unix_date,
        natural: natural_date,
      }
    }

    before do
      allow(TimestampDates).to receive(:new).with(date).
        and_return(timestamp_dates)
    end

    context 'when given a date' do
      let(:date) { formatted_date }

      it 'responds with json containing the unix timestamp' do
        get :show, date: date
        expect(response.body).to eql(dates.to_json)
      end
    end

    context 'when given a unix timestamp' do
      let(:date) { unix_date.to_s }

      it 'responds with json containing the natural language date' do
        get :show, date: date
        expect(response.body).to eql(dates.to_json)
      end
    end

    context 'when given anything else' do
      let(:date) { 'incorrect_argument' }
      let(:unix_date) { 'null' }
      let(:formatted_date) { 'null' }

      it 'responds with json containing nulls' do
        get :show, date: date
        expect(response.body).to eql(dates.to_json)
      end
    end
  end
end
