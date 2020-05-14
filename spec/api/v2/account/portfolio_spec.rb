# frozen_string_literal: true

describe API::V2::Account::Portfolio, type: :request do
  let(:member) { create(:member, :level_3) }
  let(:token) { jwt_for(member) }

  describe 'GET /api/v2/account/portfolio' do
    let!(:eth) { Currency.find('eth') }
    let!(:btc) { Currency.find('btc') }
    let!(:portfolio1) { create(:portfolio, portfolio_currency_id: eth.id, currency_id: btc.id,
                               total_credit: 0.1, total_fees: 0.01, total_credit_value: 0.3, total_debit: 0.2,
                               total_debit_value: 10.0, member: member)}

    let!(:portfolio2) { create(:portfolio, portfolio_currency_id: btc.id, currency_id: eth.id,
                                total_credit: 0.1, total_fees: 0.01, total_credit_value: 0.3, total_debit: 0.2,
                                total_debit_value: 10.0, member: member)}

    it 'returns all user portfolios for all portfolio currencies' do
      api_get '/api/v2/account/portfolio', token: token

      expect(response).to be_successful

      expect(response_body.count).to eq 2
      expect(response_body[0]['currency']).to eq(portfolio1.currency_id)
      expect(response_body[0]['portfolio_currency']).to eq(portfolio1.portfolio_currency_id)
      expect(response_body[0]['total_credit'].to_f).to eq(portfolio1.total_credit)
      expect(response_body[0]['total_fees'].to_f).to eq(portfolio1.total_fees)
      expect(response_body[0]['total_credit_value'].to_f).to eq(portfolio1.total_credit_value)
      expect(response_body[0]['total_debit'].to_f).to eq(portfolio1.total_debit)
      expect(response_body[0]['total_debit_value'].to_f).to eq(portfolio1.total_debit_value)
      expect(response_body[0]['avarage_buy_price'].to_f.round(9)).to eq( (portfolio1.total_credit_value / (portfolio1.total_credit + portfolio1.total_fees)).to_f)
      expect(response_body[0]['avarage_sell_price'].to_f.round(9)).to eq(portfolio1.total_debit_value / (portfolio1.total_debit + portfolio1.total_fees))

      expect(response_body[1]['currency']).to eq(portfolio2.currency_id)
      expect(response_body[1]['portfolio_currency']).to eq(portfolio2.portfolio_currency_id)
      expect(response_body[1]['total_credit'].to_f).to eq(portfolio2.total_credit)
      expect(response_body[1]['total_fees'].to_f).to eq(portfolio2.total_fees)
      expect(response_body[1]['total_credit_value'].to_f).to eq(portfolio2.total_credit_value)
      expect(response_body[1]['total_debit'].to_f).to eq(portfolio2.total_debit)
      expect(response_body[1]['total_debit_value'].to_f).to eq(portfolio2.total_debit_value)
      expect(response_body[1]['avarage_buy_price'].to_f.round(9)).to eq( (portfolio2.total_credit_value / (portfolio2.total_credit + portfolio2.total_fees)).to_f)
      expect(response_body[1]['avarage_sell_price'].to_f.round(9)).to eq(portfolio2.total_debit_value / (portfolio2.total_debit + portfolio2.total_fees))
    end

    it 'returns user portfolios for portfolio currency eth' do
      api_get '/api/v2/account/portfolio?portfolio_currency=eth', token: token

      expect(response).to be_successful

      expect(response_body.count).to eq 1
      expect(response_body[0]['currency']).to eq(portfolio1.currency_id)
      expect(response_body[0]['portfolio_currency']).to eq(portfolio1.portfolio_currency_id)
      expect(response_body[0]['total_credit'].to_f).to eq(portfolio1.total_credit)
      expect(response_body[0]['total_fees'].to_f).to eq(portfolio1.total_fees)
      expect(response_body[0]['total_credit_value'].to_f).to eq(portfolio1.total_credit_value)
      expect(response_body[0]['total_debit'].to_f).to eq(portfolio1.total_debit)
      expect(response_body[0]['total_debit_value'].to_f).to eq(portfolio1.total_debit_value)
      expect(response_body[0]['avarage_buy_price'].to_f.round(9)).to eq( (portfolio1.total_credit_value / (portfolio1.total_credit + portfolio1.total_fees)).to_f)
      expect(response_body[0]['avarage_sell_price'].to_f.round(9)).to eq(portfolio1.total_debit_value / (portfolio1.total_debit + portfolio1.total_fees))
    end
  end
end
