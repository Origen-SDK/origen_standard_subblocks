require 'origen_testers'
require 'origen'
require_relative '../config/application.rb'

module OrigenStandardSubblocks
  # Load the subblocks.
  Dir.glob("#{File.dirname(__FILE__)}/origen_standard_subblocks/**/*.rb").sort.each do |file|
    require file
  end
end
