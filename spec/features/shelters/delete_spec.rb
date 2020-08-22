# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter

require 'rails_helper'

RSpec.describe "Shelters New" do
  describe "As a visitor" do
    before :each do
      @shelter_1 = Shelter.create!(name: "The Humane Society - Denver",
        address: "1 Place St",
        city: "Denver",
        state: "CO",
        zip: "11111")
      @shelter_2 = Shelter.create!(name: "Denver Animal Shelter",
        address: "7 There Blvd",
        city: "Denver",
        state: "CO",
        zip: "22222")
    end

    describe "When I visit a shelter show page then click the link delete shelter" do
      it "can have a delete link and redirect to index" do
        visit "/shelters/#{@shelter_1.id}"

        expect(page).to have_content(@shelter_1.name)
        expect(page).to have_content(@shelter_1.address)

        expect(page).to have_link('Delete Shelter')

        click_link 'Delete Shelter'

        expect(current_path).to eq("/shelters")
        save_and_open_page

        expect(page).to_not have_content(@shelter_1.name)

        expect(page).to have_content(@shelter_2.name)
      end
    end

    #   it "can delete a shelter id and redirect to index"
    #     visit "/shelters/#{@shelter_1.id}"
    #     save_and_open_page
    #
    #
    #     expect(page).to have_link('Delete Shelter')
    #
    # end
  end
end
