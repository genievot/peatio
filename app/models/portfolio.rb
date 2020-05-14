# encoding: UTF-8
# frozen_string_literal: true

class Portfolio < ApplicationRecord
  # == Constants ============================================================

  # == Extensions ===========================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================

  belongs_to :currency, required: true, foreign_key: :currency_id
  belongs_to :currency, required: true, foreign_key: :portfolio_currency_id
  belongs_to :member, required: true

  # == Validations ==========================================================

  validates :total_credit, :total_debit, :total_fees,
            :total_credit_value, :total_debit_value,
            numericality: { greater_than_or_equal_to: 0 }
  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
