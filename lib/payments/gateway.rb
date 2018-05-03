module Payments
  class Gateway

    def self.help
      response = HTTParty.get(
        Payments.configuration.host + '/help',
        basic_auth: Payments.configuration.auth
      )
      return JSON.load(response.body)
    end

    def self.find name
      response = HTTParty.get(
        Payments.configuration.host + "/payment_gateways/#{name}",
        basic_auth: Payments.configuration.auth
      )
      return JSON.load(response.body)
    end

    def self.list
      response = HTTParty.get(
        Payments.configuration.host + '/payment_gateways',
        basic_auth: Payments.configuration.auth
      )
      return JSON.load(response.body)
    end
  end
end
