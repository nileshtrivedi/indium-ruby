Gem::Specification.new do |s|
  s.name        = 'indium'
  s.version     = '0.0.3'
  s.date        = '2017-10-24'
  s.summary     = "Indium - asset on IPDB"
  s.description = "Library for querying/posting Indium transactions on IPDB"
  s.authors     = ["Nilesh Trivedi"]
  s.email       = 'github@nileshtrivedi.com'
  s.files       = ["lib/indium.rb"]
  s.add_runtime_dependency 'bigchaindb'
  s.homepage    =
    'https://github.com/nileshtrivedi/indium-ruby'
  s.license       = 'MIT'
end