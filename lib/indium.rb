require 'stellar-sdk'
require 'httparty'
require 'json'

class Indium
  attr_reader :mode

  def initialize(mode)
    @issuer_address = "GB6TBT62K4NG2MIHMGGRZPIW2GI62T56RCWHWHKCY2BIORDPQQ5LCPVR"
    @issuer = Stellar::KeyPair.from_address(@issuer_address)
    @asset = Stellar::Asset.alphanum12("INDIUM", @issuer)
    @mode = mode # test or prod
    if mode == 'test'
      @client = Stellar::Client.default_testnet
      @horizon = "https://horizon-testnet.stellar.org"
    elsif mode == 'prod'
      @client = Stellar::Client.default
      @horizon = "https://horizon.stellar.org"
    end
  end

  def balances(pubkey)
    resp = HTTParty.get(@horizon + "/accounts/" + pubkey)
    JSON.parse(resp.body)["balances"].inject({}) do |f,h|
      f.merge({ (h["asset_code"] || h["asset_type"]) => h["balance"] })
    end
  end

  def balances_direct(pubkey)
    account = Stellar::Account.from_address(pubkey)
    @client.account_info(account).balances.inject({}) do |f,h|
      f.merge({ (h["asset_code"] || h["asset_type"]) => h["balance"] })
    end
  end

  def transfer_native(amount, sender_privkey, receiver_pubkey)
    sender    = Stellar::Account.from_seed(sender_privkey)
    recipient = Stellar::Account.from_address(receiver_pubkey)

    @client.send_payment({
      from:   sender,
      to:     recipient,
      amount: Stellar::Amount.new(amount)
    })
  end

  def transfer(amount, sender_privkey, receiver_pubkey)
    sender    = Stellar::Account.from_seed(sender_privkey)
    recipient = Stellar::Account.from_address(receiver_pubkey)

    @client.send_payment({
      from:   sender,
      to:     recipient,
      amount: Stellar::Amount.new(amount, @asset)
    })
  end

  def create_indium_account(privkey)
    account = Stellar::Account.random
    transfer_native(4, privkey, account.address) # Activate the account

    @client.trust({
      account:  account,
      asset: @asset
    }) # create a trustline for Indium token
    return [account.address, account.keypair.seed]
  end

  def self.test
    self.new('test')
  end

  def self.prod
    self.new('prod')
  end
end
