class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelters = Shelter.find(params[:id])
  end

  def new
  end

  def create
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def edit
    @shelters = Shelter.find(params[:id])
  end

  def update
    @shelters = Shelter.find(params[:id])
    @shelters.update(shelter_params)
    redirect_to "/shelters/#{@shelters.id}"
  end

  private
  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end
