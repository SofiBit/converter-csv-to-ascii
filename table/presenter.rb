# frozen_string_literal: true

class AsciiTable
  class Presenter
    WIDTH_ELEMENT = '-'
    SEPARATOR = '|'
    CELL_POINT = '+'
    SPACE = ' '
    LINE_BREAK = "\n"

    attr_reader :rows, :columns_sizes, :table_picture

    def initialize(rows, columns_sizes)
      @rows = rows
      @columns_sizes = columns_sizes
      @table_picture = []
    end

    def run
      presented_rows = rows.map { |row| present_row(row) }
      table = presented_rows.product([separate_rows]).prepend(separate_rows)
      puts table
    end

    private

    def present_row(row)
      (0..row.height - 1).to_a.map do |line_index|
        row.cells.map do |cell|
          present_cell(cell, line_index) + SEPARATOR
        end.join.prepend(SEPARATOR)
      end
    end

    def present_cell(cell, line_index)
      value = cell.value[line_index].to_s
      spaces = SPACE * (columns_sizes[cell.column] - value.to_s.size)
      spaces + value
    end

    def separate_rows
      columns_sizes.map do |width|
        WIDTH_ELEMENT * width + CELL_POINT
      end.join.prepend(CELL_POINT)
    end
  end
end
