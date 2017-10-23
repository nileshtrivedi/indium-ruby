require 'bigchaindb'

class Indium
  attr_reader :asset_id
  attr_reader :ipdb

  def initialize(asset_id, ipdb)
    @asset_id = asset_id
    @ipdb = ipdb
  end

  def balance(pubkey)
    Bdb.balance_asset(@ipdb, public_key, @asset_id)
  end

  def self.test(app_id = nil, app_key = nil)
    self.new(test_asset_id, {"url" => "https://test.ipdb.io/api/v1", "app_id" => app_id, "app_key" => app_key})
  end

  def self.prod(app_id = nil, app_key = nil)
    self.new(prod_asset_id, {"url" => "https://test.ipdb.io/api/v1", "app_id" => app_id, "app_key" => app_key})
  end
end