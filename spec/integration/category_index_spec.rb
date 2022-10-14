require 'rails_helper'

RSpec.describe 'CategoriesIndexPage', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Edward', email: 'edward@gmail.com', password: 'test123')
    @user.save
    visit user_session_path
    fill_in 'user[email]', with: 'edward@gmail.com'
    fill_in 'user[password]', with: 'test123'
    click_button 'LOGIN'
    @category = Group.create!(name: 'Food Stuff', user_id: @user.id)
    @category.save
    visit groups_path
  end
  it 'shows page title' do
    expect(page).to have_content 'CATEGORIES'
  end
  it 'renders category name' do
    expect(page).to have_content @category.name
  end
end
