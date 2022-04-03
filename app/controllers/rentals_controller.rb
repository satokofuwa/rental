class RentalsController < ApplicationController  
  before_action :set_property, only: %i[ show edit update destroy]

  def index
    @rentals = Rental.all
  end
  
  def new
    @rental = Rental.new
    @rental.routes.build 
  end 
  
  def create
    @rental = Rental.new(rental_params)
      if @rental.save
         redirect_to rental_url(@rental), notice: "Rental was successfully created." 
      else
        redirect_to rental_url(@rental), notice: "An error has occurred." 
      end
  end

  def update
        if @rental.update(rental_params)     
          redirect_to rental_url, notice: "property has been successfully updated." 
        else
          redirect_to edit_rental_url,notice: "An error has occered"
        end
  end

  def edit
    @routes = @rental.routes
    1.times{@rental.routes.build}
  end

  def show
    @routes = @rental.routes #rentalの情報はset_propertyで情報を持ってきてるので、ここではroutes情報のみ
  end
  
  def destroy
    if @rental.present?
      @rental.destroy
    end
    redirect_to rentals_url, notice: "the property has been deleted!"
  end 

  private

  def set_property
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:property, :price, :address, :old, :content, routes_attributes: [:rental_id, :route1, :station1, :walk1 ])
  end
end
