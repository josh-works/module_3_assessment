require 'rails_helper'

RSpec.feature "user can search for stores", type: :feature do
  describe "searching by zipcode" do
    zip = 80202

    visit root_path
    fill_in "Search", zip
    click_on "search"
    expect(current_path).to eq('/search')
    expect(page).to have_content("16 Total Stores found")

    within(".stores_list") do
      expect(page).to have_element(".store", count: 10)
    end

    within_first(".store") do
      expect(page).to have_content("Name: ")
      expect(page).to have_content("Distance:  ")
      expect(page).to have_content("Phone number:  ")
      expect(page).to have_content("Store Type:  ")
    end
  end
end
