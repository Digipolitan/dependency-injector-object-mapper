Pod::Spec.new do |s|
s.name = "DependencyInjectorObjectMapper"
s.version = "1.0.1"
s.summary = "Add Mappable support with dependency injection"
s.homepage = "https://github.com/Digipolitan/dependency-injector-object-mapper"
s.authors = "Digipolitan"
s.source = { :git => "https://github.com/Digipolitan/dependency-injector-object-mapper.git", :tag => "v#{s.version}" }
s.license = { :type => "BSD", :file => "LICENSE" }
s.source_files = 'Sources/**/*.{swift,h}'
s.ios.deployment_target = '8.0'
s.watchos.deployment_target = '2.0'
s.tvos.deployment_target = '9.0'
s.osx.deployment_target = '10.10'
s.requires_arc = true
s.dependency 'DependencyInjector', '~> 2.0'
s.dependency 'ObjectMapper', '~> 2.0'
end
