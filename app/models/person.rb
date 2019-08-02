# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :animals

  def adult?
    18.years.ago > birthdate
  end

  def total_cost_month
    animals.sum(:month_cost)
  end

  def total_cost_quarter
    total_cost_month * 3
  end
end
