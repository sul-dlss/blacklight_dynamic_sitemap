require 'spec_helper'

RSpec.feature 'Loads an application', type: :feature do
  scenario 'displays a page' do
    visit '/'
    expect(page).to have_css '.welcome'
  end
end
