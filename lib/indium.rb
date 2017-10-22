require 'bigchaindb'

class Indium
  attr_reader :asset_id

  def initialize(asset_id)
    @asset_id = asset_id
    @ipdb = {"url" => "https://test.ipdb.io/api/v1"}
  end

  def balance(pubkey)
    Bdb.balance_asset(@ipdb, public_key, @asset_id)
  end
end