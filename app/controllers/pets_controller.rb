class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def index_shelter
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets.all
  end

end
