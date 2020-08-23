require 'rails_helper'

RSpec.describe "Shelters New" do
  describe "User" do
    describe "When I visit the new shelter form by clicking a link on the index" do
      it "can create a new shelter" do
        visit '/shelters'

        click_link 'New Shelter'

        expect(current_path).to eq('/shelters/new')

        fill_in :name, with: "Priya's Shelter O' Love"
        fill_in :address, with: "17 Here Ave"
        fill_in :city, with: "Denver"
        fill_in :state, with: "CO"
        fill_in :zip, with: 99999
        click_on 'Create Shelter'

        expect(current_path).to eq('/shelters')
        expect(page).to have_content("Priya's Shelter O' Love")
      end

      it "can see links for ALL PETS at top of every html page" do
        visit "/shelters/new"
        expect(page).to have_link("All Pets")
        click_link "All Pets"
        expect(current_path).to eq("/pets")
      end

      it "can see links for ALL SHELTERS at top of every html page" do
        visit "/shelters/new"
        expect(page).to have_link("All Shelters")
        click_link "All Shelters"
        expect(current_path).to eq("/shelters")
      end
    end
  end
end
