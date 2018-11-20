Gem::Specification.new do |s|
  s.name        = 'indium'
  s.version     = '0.3.2'
  s.date        = '2018-11-20'
  s.summary     = "Indium"
  s.description = "Library for querying/posting transactions from the Indium network"
  s.authors     = ["Nilesh Trivedi"]
  s.email       = 'github@nileshtrivedi.com'
  s.files       = ["lib/indium.rb"]
  s.add_runtime_dependency 'eth', '~> 0.4.10'
  s.add_runtime_dependency 'ethereum.rb', '~> 2.2'
  s.add_runtime_dependency 'httpclient', '~> 2.8'
  s.homepage    =
    'https://github.com/nileshtrivedi/indium-ruby'
  s.license       = 'MIT'
end
