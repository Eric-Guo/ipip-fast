require 'ipaddr'
require "json"

module IPDB
  class Reader
    attr_reader :meta

    def initialize(name)
      if name.nil?
        name = "#{__dir__}/ipipfree.ipdb"
      elsif !File.exists?(name)
        raise "You must specify 'database => ...' in your ipip filter (I looked for '#{name}')"
      end

      if !File.readable? name
        raise "ip database is not readable."
      end

      @data = File.read name, encoding: 'ASCII-8BIT'

      meta_len = @data[0 ... 4].unpack('N')[0]
      meta_buf = @data[4 ... 4+meta_len]

      @meta = JSON.parse(meta_buf)

      if @data.length != (4 + meta_len + @meta['total_size'])
        raise "ip database file size error."
      end

      @node_count = @meta['node_count']
      @cache = {}
      @body = @data[4+meta_len ... @data.length]
    end

    def read_node(node, idx)
      off = node * 8 + idx * 4
      @body[off..off+3].unpack('N')[0]
    end

    def find(ipx, lang)
      begin
        ipv = IPAddr.new ipx
      rescue => e
        return e.message
      end

      addr = ipv.hton
      node = ipv.ipv4? ? 96 : 0

      idx = 0
      key = addr[0...16]
      val = @cache[key]
      if !val.nil?
        node = val
        idx = 16
      end

      if node < @node_count
        while idx < 128 do
          bin = addr[idx >> 3].unpack("C")[0]
          flag = (1 & (bin >> 7 - (idx % 8)))
          node = self.read_node(node, flag)
          idx += 1
          if idx == 16
            @cache[key] = node
          end
          if node > @node_count
            break
          end
        end
      end

      resolved = node - @node_count + @node_count * 8
      size = @body[resolved..resolved+1].unpack('n')[0]

      temp = @body[resolved+2..resolved+1+size]
      loc = temp.encode("UTF-8", "UTF-8").split("\t", @meta['fields'].length * @meta['languages'].length)

      off = @meta['languages'][lang]

      loc[off ... @meta['fields'].length+off]
    end
  end
end
