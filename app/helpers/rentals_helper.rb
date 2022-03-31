module RentalsHelper
    @current_property = Rental.find_by(id: rental[:id])
end
