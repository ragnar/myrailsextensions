$:.unshift "#{File.dirname(__FILE__)}"

STDERR.puts "** Starting to load MyRailsExtensions."

require "ruby/#{RUBY_VERSION.to_f}/array" if File.exists?(File.expand_path("ruby/#{RUBY_VERSION.to_f}/array.rb", File.dirname(__FILE__)))
require 'rails/action_controller/session/mem_cache_store'
require 'rails/action_view/helpers/asset_tag_helper'
require 'plugins/acts_as_list' if File.exists?(File.expand_path('vendor/plugins/acts_as_list', RAILS_ROOT))

STDERR.puts "** Finished loading MyRailsExtensions."
STDERR.flush