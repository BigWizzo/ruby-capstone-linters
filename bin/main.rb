# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

require_relative '../lib/lint_process'

linter = LintProcess.new
linter.bracket_line
linter.check_bracket
linter.check_error
linter.errors


# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
