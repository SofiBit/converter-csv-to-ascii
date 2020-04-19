# frozen_string_literal: true

require_relative 'table/presenter.rb'
require_relative 'table/row.rb'

class AsciiTable
  attr_reader :size, :rows
  attr_accessor :width

  def initialize
    @rows = []
    @width = 0
  end

  def add_row(row)
    rows << Row.new(row)
    calculate_width
  end

  def present
    Presenter.new(rows, width).run
  end

  private

  def calculate_width
    self.width = rows.map(&:width).max
  end
end
