module RentalsHelper
    @current_property = Rentals.find_by(id: rental[:id])
end
