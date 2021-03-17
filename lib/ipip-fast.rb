# frozen_string_literal: true

require_relative "ipip/fast/version"
require_relative 'ipdb/city'

module IPDB
  def self.city(name = nil)
    City.new name
  end
end
