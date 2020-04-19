# frozen_string_literal: true

class AsciiTable
  class Cell
    attr_reader :value, :width, :type

    def initialize(parameters)
      @value = Array(parameters[:value])
      @type = parameters[:header]
      @width = value.map(&:size).max
    end
  end
end
