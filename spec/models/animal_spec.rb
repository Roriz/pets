require 'rails_helper'

RSpec.describe Animal do
  context 'with default factory' do
    subject(:animal) { FactoryBot.create(:animal) }

    it { expect(animal.id).to be_truthy }
  end
end
