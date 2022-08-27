require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.create(:post)
  end

  describe '商品の追加登録' do
    context '商品追加登録ができるとき' do
      it 'すべての入力事項が存在すれば登録できる' do
        expect(@post).to be_valid
      end
      it '数量が0以上であれば登録できる' do
        @post.quantity = 0
        expect(@post).to be_valid
      end
      it 'カテゴリが「---」以外であれば登録できる' do
        @post.category_id = 1
        expect(@post).to be_valid
      end
    end

    context '商品の追加ができないとき' do
      it '商品名が空だと商品を追加できない' do
        @post.name = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('商品名を入力してください')
      end
      it '数量が空だと商品を追加できない' do
        @post.quantity = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('数量を入力してください')
      end
      it '数量が0より下だと商品を追加できない' do
        @post.quantity = -1
        @post.valid?
        expect(@post.errors.full_messages).to include('数量は0以上の値にしてください')
      end
      it 'カテゴリが「---」だと商品を追加できない' do
        @post.category_id = 0
        @post.valid?
        expect(@post.errors.full_messages).to include('カテゴリは0以外の値にしてください')
      end
    end
  end
end
