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

    def auth
      {username: Payments.configuration.username, password: Payments.configuration.password}
    end
  end
end
