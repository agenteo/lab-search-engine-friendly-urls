require_relative "config/environment"
require 'benchmark'

Benchmark.bm do |x|
  x.report { lookup = PsycoticLookup.new('bathrooms'); lookup.ids  }
end
