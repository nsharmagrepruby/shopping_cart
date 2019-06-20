require 'rails_helper'
require 'rspec/autorun'

RSpec.describe User, type: :model do
  context 'validataion test' do
    it 'ensure first name presence' do
      user = User.new(last_name: 'last', email: '123@gmail.com').save
      expect(user).to eq(false)
    end

    it 'ensure last name presence' do
      user = User.new(first_name: 'first', email: '123@gmail.com').save
      expect(user).to eq(false)
    end
    
    it 'ensure role presence' do
      user = User.new()
      expect(user.role).to eq("customer")
    end
  end
end
