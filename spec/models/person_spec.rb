# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person do
  context 'with default factory' do
    subject(:person) { FactoryBot.create(:person) }

    it { expect(person.id).to be_truthy }
  end

  context '#name' do
    it 'validates presence' do
      person = FactoryBot.build(:person, name: nil)

      person.save

      expect(person.errors.messages[:name]).to eq(['can\'t be blank'])
    end
  end

  context '#document' do
    it 'validates presence' do
      person = FactoryBot.build(:person, document: nil)

      person.save

      expect(person.errors.messages[:document]).to eq(['can\'t be blank'])
    end
  end

  context '#birthdate' do
    it 'validates presence' do
      person = FactoryBot.build(:person, birthdate: nil)

      person.save

      expect(person.errors.messages[:birthdate]).to eq(['can\'t be blank'])
    end
  end

  context '#total_cost_month' do
    it 'sum all month_cost from animals' do
      person = FactoryBot.create(:person)
      FactoryBot.create(:animal, month_cost: 100, person: person)
      FactoryBot.create(:animal, month_cost: 100, person: person)

      expect(person.total_cost_month).to eq(200)
    end
  end

  context '#total_cost_quarter' do
    it 'sum all month_cost from animals and multiple to 3' do
      person = FactoryBot.create(:person)
      FactoryBot.create(:animal, month_cost: 100, person: person)
      FactoryBot.create(:animal, month_cost: 100, person: person)

      expect(person.total_cost_quarter).to eq(600)
    end
  end
end
