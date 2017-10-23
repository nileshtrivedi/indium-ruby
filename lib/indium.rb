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
    self.new("4725818866863db70d8e2a650b8acb92a8fd801dceedfc6709b5595af91ae08c", {"url" => "https://test.ipdb.io/api/v1", "app_id" => app_id, "app_key" => app_key})
  end

  def self.prod(app_id = nil, app_key = nil)
    self.new("1b17519e003dadaafefdd5011e4a1b3b503cc8b0621bba2e462793ba26720d74", {"url" => "https://test.ipdb.io/api/v1", "app_id" => app_id, "app_key" => app_key})
  end
end