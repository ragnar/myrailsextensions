$:.unshift "#{File.dirname(__FILE__)}"

STDERR.puts "** Starting to load MyRailsExtensions."

require 'rails/action_view/helpers/asset_tag_helper.rb'
require 'plugins/acts_as_list.rb' if File.exists?(File.expand_path('vendor/plugins/acts_as_list', RAILS_ROOT))

STDERR.puts "** Finished loading MyRailsExtensions."
STDERR.flush