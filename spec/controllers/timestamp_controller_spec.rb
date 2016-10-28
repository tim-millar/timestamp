require 'rails_helper'

describe TimestampController do
  describe 'GET show' do
    let(:timestamp_dates) { double('TimestampDates', as_json: dates) }
    let(:todays_date) { Date.today }
    let(:formatted_date) { todays_date.strftime('%B%%20%d,%%20%Y') }
    let(:unix_date) { todays_date.to_time.to_i }
    let(:natural_date) { todays_date.strftime('%B %d, %Y') }
    let(:dates) {
      {
        unix: unix_date,
        natural: natural_date,
      }
    }

    before do
      allow(Dates).to receive(:new).with(date).
        and_return(timestamp_dates)
    end

    context 'when given a natural date' do
      let(:date) { formatted_date }
      let(:natural_date_converter) {
        double(
          'NaturalDateConverter',
          adapt: dates,
        )
      }

      before do
        allow(Dates::NaturalConverter).to receive(:new).with(date).
          and_return(natural_date_converter)
      end

      it 'responds with json containing the unix timestamp' do
        get :show, date: date
        expect(response.body).to eql(dates.to_json)
      end
    end

    context 'when given a unix timestamp' do
      let(:date) { unix_date.to_s }
      let(:unix_date_converter) { double('UnixDateConverter', adapt: dates) }

      before do
        allow(Dates::UnixConverter).to receive(:new).with(date).
          and_return(unix_date_converter)
      end

      it 'responds with json containing the natural language date' do
        get :show, date: date
        expect(response.body).to eql(dates.to_json)
      end
    end

    context 'when given anything else' do
      let(:date) { 'incorrect_argument' }
      let(:unix_date) { 'null' }
      let(:formatted_date) { 'null' }

      before do
        allow(Dates::NullConverter).to receive(:adapt).
          and_return(dates)
      end

      it 'responds with json containing nulls' do
        get :show, date: date
        expect(response.body).to eql(dates.to_json)
      end
    end
  end
end
