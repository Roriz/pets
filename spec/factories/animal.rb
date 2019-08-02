FactoryBot.define do
  factory :animal do
    name { 'Pé de Pano' }
    month_cost { 100 }
    kind { 0 }
    person
  end
end
