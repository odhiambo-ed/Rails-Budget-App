require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      name: "MyString",
      amount: 1,
      user: nil,
      category: nil
    ))
  end

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(@expense), "post" do

      assert_select "input[name=?]", "expense[name]"

      assert_select "input[name=?]", "expense[amount]"

      assert_select "input[name=?]", "expense[user_id]"

      assert_select "input[name=?]", "expense[category_id]"
    end
  end
end
