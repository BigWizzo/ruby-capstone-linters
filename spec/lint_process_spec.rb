# frozen_string_literal: true

require_relative '../lib/lint_process'

RSpec.describe 'An idial CSS Linter' do
  let(:err_file) { LintProcess.new('./css/err_file.css') }
  let(:clean_file) { LintProcess.new('./css/clean.css') }
  let(:empty_file) { LintProcess.new('./css/empty.css') }
  describe 'The LintProcess class ' do
    describe '#bracket_line' do
      context 'when brackets are found in the file' do
        it 'Returns a hash of opening brackets and closing brackets' do
          expect(err_file.send(:bracket_line)).to eq({
                                                       1 => '}',
                                                       3 => '{',
                                                       4 => '}',
                                                       8 => '}',
                                                       10 => '{',
                                                       12 => '}',
                                                       14 => '{',
                                                       16 => '}'
                                                     })
        end
      end

      context 'when brackets are not found in the file' do
        it 'Returns an empty hash' do
          expect(empty_file.send(:bracket_line)).to eq({})
        end
      end
    end

    describe '#check_bracket' do
      context 'when all opening brackets match closing brackets in the file' do
        it 'Returns an empty hash' do
          expect(empty_file.check_bracket).to eq({})
        end
      end
    end

    describe '#check_error' do
      context 'when there are no errors found' do
        it 'Returns an empty hash' do
          expect(clean_file.check_error).to eq({})
        end
      end
    end

    describe '#check_error' do
      context 'when errors are found' do
        it 'Returns a hash of errors' do
          expect(err_file.check_error).to eq({
            '1' => 'Closing Bracket error detected',
            '10' => 'Opening Bracket error detected',
            '11' => 'Semicolon error detected',
            '16' => 'Closing Bracket error detected',
            '2' => 'Multiple semi-colons detected',
            '5' => 'Trailing whitespace detected',
            '6' => 'Multiple brackets detected'
                                             })
        end
      end

      context 'when errors are not found' do
        it 'Returns an empty hash' do
          expect(empty_file.check_bracket).to eq({})
        end
      end
    end
  end
end
