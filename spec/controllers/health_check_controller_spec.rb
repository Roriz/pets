require 'rails_helper'

RSpec.describe HealthCheckController, type: :controller do
  describe 'GET main' do
    subject { get :main }

    it { expect(response).to have_http_status(:ok) }
  end
end
