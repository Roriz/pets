# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :animals

  def adult?
    18.years.ago > birthdate
  end
end
