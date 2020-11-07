# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
require 'colorize'
require_relative '../lib/lint_process'

linter = LintProcess.new
linter.bracket_line
linter.check_bracket
linter.check_error
linter.errors

if linter.errors.empty?
    puts "0 offenses detected".colorize(:green)
else
    linter.errors.each do |key, value|
        puts "Line #{key}:" + " #{value}".colorize(:red)
    end
    puts "#{linter.errors.length} offenses detected".colorize(:red)
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
