# frozen_string_literal: true
require File.expand_path('mosaic/base.rb', __dir__)
Dir.glob(File.expand_path('mosaic/*.rb', __dir__)).each { |f| require f }
