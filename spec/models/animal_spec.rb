# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Animal do
  context 'with default factory' do
    subject(:animal) { FactoryBot.create(:animal) }

    it { expect(animal.id).to be_truthy }
  end

  context '#name' do
    it 'validates presence' do
      animal = FactoryBot.build(:animal, name: nil)

      animal.save

      expect(animal.errors.messages[:name]).to eq(['can\'t be blank'])
    end
  end

  context '#month_cost' do
    it 'validates presence' do
      animal = FactoryBot.build(:animal, month_cost: nil)

      animal.save

      expect(animal.errors.messages[:month_cost]).to eq(['can\'t be blank'])
    end

    it 'validates person cost' do
      person = FactoryBot.create(:person)

      FactoryBot.create(:animal, month_cost: 1001, person: person)
      animal = FactoryBot.build(:animal, month_cost: 1000, person: person)

      animal.save

      expect(animal.errors.messages[:month_cost]).to eq(['person-cant-have-cost-more-than-1000'])
    end

    it 'validates person cost with multiple animals' do
      person = FactoryBot.create(:person)

      FactoryBot.create(:animal, month_cost: 501, person: person)
      FactoryBot.create(:animal, month_cost: 501, person: person)
      animal = FactoryBot.build(:animal, month_cost: 1000, person: person)

      animal.save

      expect(animal.errors.messages[:month_cost]).to eq(['person-cant-have-cost-more-than-1000'])
    end
  end

  context '#kind' do
    it 'validates presence' do
      animal = FactoryBot.build(:animal, kind: nil)

      animal.save

      expect(animal.errors.messages[:kind]).to eq(['can\'t be blank'])
    end

    it 'validates a swallow' do
      animal = FactoryBot.build(
        :animal,
        :swallow,
        person: FactoryBot.create(:person, :not_adult)
      )

      animal.save

      expect(animal.errors.messages[:kind]).to eq(['person-must-be-adult-to-have-a-swallow'])
    end

    it 'validates a cat' do
      animal = FactoryBot.build(
        :animal,
        :cat,
        person: FactoryBot.create(:person, name: 'ana')
      )

      animal.save

      expect(animal.errors.messages[:kind]).to eq(['person-who-has-name-starting-with-a-cant-have-a-cat'])
    end

    it 'validates a cat without case sensitive' do
      animal = FactoryBot.build(
        :animal,
        :cat,
        person: FactoryBot.create(:person, name: 'Ana')
      )

      animal.save

      expect(animal.errors.messages[:kind]).to eq(['person-who-has-name-starting-with-a-cant-have-a-cat'])
    end
  end

  context '#person_id' do
    it 'validates presence' do
      animal = FactoryBot.build(:animal, person: nil)

      animal.save

      expect(animal.errors.messages[:person]).to eq(['must exist'])
      expect(animal.errors.messages[:person_id]).to eq(['can\'t be blank'])
    end
  end
end
