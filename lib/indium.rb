require 'ethereum.rb'
require 'eth'
require 'httpclient'
require 'bigdecimal'

class Indium
  attr_reader :client
  
  def initialize(node_url, chain_id)
    @node_url = node_url
    @chain_id = chain_id
    Eth.configure do |config|
      config.chain_id = chain_id # nil by default, meaning valid on any chain
    end
    @client = Ethereum::HttpClient.new(node_url, proxy = nil, log = true) # log to /tmp/ethereum_ruby_http.log
  end

  def balance(pubkey)
    @client.get_balance(pubkey)
  end

  def get_receipt(tx_hash)
    @client.eth_get_transaction_receipt(tx_hash)
  end

  def transfer(signtxn_url, sender_privkey, receiver_pubkey, amount, hex_data = "", gas_limit = 21_000, gas_price = 3_141_592)
    http = HTTPClient.new
    params = {
      "rpc" => @node_url,
      "receiver" => receiver_pubkey,
      "sender" => Eth::Key.new(priv: sender_privkey).address,
      "privkey" => sender_privkey,
      "amount" => amount,
      "gaslimit" => gas_limit,
      "gasprice" => gas_price,
      "chain" => @chain_id,
      "data" => hex_data
    }
    return http.post(signtxn_url, params)
  end

  def wei_to_eth_str(w)
    (BigDecimal.new(w.to_i) / BigDecimal.new("1000_000_000_000_000_000")).to_s
  end

  def eth_str_to_wei(es)
    (BigDecimal.new(es.to_s) * BigDecimal.new("1000_000_000_000_000_000")).to_i
  end

  def create_keypair
    kp = Eth::Key.new
    return kp.address, kp.private_hex
  end

  def self.local(chain_id = 246)
    self.new('http://localhost:8545',chain_id)
  end

  def self.test(chain_id = 246)
    self.new('http://testrpcnode.indium.network:8545',chain_id)
  end

  def self.prod(chain_id = 246)
    self.new('http://rpcnode.indium.network:8545',chain_id)
  end

  def self.custom(url, chain_id = 246)
    self.new(url, chain_id)
  end
end
