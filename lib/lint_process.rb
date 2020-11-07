# frozen_string_literal: true

# LintProces class initializing the file
class LintProcess
  attr_reader :file, :file_array, :hash_arr, :bracket_hash

  def initialize
    @file = 'lorem.css'
    @file_array = File.readlines(file)
    @bracket_hash = {}
    @hash_arr = []
  end
end
