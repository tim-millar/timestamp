require 'rails_helper'

describe TimestampController do
  describe 'GET show' do
    let(:date) { Date.today }
    let(:string_date) { date.strftime("%B%%20\%d,%%20\%Y") }
    let(:unix_date) { date.to_time.to_i }
    let(:formatted_date) { date.strftime("%B, %d, %Y") }
    let(:dates) {
      {
        unix: unix_date,
        natural: formatted_date,
      }
    }

    context 'when given a date' do
      it 'responds with json containing the unix timestamp' do
        get :show, date: string_date
        expect(response.body).to eql(dates.to_json)
      end
    end

    context 'when given a unix timestamp' do
      it 'responds with json containing the natural language date' do
        get :show, date: unix_date
        expect(response.body).to eql(dates.to_json)
      end
    end

    context 'when given anything else' do
      let(:unix_date) { 'null' }
      let(:formatted_date) { 'null' }

      it 'responds with json containing nulls' do
        get :show, date: 'uecaiciuah'
        expect(response.body).to eql(dates.to_json)
      end
    end
  end
end
