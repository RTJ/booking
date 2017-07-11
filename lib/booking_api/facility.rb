module BookingApi
  class Facility

    def initialize
      @http_service = HttpService.new
    end

    def http_service
      @http_service
    end

    def get_facility_types(request_parameters)
      http_service.request_get("/json/bookings.getFacilityTypes", request_parameters)
    end
    
    private

  end
end

