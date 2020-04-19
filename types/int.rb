# frozen_string_literal: true

module Type
  class Int
    ALIGNMENT = ' '

    attr_reader :value

    def initialize(value)
      @value = value
    end

    def convert
      ALIGNMENT + value.to_s
    end
  end
end
