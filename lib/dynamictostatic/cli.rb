 require "thor"
 require "dynamictostatic"

 module Dynamictostatic
   class CLI < Thor
   	desc "DynamicFrameworkTargetName", "Converts the given Dynamic Framework to a Static Framework"
   	option :xcodeproj_path
  	def convert(name)
    	Dynamictostatic::Converter.new({
			:framework_target_name => name
			if options[:xcodeproj_path]
				:xcodeproj_path => options[:xcodeproj_path]
			else
				:xcodeproj_path => name
			end
		}).run
  	end
   end
  end
