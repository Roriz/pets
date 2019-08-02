# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { 'Johnny Cash' }
    document { '555555555' }
    birthdate { 20.years.ago }

    trait :not_adult do
      birthdate { 17.years.ago }
    end
  end
end
