require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  context 'validataion test' do
    it 'ensure  quantity presence' do
      cart_product = CartProduct.new(cart_id: '4', product_id: '1').save
      expect(cart_product).to eq(false)
    end

    it 'ensure  quantity value more than 1' do
      cart_product = CartProduct.new(cart_id: '4', product_id: '1', quantity: '-1').save
      expect(cart_product).to eq(false)
    end
 end
end
