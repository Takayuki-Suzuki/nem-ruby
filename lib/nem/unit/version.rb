module Nem
  module Unit
    # @attr [String] value
    class Version
      TESTNET = 0x98 << 24 # -1744830464
      MAINNET = 0x68 << 24 #  1744830464
      MIJIN   = 0x60 << 24

      attr_accessor :value

      def initialize(value)
        @value = value
      end

      # @return [Integer]
      def version
        @version ||= value & 0x00000003
      end

      # @return [Integer]
      def network
        @network ||= value & 0xfffffffc
      end

      %w[testnet mainnet mijin].each do |k|
        # @return [Boolean]
        define_method("#{k}?") {
        network == self.class.const_get(k.upcase) }
      end

      # @return [Boolean]
      def version?(num)
        version & 0x00000003 == num ? true : false
      end

      # @return [Boolean]
      def network?(network)
        # require 'pry'; binding.pry
        network == case (value & 0xfffffffc) >> 24
          when 0x68 then :mainnet
          when 0x98 then :testnet
          when 0x60 then :mijin
          else raise "Unexpected network: #{(version & 0xfffffffc) >> 24}"
        end
      end

      # @return [String]
      def to_s
        testnet? ? 'testnet' :
          mainnet? ? 'mainnet' :
            mijin? ? 'mijin' :
            'unexpected'
      end

      # @return [Integer]
      def to_i
        value.to_i
      end

      # @return [Boolean]
      def ==(other)
        @value == other.value
      end
    end
  end
end
