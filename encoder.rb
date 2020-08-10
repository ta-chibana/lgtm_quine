require 'json'

class Encoder
  A = 42
  B = 91
  C = 93
  D = 126
  
  # 基数
  BASE = (A..B).to_a.length + (C..D).to_a.length

  CODES = %i(l g t m)

  def self.encode
    CODES.each_with_object({}) do |code, acc|
      encoder = new(code)
      acc[code] = {
        encoded: encoder.encode,
        check: encoder.decode == encoder.text
      }
    end
  end

  def initialize(code)
    @code = code
  end

  def encode
    @encoded ||= self.then do
      ns = []
      n = text
      while n > 0
        ns << n % BASE
        n /= BASE
      end

      ns = ns.map { |n| (n + C - A) % (D - A + 1) + A }

      ns.pack('C*').reverse
    end
  end

  def decode
    n = 0
    encode.bytes do |m|
      n = n * BASE + (m + D - A - C + 1) % (D - A + 1)
    end
    n
  end

  def text
    @text ||= File
              .read("templates/#{code}.txt")
              .tr("\n", '')
              .reverse
              .gsub(/./, { ' ' => 0, '#' => 1 })
              .to_i(2)
  end

  private

  attr_reader :code
end

result = Encoder.encode

code = <<~CODE
  WS = [
    "#{result[:l][:encoded]}",
    "#{result[:g][:encoded]}",
    "#{result[:t][:encoded]}",
    "#{result[:m][:encoded]}"
  ];
CODE

# puts result.to_json

puts code
