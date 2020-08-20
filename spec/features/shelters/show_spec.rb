require 'rails_helper'

RSpec.describe "Shelters Show", type: :feature do
  describe "User" do
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
    
    describe "When I visit a single shelters page" do
      it "can see a unique shelters information by id" do
        visit "/shelters/#{@shelter_1.id}"

        expect(page).to have_content(@shelter_1.name)
        expect(page).to have_content(@shelter_1.address)
        expect(page).to have_content(@shelter_1.city)
        expect(page).to have_content(@shelter_1.state)
        expect(page).to have_content(@shelter_1.zip)

        visit "/shelters/#{@shelter_2.id}"

        expect(page).to have_content(@shelter_2.name)
        expect(page).to have_content(@shelter_2.address)
        expect(page).to have_content(@shelter_2.city)
        expect(page).to have_content(@shelter_2.state)
        expect(page).to have_content(@shelter_2.zip)
      end
    end
  end
end
