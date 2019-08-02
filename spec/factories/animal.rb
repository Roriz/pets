# frozen_string_literal: true

FactoryBot.define do
  factory :animal do
    name { 'Pé de Pano' }
    month_cost { 100 }
    kind { 0 }
    person

    trait :swallow do
      kind { Animal.kinds[:swallow] }
    end

    trait :cat do
      kind { Animal.kinds[:cat] }
    end
  end
end
