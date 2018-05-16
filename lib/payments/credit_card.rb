module Payments
  class CreditCard

    def self.find id, secret
      response = HTTParty.post(
        Payments.configuration.host + "/credit_cards/#{id}/find",
        query: { secret: secret },
        basic_auth: Payments.configuration.auth
      )
      return JSON.load(response.body)
    end

    def self.add first_name, last_name, number, month, year, verification_value
      response = HTTParty.post(
        Payments.configuration.host + '/credit_cards',
        query: { first_name: first_name, last_name: last_name, number: number, month: month, year: year, verification_value: verification_value },
        basic_auth: Payments.configuration.auth
      )
      return JSON.load(response.body)
    end

    def self.delete id, secret
      response = HTTParty.delete(
        Payments.configuration.host + "/credit_cards/#{id}",
        query: { secret: secret },
        basic_auth: Payments.configuration.auth
      )
      return JSON.load(response.body)
    end
  end
end
