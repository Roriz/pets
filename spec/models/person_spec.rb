require 'rails_helper'

RSpec.describe Person do
  context 'with default factory' do
    subject(:person) { FactoryBot.create(:person) }

    it { expect(person.id).to be_truthy }
  end
end
