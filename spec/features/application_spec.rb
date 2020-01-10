require 'spec_helper'

RSpec.feature 'Loads an application', type: :feature do
  scenario 'displays a page' do
    visit root_path
    expect(page).to have_css '.jumbotron', text: 'Welcome!'
  end
end
