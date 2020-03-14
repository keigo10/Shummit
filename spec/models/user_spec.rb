# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }

    context 'family_nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.family_name = ''
        is_expected.to eq false
      end
    end

    context 'first_nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.first_name = ''
        is_expected.to eq false
      end
    end

    context 'family_name_kanaカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.family_name_kana = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:events).macro).to eq :has_many
      end
    end

    context 'Goin_eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:join_events).macro).to eq :has_many
      end
    end
  end
end
