require_relative '../bin/main'

RSpec.describe 'An idial CSS Linter' do
  let(:linter) { LintProcess.new }
  let(:file_array) { ['the{', 'file}', 'maybe'] }
  let(:bracket_hash) { {} }
  let(:hash_arr) { [[1, '{'], [2, '}']] }
  describe '#bracket_line' do
    it 'Returns a hash' do
      expect(bracket_line(file_array, bracket_hash)).to eq({ 1 => '{', 2 => '}' })
    end
  end
  describe '#check_bracket' do
    it 'checks no matching bracket' do
      expect(check_bracket(hash_arr)).to eql(nil)
    end
  end
end
