require_relative '../support/base'

class Hash
  def stringify
    inject({}) do |options, (key, value)|
      options[key.to_s] = value.to_s
      options
    end
  end
end

module Config
  def Config::read_config(product, server)
    config = {
        :server => Base.read_yaml('server')[server],
        :users_matrix => Base.read_yaml('users')[product][server],
        :users_map => Base.read_yaml('passwords')[server],
        :app_info => Base.read_yaml('app_info')[product],
        :db_list => Base.read_yaml('database_list')[server],
        :checkout_server => Base.read_yaml('checkout')[server],
        :wsdl_server => Base.read_yaml('wsdl')[server]
    }

    # Make sure everything is strings
    config.each do |key, value|
      config[key] = value.stringify if value.respond_to?(:stringify)
    end
  end
end