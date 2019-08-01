# frozen_string_literal: true

class Animal < ApplicationRecord
  belongs_to :person

  enum kind: %i[horse dog parrot alpaca iguana platypus cat swallow]

  validate :can_have_swallow?, on: :create

  def can_have_swallow?
    return unless swallow? && !person.adult?

    errors.add(:status, message: 'person-must-be-adult-to-have-a-swallow')
  end
end
