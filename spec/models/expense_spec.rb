require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.new(name: 'Edward Odhiambo', email: 'edward@gmail.com', password: 'test123',
                     password_confirmation: 'test123')

    @user.save

    @category = Category.new(name: 'Food Stuff')

    @category.save

    @expense = Expense.new(name: 'Cooking Oil', amount: 2000)

    @expense.save

    @category.expenses << @expense

    @user.categories << @category
  end

  it 'should have a name' do
    @expense.name
    expect(@expense.name).to eq('Cooking Oil')
  end

  it 'should have an amount' do
    @expense.amount
    expect(@expense.amount).to eq(2000)
  end

  it 'should belong to a group' do
    @expense.categories
    expect(@expense.categories).to eq(@expense.categories)
  end
end
