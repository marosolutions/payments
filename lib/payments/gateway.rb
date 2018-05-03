module Payments
  class Gateway

    def self.help
      response = HTTParty.get(
        Payments.configuration.host + '/help',
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.find name
      response = HTTParty.get(
        Payments.configuration.host + "/payment_gateways/#{name}",
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.list
      response = HTTParty.get(
        Payments.configuration.host + '/payment_gateways',
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end
  end
end
