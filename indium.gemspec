Gem::Specification.new do |s|
  s.name        = 'indium'
  s.version     = '0.0.9'
  s.date        = '2018-01-30'
  s.summary     = "Indium"
  s.description = "Library for querying/posting Indium transactions from Stellar test/main network"
  s.authors     = ["Nilesh Trivedi"]
  s.email       = 'github@nileshtrivedi.com'
  s.files       = ["lib/indium.rb"]
  s.add_runtime_dependency 'stellar-sdk', '~> 0.2'
  s.add_runtime_dependency 'httparty', '~> 0.15'
  s.add_runtime_dependency 'json', '~> 2.1'
  s.homepage    =
    'https://github.com/nileshtrivedi/indium-ruby'
  s.license       = 'MIT'
end
