require 'rails_helper'

RSpec.describe "Pets New page", type: :feature do
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

      image_1 = "https://www.101dogbreeds.com/wp-content/uploads/2019/01/Chihuahua-Mixes.jpg"
      image_2 = "https://www.loveyourdog.com/wp-content/uploads/2019/12/Catahoula-Pitbull-Mix-900x500.jpg"
      image_3 = "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47475338/2/?bust=1586831049&width=720"

      @pet_1 = Pet.create!(image: image_1,
        name: "Tinkerbell",
        approximate_age: 3,
        sex: "Female",
        shelter_id: "#{@shelter_1.id}",
        description: "Adorable chihuahua mix with lots of love to give",
        status: true)
      @pet_2 = Pet.create!(image: image_2,
        name: "George",
        approximate_age: 5,
        sex: "Male",
        shelter_id: "#{@shelter_1.id}",
        description: "This pitty mix will melt your heart with his sweet temperament",
        status: false)
      @pet_3 = Pet.create!(image: image_3,
        name: "Ruby",
        approximate_age: 0,
        sex: "Female",
        shelter_id: "#{@shelter_2.id}",
        description: "This flat-coated retriever mix is your best friend on walks and is perfect for families with kids",
        status: true)
    end

    it "can add a new pet" do
      visit "/shelters/#{@shelter_2.id}/pets"

      click_link("Add New Pet")
      expect(current_path).to eq("/shelters/#{@shelter_2.id}/pets/new")

      image_4 = "https://www.iamcasper.com/wp-content/uploads/2018/03/Torbie-Ragdoll-1030x790.png"

      expect(page).to have_content(@shelter_2.name)

      fill_in :image, with: image_4
      fill_in :name, with: "Pierce Brosnan"
      fill_in :approximate_age, with: 7
      fill_in :sex, with: "Male"
      fill_in :description, with: "This ragdoll mix is a fluffy and friendly addition to your household"

      click_button "Add this Pet"
      new_pet = Pet.last

      expect(current_path).to eq("/shelters/#{@shelter_2.id}/pets")
      expect(page).to have_css("img[src*='#{new_pet.image}']")
      expect(page).to have_content(new_pet.name)
      expect(page).to have_content(new_pet.approximate_age)
      expect(page).to have_content(new_pet.sex)
    end
  end
end
