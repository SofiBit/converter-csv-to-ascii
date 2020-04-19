# frozen_string_literal: true

class AsciiTable
  class Row
    attr_reader :cells

    def initialize(data)
      @cells = data.map do |cell|
        Cell.new(cell)
      end
    end

    def width
      @width ||= calculate_width
    end

    def height
      @height ||= cells.map(&:value).map(&:count).max
    end

    private

    def calculate_width
      height.times.each_with_object([]) do |index, width|
        width << cells.map(&:value).map do |value|
          value[index]
        end.join('').size
      end.max
    end
  end
end
