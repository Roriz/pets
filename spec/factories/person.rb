FactoryBot.define do
  factory :person do
    name { 'Johnny Cash' }
    document { '555555555' }
    birthdate { 17.years.ago }
  end
end
