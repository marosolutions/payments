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
        Payments.configuration.host + '/transactions/purchase',
        body: { gateway: gateway, credentials: credentials, amount: amount, credit_card: credit_card, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.authorize gateway, amount, credit_card, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transactions/authorize',
        body: { gateway: gateway, credentials: credentials, amount: amount, credit_card: credit_card, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.capture gateway, amount, authorization, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transactions/capture',
        body: { gateway: gateway, credentials: credentials, amount: amount, authorization: authorization, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.void gateway, authorization, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transactions/void',
        body: { gateway: gateway, credentials: credentials, authorization: authorization, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.refund gateway, amount, authorization, ip, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transactions/refund',
        body: { gateway: gateway, credentials: credentials, amount: amount, authorization: authorization, ip: ip, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end

    def self.verify gateway, credit_card, options={}
      response = HTTParty.post(
        Payments.configuration.host + '/transactions/verify',
        body: { gateway: gateway, credentials: credentials, credit_card: credit_card, options: options },
        headers: { 'Authorization' => "Basic #{Payments.configuration.auth_key}" }
      )
      return JSON.load(response.body)
    end
  end
end
