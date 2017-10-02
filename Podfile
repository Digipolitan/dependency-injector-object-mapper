workspace 'DependencyInjectorObjectMapper.xcworkspace'

## Frameworks targets
abstract_target 'Frameworks' do
	use_frameworks!

	pod 'DependencyInjector', '~> 2.1'
	pod 'ObjectMapper', '~> 3.0'

	target 'DependencyInjectorObjectMapper-iOS' do
		platform :ios, '8.0'
	end

	target 'DependencyInjectorObjectMapper-watchOS' do
		platform :watchos, '2.0'
	end

	target 'DependencyInjectorObjectMapper-tvOS' do
		platform :tvos, '9.0'
	end

	target 'DependencyInjectorObjectMapper-OSX' do
		platform :osx, '10.10'
	end
end

## Tests targets
abstract_target 'Tests' do
	use_frameworks!

	pod 'DependencyInjector', '~> 2.0'
	pod 'ObjectMapper', '~> 3.0'

	target 'DependencyInjectorObjectMapperTests-iOS' do
		platform :ios, '8.0'
	end

	target 'DependencyInjectorObjectMapperTests-tvOS' do
		platform :tvos, '9.0'
	end

	target 'DependencyInjectorObjectMapperTests-OSX' do
		platform :osx, '10.10'
	end
end

## Samples targets
abstract_target 'Samples' do
	use_frameworks!

	pod 'DependencyInjector', '~> 2.0'
	pod 'ObjectMapper', '~> 3.0'

	target 'DependencyInjectorObjectMapperSample-iOS' do
		project 'Samples/DependencyInjectorObjectMapperSample-iOS/DependencyInjectorObjectMapperSample-iOS'
		platform :ios, '8.0'
	end

	abstract_target 'watchOS' do
		project 'Samples/DependencyInjectorObjectMapperSample-watchOS/DependencyInjectorObjectMapperSample-watchOS'
		target 'DependencyInjectorObjectMapperSample-watchOS' do
			platform :ios, '8.0'
		end

		target 'DependencyInjectorObjectMapperSample-watchOS WatchKit Extension' do
			platform :watchos, '2.0'
		end
	end

	target 'DependencyInjectorObjectMapperSample-tvOS' do
		project 'Samples/DependencyInjectorObjectMapperSample-tvOS/DependencyInjectorObjectMapperSample-tvOS'
		platform :tvos, '9.0'
	end

	target 'DependencyInjectorObjectMapperSample-OSX' do
		project 'Samples/DependencyInjectorObjectMapperSample-OSX/DependencyInjectorObjectMapperSample-OSX'
		platform :osx, '10.10'
	end
end
