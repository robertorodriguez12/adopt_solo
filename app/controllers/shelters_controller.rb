class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelters = Shelter.find(params[:id])
  end

end
