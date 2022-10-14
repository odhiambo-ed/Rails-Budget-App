require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.new(name: 'Edward Odhiambo', email: 'edward@gmail.com', password: 'test123',
                     password_confirmation: 'test123')

    @user.save

    @category = Category.new(name: 'Food Stuff')

    @category.save

    @expense = Expense.new(name: 'Cooking Oil', amount: 2000)

    @expense.save

    @category.expenses << @expense
  end

  it 'should have a name' do
    @category.name
    expect(@category.name).to eq('Food Stuff')
  end

  it 'should have expenses' do
    @category.expenses
    expect(@category.expenses).to eq([@expense])
  end
end
