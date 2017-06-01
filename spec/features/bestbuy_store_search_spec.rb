require 'rails_helper'

RSpec.feature "user can search for stores", type: :feature do
  scenario "searching by zipcode" do
    zip = 80202

    visit root_path
    fill_in "Search", with: zip
    click_on "Search"
    expect(current_path).to eq('/search')
    expect(page).to have_content("16 Total Stores Found")

    within(".stores_list") do
      expect(page).to have_selector(".store", count: 10)
    end

    within(".store", match: :first) do
      # expect(page).to have_selector(h3)
      expect(page).to have_content("Distance:  ")
      expect(page).to have_content("Phone number:  ")
      expect(page).to have_content("Store Type:  ")
    end
  end
end
