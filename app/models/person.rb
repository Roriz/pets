# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :animals

  def adult?
    18.years.ago > birthdate
  end

  def total_cost_by_month
    animals.sum(:month_cost)
  end
end
