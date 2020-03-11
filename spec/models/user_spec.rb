require 'rails_helper'

RSpec.describe User, type: :model do

  let(:raffel) { create(:raffel) }

  context 'Validations' do
    context 'valid factories present' do
      it { expect(build(:user, raffel_id: raffel.id)).to be_valid }
    end

    context 'email' do
      context 'should be valid' do
        let(:valid) { build(:user, raffel_id: raffel.id,email: "test@mail.com") }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:user, email: nil) }
        it { expect(invalid).not_to be_valid }
      end

      context 'should be invalid with uniqueness failure' do
        let(:invalid) { build(:user, email: "test@mail.com") }
        it { expect(invalid).not_to be_valid }
      end
    end

    context 'password' do
      context 'should be valid' do
        let(:valid) { build(:user, raffel_id: raffel.id, password: '123456') }
        it { expect(valid).to be_valid }
      end

      context 'should be invalid' do
        let(:invalid) { build(:user, raffel_id: raffel.id, password: nil) }
        it { expect(invalid).not_to be_valid }
      end

      context 'should be invalid with confirmation failure' do
        let(:invalid) { build(:user, raffel_id: raffel.id, password: '123456', password_confirmation: '12345') }
        it { expect(invalid).not_to be_valid }
      end
    end
  end

  context 'Associations' do
    it 'should belong to raffel' do
      t = User.reflect_on_association(:raffel)
      expect(t.macro).to eq(:belongs_to)
    end
  end

end
