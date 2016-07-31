require 'rails_helper'

RSpec.describe Identity, type: :model do
  context 'validations' do
    [:provider, :uid].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end
end
