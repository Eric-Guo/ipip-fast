#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'ipip-fast'
require 'ruby-prof'
require 'ruby-prof-flamegraph'

RubyProf.start

db = IPDB.city '/Users/guochunzhong/Downloads/ipipfreedb/ipipfree.ipdb'
puts db.meta
puts db.find '1.1.1.1', 'CN'

result = RubyProf.stop

printer = RubyProf::FlameGraphPrinter.new(result)
File.open('city_db_find.flame', 'w') do |f|
  printer.print(f)
end

puts 'flamegraph.pl city_db_find.flame > city_db_find.svg'
