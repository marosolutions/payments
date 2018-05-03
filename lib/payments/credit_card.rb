module Payments
  class CreditCard

    def self.find id
      response = HTTParty.post(
        Payments.configuration.host + "/credit_cards/#{id}/find",
        query: { gateway: gateway, credentials: credentials, amount: amount, authorization: authorization, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.add first_name, last_name, number, month, year, verification_value
      response = HTTParty.post(
        Payments.configuration.host + '/credit_cards',
        query: { first_name: first_name, last_name: last_name, number: number, month: month, year: year, verification_value: verification_value },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end
  end
end
