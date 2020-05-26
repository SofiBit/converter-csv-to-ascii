# frozen_string_literal: true

require_relative 'table/presenter.rb'
require_relative 'table/row.rb'

class AsciiTable
  attr_reader :size, :rows
  attr_accessor :columns_sizes

  def initialize
    @rows = []
    @columns_sizes = []
  end

  def add_row(data_row)
    rows << row = Row.new(data_row)
    update_columns_sizes(row)
  end

  def present
    Presenter.new(rows, columns_sizes).run
  end

  private

  def update_columns_sizes(row)
    row.cells.each_with_index do |cell, column|
      cell_size = cell.max_width
      column_size = columns_sizes[column] || 0

      columns_sizes[column] = cell_size if cell_size > column_size
    end
  end
end
