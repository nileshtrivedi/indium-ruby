Gem::Specification.new do |s|
  s.name        = 'indium'
  s.version     = '0.0.8'
  s.date        = '2017-11-27'
  s.summary     = "Indium - asset on IPDB"
  s.description = "Library for querying/posting Indium transactions on IPDB"
  s.authors     = ["Nilesh Trivedi"]
  s.email       = 'github@nileshtrivedi.com'
  s.files       = ["lib/indium.rb"]
  s.add_runtime_dependency 'bigchaindb', '>= 0.0.8'
  s.homepage    =
    'https://github.com/nileshtrivedi/indium-ruby'
  s.license       = 'MIT'
end
