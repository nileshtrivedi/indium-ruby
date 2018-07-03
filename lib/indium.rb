require 'ethereum.rb'
require 'eth'

class Indium
  attr_reader :client
  
  def initialize(node_url, chain_id)
    Eth.configure do |config|
      config.chain_id = chain_id # nil by default, meaning valid on any chain
    end
    @client = Ethereum::HttpClient.new(node_url)
  end

  def balance(pubkey)
    @client.get_balance(pubkey)
  end

  def transfer(sender_privkey, receiver_pubkey, amount, hex_data, gas_limit = 21_000, gas_price = 3_141_592)
    @client.gas_price = gas_price
    @client.gas_limit = gas_limit
    @client.transfer(sender_privkey, receiver_pubkey, amount) # transfer_and_wait ?
  end

  def create_indium_account
    kp = Eth::Key.new
    return kp.address, kp.private_hex
  end

  def self.local(chain_id = 17622)
    self.new('http://localhost:8545',chain_id)
  end

  def self.test(chain_id = 17622)
    self.new('http://testrpcnode.indium.network:8545',chain_id)
  end

  def self.prod(chain_id = 17622)
    self.new('http://rpcnode.indium.network:8545',chain_id)
  end

  def self.custom(url, chain_id = 17622)
    self.new(url, chain_id)
  end
end
