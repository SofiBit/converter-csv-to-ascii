# frozen_string_literal: true

class AsciiTable
  class Presenter
    WIDTH_ELEMENT = '-'
    SEPARATOR = '|'
    CELL_POINT = '+'
    SPACE = ' '
    LINE_BREAK = "\n"

    attr_reader :rows, :max_width, :table_picture

    def initialize(rows, max_width)
      @rows = rows
      @max_width = max_width
      @table_picture = []
    end

    def run
      return puts 'The table is empty' if rows.empty?

      table_picture << line_separator(rows.first) + LINE_BREAK
      row_iterator
      puts table_picture.join
    end

    private

    def row_iterator
      rows.each do |row|
        present_row(row)
        table_picture << line_separator(row) + LINE_BREAK
      end
    end

    def present_row(row)
      row.height.times do |index|
        row.cells.each do |cell|
          table_picture << present_cell(cell, index)
        end
        table_picture << SEPARATOR + LINE_BREAK
      end
    end

    def present_cell(cell, index)
      cell_value = cell.value[index]
      "#{SEPARATOR}#{cell_value}" + count_spaces(cell, cell_value)
    end

    def count_spaces(cell, cell_value)
      spaces = cell.width
      return spaces_string(spaces) if cell_value.nil?

      spaces = cell.width - cell_value.size
      spaces_string(spaces)
    end

    def spaces_string(spaces)
      (1..spaces).to_a.map { |_string| SPACE }.join
    end

    def line_separator(row)
      CELL_POINT + row.cells.each_with_object([]) do |cell, line|
        line << (1..cell.width).to_a.map { |_char| '-' }.join + CELL_POINT
      end.join
    end
  end
end
