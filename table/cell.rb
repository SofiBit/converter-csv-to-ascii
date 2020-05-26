# frozen_string_literal: true

class AsciiTable
  class Cell
    attr_reader :value, :max_width, :type, :column

    def initialize(parameters, column)
      @column = column
      @value = Array(parameters[:value])
      @type = parameters[:header]
      @max_width = value.map(&:size).max
    end
  end
end
