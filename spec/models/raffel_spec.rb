require 'rails_helper'

RSpec.describe Raffel, type: :model do

  context 'Validations' do
    context 'valid factories present' do
      it { expect(build(:raffel)).to be_valid }
    end

    context 'title' do
      context 'should be valid' do
        let(:valid) { build(:raffel, title: "Win a kid’s toy") }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:raffel, title: nil) }
        it { expect(invalid).not_to be_valid }
      end
    end
  end

  context 'Associations' do
    it 'should have many users' do
      t = Raffel.reflect_on_association(:users)
      expect(t.macro).to eq(:has_many)
    end
  end

end
