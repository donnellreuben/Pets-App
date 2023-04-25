class PetsController < ApplicationController

# NEW
  def new
  # @pet = Pet.new
    @pet = current_user.pets
  end

# INDEX
  def index
    @pets = current_user.pets
  end


# CREATE
  def create 
    # @pet = Pet.new(
    #   name: params[:pet][:name],
    #   breed: params[:pet][:breed],
    #   image: params[:pet][:image]
    # )
    # @pet.save
    @pet = current_user.pets.new(
      name: params[:pet][:name],
      breed: params[:pet][:breed],
      image: params[:pet][:image]
    )
    if @pet.save
      redirect_to pets_path, notice: "Pet was successfully created."
    else
      render :new
    end
  end

# SHOW
  def show
    @pet = current_user.pets.find(params[:id])
    render :show
  end

# EDIT
  def edit 
    @pet = Pet.find(params[:id])
    render :edit
  end

# UPDATE
  def update
    @pet = Pet.find(params[:id])
    @pet.update(
      name: params[:pet][:name],
      breed: params[:pet][:breed],
      image: params[:pet][:image]
    )

    redirect_to "/pets"
  end

# DELETE/DESTROY
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    redirect_to "/pets"
  end
end
