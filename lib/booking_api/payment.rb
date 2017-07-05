module BookingApi
  class Payment

    def initialize
      @http_service = HttpService.new
    end

    def http_service
      @http_service
    end

    # Makes a booking for the specified hotel, room, guest.
    def process_booking(request_parameters: {})
      default_parameters = {}
      http_service.request_post("/json/bookings.processBooking", default_parameters.merge(request_parameters))
    end

    #Returns a list of the bookings asscociated to the guest.
    def guest_bookings(request_parameters: {})
      default_parameters = {}
      http_service.request_post("/json/guestBookings", default_parameters.merge(request_parameters))
    end

    #Returns a list of the bookings that have been made through your account or with one of your affiliate IDs.
    def guest_booking_details(request_parameters: {})
      default_parameters = {}
      http_service.request_post("/json/bookings.getBookingDetails", default_parameters.merge(request_parameters))
    end

        #Returns a list of the bookings that have been made through your account or with one of your affiliate IDs.
    def cancel_booking(request_parameters: {})
      default_parameters = {}
      http_service.request_post("/json/bookings.cancelBooking", default_parameters.merge(request_parameters))
    end


    private

  end
end

