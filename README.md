# Indium

> Helper library to query/post Indium transactions

# Usage

- Initialize with the host+port of an Indium node which has RPC enabled:
```
indium = Indium.custom("http://your-rpcnode.url:8545", chain_id = 246)
indium = Indium.prod # which uses url = http://rpcnode.indium.network:8545 and chain_id = 246
```

- Generate a keypair (offline operation):
```
public_key, private_key = indium.create_keypair
```

- Check account balance of an address/public key:
```
indium.balance(pubkey)
```

- Transfer some coins to an address (need sender's private key and recipient's public key):
```
# Txn is signed locally so private keys are never transmitted
indium.transfer(nil, sender_privkey, receiver_pubkey, amount, hex_data, gas_limit = 21_000, gas_price = 3_141_592)
```

- For other methods (deploying/invoking contracts, creating a txn from scratch etc.), you can directly access the internal client obj with `indium.client` which is documented here: 
  - https://github.com/EthWorks/ethereum.rb
  - https://github.com/EthWorks/ethereum.rb/blob/master/lib/ethereum/client.rb
  - https://github.com/se3000/ruby-eth
