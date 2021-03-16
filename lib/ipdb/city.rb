# frozen_string_literal: true

require_relative 'reader'

module IPDB
  class City
    def initialize(name)
      @db = Reader.new name
    end

    def find(ipx, lang)
      @db.find ipx, lang
    end
  end
end
