module Payments
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :host
    attr_accessor :username, :password

    def auth_key
      Base64.encode64(username + ':' + password)
    end
  end
end
