module Payments
  class Transaction

    def self.find id
      response = HTTParty.get(
        Payments.configuration.host + '/transaction/' + id,
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.purchase gateway, credentials, amount, credit_card, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transaction/purchase',
        query: { gateway: gateway, credentials: credentials, amount: amount, credit_card: credit_card, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.authorize gateway, amount, credit_card, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transaction/authorize',
        query: { gateway: gateway, credentials: credentials, amount: amount, credit_card: credit_card, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.capture gateway, amount, authorization, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transaction/capture',
        query: { gateway: gateway, credentials: credentials, amount: amount, authorization: authorization, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.void gateway, authorization, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transaction/void',
        query: { gateway: gateway, credentials: credentials, authorization: authorization, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.refund gateway, amount, authorization, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transaction/refund',
        query: { gateway: gateway, credentials: credentials, amount: amount, authorization: authorization, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.verify gateway, credit_card, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transaction/verify',
        query: { gateway: gateway, credentials: credentials, credit_card: credit_card, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end
  end
end
