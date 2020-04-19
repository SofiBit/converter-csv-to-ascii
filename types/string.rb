# frozen_string_literal: true

module Type
  class String
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def convert
      value.split(' ')
    end
  end
end
