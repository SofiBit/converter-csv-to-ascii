# frozen_string_literal: true

require_relative 'parser.rb'
require_relative 'ascii_table.rb'

class Converter
  EXPANSION = 'csv'

  attr_reader :path_file, :parser

  def initialize(path_file)
    @path_file = path_file
    raise 'Expansion is invalid' unless format_valid?

    @parser = Parser.new(path_file)
  end

  def run
    table = AsciiTable.new
    parser.run { |row| table.add_row(row) }
    table.present
  end

  private

  def format_valid?
    path_expansion = path_file.split('/').last.split('.')

    path_expansion.size == 2 && path_expansion.last == EXPANSION
  end
end
