class RentalsController < ApplicationController  
  before_action :rental_params, only: %i[ new create show edit update destroy ]
  def index
    @rentals = Post.all
  end
  
  def new
    @rental = Rental.new
    @rental.routes.new
  end
  
  def create
    @rental = Renatal.new(rental_params)
  end

  def update
    respond_to do |format|
        if @rental.update(rental_params)     
          format.html { redirect_to rental_url(@rental), notice: "property was successfully updated." }
          format.json { render :show, status: :ok, location: @rental }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @rental.errors, status: :unprocessable_entity }
        end
      end
  end

  def edit
    redirect_to edit_rental_path(current_property.id)
  end

  def show
    @route = current_property.find_by(rental_id: @rental.id)
  end
  
  private

  def rental_params
    params.require(:rental).permit(:route1, :station1, :walk1,:route2, :station2, :walk2, :rental_id )
  end
end
