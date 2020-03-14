# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Eventモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let(:event) { build(:event, user_id: user.id) }

    context 'events_nameカラム' do
      it '空欄でないこと' do
        event.events_name = ''
        expect(event.valid?).to eq false
      end
      it '2文字以上であること' do
        event.events_name = Faker::Lorem.characters(number: 1)
        expect(event.valid?).to eq false
      end
      it '20文字以下であること' do
        event.events_name = Faker::Lorem.characters(number: 21)
        expect(event.valid?).to eq false
      end
    end

    context 'entrance_feeカラム' do
      it '空欄でないこと' do
        event.entrance_fee = ''
        expect(event.valid?).to eq false
      end
      it '数字であること' do
        event.entrance_fee = 'aaaaa'
        expect(event.valid?).to eq false
      end
    end

    context 'personsカラム' do
      it '空欄でないこと' do
        event.persons = ''
        expect(event.valid?).to eq false
      end
      it '数字であること' do
        event.persons = 'aaaaa'
        expect(event.valid?).to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Event.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
