# frozen_string_literal: true

module Type
  class Int
    attr_reader :value

    def initialize(value)
      @value = value.to_i
    end

    def convert
      value.to_s
    end
  end
end
