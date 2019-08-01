# frozen_string_literal: true

class Animal < ApplicationRecord
  belongs_to :person

  enum kind: %i[horse dog parrot alpaca iguana platypus cat]
end
