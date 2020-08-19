require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shetler names" do
    shelter_1 = Shelter.create(name: "The Humane Society - Denver")
    shelter_2 = Shelter.create(name: "Denver Animal Shelter")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
