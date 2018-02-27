Gem::Specification.new do |s|
  s.name        = 'indium'
  s.version     = '0.1.1'
  s.date        = '2018-02-27'
  s.summary     = "Indium"
  s.description = "Library for querying/posting transactions from the Indium network"
  s.authors     = ["Nilesh Trivedi"]
  s.email       = 'github@nileshtrivedi.com'
  s.files       = ["lib/indium.rb"]
  s.add_runtime_dependency 'eth', '~> 0.4.6'
  s.add_runtime_dependency 'ethereum.rb', '~> 2.1'
  s.homepage    =
    'https://github.com/nileshtrivedi/indium-ruby'
  s.license       = 'MIT'
end
