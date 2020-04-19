# frozen_string_literal: true

require 'csv'
require_relative 'types/int.rb'
require_relative 'types/money.rb'
require_relative 'types/string.rb'

class Parser
  CONVERTORS = { string: Type::String,
                 int: Type::Int,
                 money: Type::Money }.freeze

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def run
    csv = CSV.open(file, headers: true, converters: [converter], col_sep: ';')
    csv.each do |csv_row|
      value_data = csv_row.map(&:last)
      yield(value_data)
    end
  end

  private

  def converter
    lambda do |value, data|
      header = data.header
      converted_value = CONVERTORS.fetch(header.to_sym).new(value).convert
      { value: converted_value, header: header }
    end
  end
end
