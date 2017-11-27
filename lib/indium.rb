require 'bigchaindb'

class Indium
  attr_reader :asset_id
  attr_reader :ipdb

  def initialize(asset_id, ipdb)
    @asset_id = asset_id
    @ipdb = ipdb
  end

  def balance(pubkey)
    Bdb.balance_asset(@ipdb, pubkey, @asset_id)
  end

  def transfer(receiver_pubkeys_amounts, sender_pubkey, sender_privkey, data)
    Bdb.transfer_asset(@ipdb, receiver_pubkeys_amounts, sender_pubkey, sender_privkey, unspent_outputs = nil, @asset_id, data)
  end

  def self.test(app_id = nil, app_key = nil)
    self.new("4bf41c7d08bef68181fd378308691cc2ce65661804d317e2db72b9c0d4f1d73f", {"url" => "https://test.ipdb.io/api/v1", "app_id" => app_id, "app_key" => app_key})
  end

  def self.prod(app_id = nil, app_key = nil)
    self.new("c49b21534ee715ad844bc178a6a578d63a4971d1f52ad783e18a6a2f27710e68", {"url" => "https://test.ipdb.io/api/v1", "app_id" => app_id, "app_key" => app_key})
  end
end