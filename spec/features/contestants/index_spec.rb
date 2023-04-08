require 'rails_helper'

RSpec.describe 'the Contestant Index page' do
  before(:each) do
    test_data

    visit '/contestants'
  end

  describe 'User Story 2' do
    it 'lists all contestant names and their projects' do
      # test using within blocks
      within("div#contestant-#{@jay.id}") do
        expect(page).to have_content(@jay.name)
        expect(page).to have_content('Projects: News Chic')
      end

      within("div#contestant-#{@gretchen.id}") do
        expect(page).to have_content(@gretchen.name)
        expect(page).to have_content('Projects: News Chic, Upholstery Tux')
      end

      within("div#contestant-#{@kentaro.id}") do
        expect(page).to have_content(@kentaro.name)
        expect(page).to have_content('Projects: Boardfit, Upholstery Tux')
      end

      within("div#contestant-#{@erin.id}") do
        expect(page).to have_content(@erin.name)
        expect(page).to have_content('Projects: Boardfit')
      end
    end
  end
end
