module JasperserverRails
  class Configuration
    attr_accessor :servers, :config_file

    def cookie
      @cookie ||= Login.new.cookies
    end

    def logout
      @cookie = nil
    end

    def server
      servers[Rails.env.to_sym]
    end

    def servers
      @servers ||= read_config_file
    end

    def read_config_file
      Rails.configuration.jasperserver
    end
  end
end
