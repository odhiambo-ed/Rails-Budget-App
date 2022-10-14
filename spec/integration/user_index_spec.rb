require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background do
    visit root_path
  end

  scenario 'show groups_path' do
    expect(page).to have_content('LOGIN')
  end

  scenario 'show groups_path' do
    expect(page).to have_content('SIGN UP')
  end
end