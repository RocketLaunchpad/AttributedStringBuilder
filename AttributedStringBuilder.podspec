# vi: ft=ruby

Pod::Spec.new do |s|
  s.name = "AttributedStringBuilder"
  s.version = "1.0.0"
  s.summary = "AttributedStringBuilder Library"

  s.description = <<-DESC
  AttributedStringBuilder Library for iOS
  DESC

  s.homepage = "https://www.rocketinsights.com"

  s.author = "Paul Calnan"

  # TODO: Change the GIT URL to match the project"s home.
  s.source = { :git => "https://github.com/Organization/Repo.git", :tag => "#{s.version}" }
  s.license = { :type => "MIT" }

  s.platform = :ios, "11.0"
  s.swift_version = "5.0"

  s.source_files = "Sources/AttributedStringBuilder/**/*.swift"
  s.resources = "Sources/AttributedStringBuilder/**/*.{storyboard,xcassets,strings,imageset,png}"

  # TODO: Add dependencies
  # NOTE: The AttributedStringBuilder target in the Podfile must include the same dependencies.
  # s.dependency "Name", "~> Version"
end

