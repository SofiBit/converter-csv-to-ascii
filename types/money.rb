# frozen_string_literal: true

module Type
  class Money
    DISCHARGE_FORMAT = /.{3}(?=.)/.freeze
    COUNT_AFTER_POINT = 2
    SEPARATOR_OF_DISCHARGES = '\0 '

    attr_reader :source_value, :integer, :tail

    def initialize(value)
      @source_value = value
      @integer, @tail = split_value
    end

    def convert
      [new_integer, new_tail].join(',')
    end

    private

    def new_tail
      return tail if tail.length == COUNT_AFTER_POINT

      tail + '0'
    end

    def new_integer
      integer.reverse.gsub(DISCHARGE_FORMAT, SEPARATOR_OF_DISCHARGES).reverse
    end

    def split_value
      source_value.to_f.round(COUNT_AFTER_POINT).to_s.split('.')
    end
  end
end
