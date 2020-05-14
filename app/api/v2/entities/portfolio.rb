# frozen_string_literal: true

module API
  module V2
    module Entities
      class Portfolio < Base
        expose(
          :currency_id,
          as: :currency,
          documentation: {
            type: String,
            desc: 'Portfolio currency code.'
          }
        )

        expose(
          :portfolio_currency_id,
          as: :portfolio_currency,
          documentation: {
            type: String,
            desc: 'Portfolio currency code.'
          }
        )

        expose(
          :total_credit,
          documentation: {
            type: BigDecimal,
            desc: ''
          }
        )

        expose(
          :total_fees,
          documentation: {
            type: BigDecimal,
            desc: ''
          }
        )

        expose(
          :total_debit,
          documentation: {
            type: BigDecimal,
            desc: ''
          }
        )

        expose(
          :total_credit_value,
          documentation: {
            type: BigDecimal,
            desc: ''
          }
        )

        expose(
          :total_debit_value,
          documentation: {
            type: BigDecimal,
            desc: ''
          }
        )

        expose(
          :avarage_buy_price,
          documentation: {
            type: BigDecimal,
            desc: 'Avarage Buy Price'
          }
        )

        expose(
          :avarage_sell_price,
          documentation: {
            type: BigDecimal,
            desc: 'Avarage Sell Price'
          }
        )

        expose(
          :created_at,
          :updated_at,
          format_with: :iso8601,
          documentation: {
            type: String,
            desc: ''
          }
        )
      end
    end
  end
end
