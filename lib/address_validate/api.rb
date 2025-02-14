require 'net/http'
require 'uri'

module AddressValidate
  module API
    def self.validate_address(data)
      response = Net::HTTP.post_form(URI(AddressValidate.verify_url),
        { API: 'Verify',
          XML: Request.build_xml(data) })
      AddressValidate::API::Response.new(response.code == "200" ? response.body : "#{response.code} #{response.message}")
    end
  end
end
