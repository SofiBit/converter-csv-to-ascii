# frozen_string_literal: true

require_relative 'cell.rb'

class AsciiTable
  class Row
    attr_reader :cells

    def initialize(data)
      @cells = data.map.with_index do |cell, column|
        Cell.new(cell, column)
      end
    end

    def height
      @height ||= cells.map(&:value).map(&:count).max
    end
  end
end
