require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save if all validations are met' do
      product = Product.create(
        name: 'Bottle',
        price_cents: 23,
        quantity: 100,
        category_id: 1
      )
      expect(product).to be_valid
    end
    it 'should not save without a name' do
      product = Product.create(
        name: nil,
        price_cents: 23,
        quantity: 100,
        category_id: 1
      )
      expect(product).to_not be_persisted
    end
    it 'should not save without a price' do
      product = Product.create(
        name: 'Bottle',
        price_cents: nil,
        quantity: 100,
        category_id: 1
      )
      expect(product).to_not be_persisted
    end
    it 'should not save without a quantity' do
      product = Product.create(
        name: 'Bottle',
        price_cents: 23,
        quantity: nil,
        category_id: 1
      )
      expect(product).to_not be_persisted
    end
    it 'should not save without a category' do
      product = Product.create(
        name: 'Bottle',
        price_cents: 23,
        quantity: 100,
        category_id: nil
      )
      expect(product).to_not be_persisted
    end
  end
end
