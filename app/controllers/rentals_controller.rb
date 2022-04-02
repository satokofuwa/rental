class RentalsController < ApplicationController  
  before_action :set_property, only: %i[ show edit update delete]

  def index
    @rentals = Rental.all
  end
  
  def new
    @rental = Rental.new
    @rental.routes.build 
  end 
  
  def create
    @rental = Rental.new(rental_params)
    respond_to do |format|
      if @rental.save
        format.html { redirect_to rental_url(@rental), notice: "Rental was successfully created." }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
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
    @routes = @rental.routes
  end

  def show
    @routes = @rental.routes #rentalの情報はset_propertyで情報を持ってきてるので、ここではroutes情報のみ
  end
  
  def destroy
    @rental.destroy
      respond_to do |format|
        format.html { redirect_to rental_url, notice: "rental was successfully destroyed." }
        format.json { head :no_content }
      end
  end 

  private

  def set_property
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:property, :price, :address, :old, :content, routes_attributes: [:rental_id, :route1, :station1, :walk1 ])
  end
end
