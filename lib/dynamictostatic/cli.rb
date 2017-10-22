 require "thor"
 require "dynamictostatic"

 module Dynamictostatic
   class CLI < Thor
   	desc "DynamicFrameworkTargetName", "Converts the given Dynamic Framework to a Static Framework"
   	option :xcodeproj_path
  	def convert(name)
  		if options[:xcodeproj_path]
  			@xcodeproj_path = options[:xcodeproj_path]
  		else
  			@xcodeproj_path = name + '.xcodeproj'
  		end
    	Dynamictostatic::Converter.new({
			:framework_target_name => name,
			:xcodeproj_path => @xcodeproj_path
		}).run
  	end
   end
  end
