require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validataion test' do
    it 'ensure User presence' do
      address = Address.new(house_number: '12', area: 'It park', city: 'Indore').save
      expect(address).to eq(false)
    end

    it 'ensure area length' do
      address = Address.new(user_id: '1',house_number: '12', area: 'davv', city: 'Indore').save
      expect(address).to eq(false)
    end

    it 'ensure house_number presence' do
      address = Address.new(user_id: '1', area: 'davv', city: 'Indore').save
      expect(address).to eq(false)
    end    
 end
end
