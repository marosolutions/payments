module Payments
  class Gateway

    def self.help
      response = HTTParty.get(
        Payments.configuration.host + '/help',
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.list
      response = HTTParty.get(
        Payments.configuration.host + '/',
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end
  end
end
