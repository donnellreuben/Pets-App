class PetsController < ApplicationController

# NEW
  def new
    @pet = Pet.new
  end

# INDEX
  def index
    @pets = Pet.all
    render :index
  end

# CREATE
  def create 
    @pet = Pet.new(
      name: params[:pet][:name],
      breed: params[:pet][:breed],
      image: params[:pet][:image]
    )
    @pet.save
    redirect_to "/pets"
  end

# SHOW
  def show
    @pet = Pet.find(params[:id])
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
