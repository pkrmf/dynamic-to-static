require "dynamictostatic/version"
require "dynamictostatic/cli"

module Dynamictostatic
  class Converter
  	attr_reader :framework_target_name, :xcodeproj_path

  	def self.perform(options)
		new(options).perform
	end

	def initialize(options)
		@framework_target_name = options.fetch(:framework_target_name)
		@xcodeproj_path = options.fetch(:xcodeproj_path)
	end

	def run
		@project = Xcodeproj::Project.open(@xcodeproj_path)
		framework_target = @project.native_targets.find { |target| target.name == @framework_target_name }

		framework_target.build_configuration_list.build_configurations.each do |build_config|
			puts build_config

		       #build_config.build_settings.delete "BUNDLE_LOADER"
		end

	end
  end
end
