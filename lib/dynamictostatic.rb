require "dynamictostatic/version"
require "dynamictostatic/cli"
require 'Xcodeproj'

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
			build_config.build_settings['MACH_O_TYPE'] = "staticlib"
			build_config.build_settings['ONLY_ACTIVE_ARCH'] = "NO"
			build_config.build_settings['INSTALL_PATH'] = "/usr/local/lib"
			build_config.build_settings['LD_DYLIB_INSTALL_NAME'] = ""
			build_config.build_settings['DYLIB_INSTALL_NAME_BASE'] = ""
			build_config.build_settings['OTHER_LDFLAGS'] = "$(inherited) -ObjC"
			build_config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = "$(inherited)"
			build_config.build_settings['CLANG_ENABLE_MODULE_DEBUGGING'] = "NO"
			build_config.build_settings['DEAD_CODE_STRIPPING'] = "NO"
			build_config.build_settings['COPY_PHASE_STRIP'] = "NO"
			build_config.build_settings['STRIP_STYLE'] = "Non-Global Symbols"
			if build_config.name == 'Release'
				build_config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = "NO"
			end
		end
		@project.save

	end
  end
end
