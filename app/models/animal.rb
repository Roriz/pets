# frozen_string_literal: true

class Animal < ApplicationRecord
  belongs_to :person

  enum kind: %i[horse dog parrot alpaca iguana platypus cat swallow]

  validate :can_have_swallow?
  validate :can_have_cat?

  def can_have_swallow?
    return unless swallow? && !person.adult?

    errors.add(:status, message: 'person-must-be-adult-to-have-a-swallow')
  end

  def can_have_cat?
    return unless cat? && person.name[0].downcase == 'a'

    errors.add(:status, message: 'person-who-has-name-starting-with-a-cant-have-a-cat')
  end
end
