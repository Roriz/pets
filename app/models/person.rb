# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :animals

  validates :name, presence: true
  validates :document, presence: true
  validates :birthdate, presence: true

  def adult?
    18.years.ago > birthdate
  end

  def total_cost_month
    animals.sum(:month_cost)
  end
end
