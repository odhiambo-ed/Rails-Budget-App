require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Edward Odhiambo', email: 'edward@gmail.com', password: 'test123',
                     password_confirmation: 'test123')

    @user.save

    @category = Category.new(name: 'Food Stuff')

    @category.save

    @expense = Expense.new(name: 'Cooking Oil', amount: 2000)

    @expense.save
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'should have a name' do
    @user.name
    expect(@user.name).to eq('Edward Odhiambo')
  end

  it 'should have an email' do
    @user.email
    expect(@user.email).to eq('edward@gmail.com')
  end

  it 'should have a password' do
    @user.password
    expect(@user.password).to eq('test123')
  end

  it 'should have a password_confirmation' do
    @user.password_confirmation
    expect(@user.password_confirmation).to eq('test123')
  end
  it 'is not valid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end
  it 'is not valid without a password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
  it 'is not valid with a password less than 6 characters' do
    @user.password = 'test'
    expect(@user).to_not be_valid
  end
end
