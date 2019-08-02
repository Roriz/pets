# frozen_string_literal: true

class Animal < ApplicationRecord
  belongs_to :person

  enum kind: %i[horse dog parrot alpaca iguana platypus cat swallow]

  LIMIT_PER_PERSON = 1000
  FORBIDDEN_CHAR = 'a'

  validates :name, presence: true
  validates :month_cost, presence: true
  validates :kind, presence: true
  validates :person_id, presence: true
  validate :can_have_swallow?
  validate :can_have_cat?
  validate :person_can_add_a_animal?, on: :create

  def can_have_swallow?
    return unless swallow? && !person&.adult?

    errors.add(:kind, 'person-must-be-adult-to-have-a-swallow')
  end

  def can_have_cat?
    return unless cat? && person.name[0].downcase == FORBIDDEN_CHAR

    errors.add(:kind, 'person-who-has-name-starting-with-a-cant-have-a-cat')
  end

  def person_can_add_a_animal?
    return unless (person&.total_cost_month || 0) > LIMIT_PER_PERSON

    errors.add(:month_cost, "person-cant-have-cost-more-than-#{LIMIT_PER_PERSON}")
  end
end
