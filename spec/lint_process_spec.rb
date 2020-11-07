require_relative '../lib/lint_process'

RSpec.describe 'An idial CSS Linter' do
  # let(:title) { 'my title' }
  # let(:instructions) { 'my instructions' }
  # let(:game_board) { Board.new }
  # let(:player_1) { Player.new('Kender', 'O') }
  # let(:game_ui) { GameUi.new(title, instructions) }
  # let(:game_ui_no_instructions) { GameUi.new(title) }
  # let(:game_ui_no_title) { GameUi.new(nil, instructions) }
  # let(:board) { [1, 2, 3, 'X', 5, 6, 7, 8, 9] }
  let(:file_array) { ['the{', 'file}', 'maybe'] }
  let(:bracket_hash) { {} }
  let(:hash_arr) { [[1, '{'], [2, '}']] }
  let(:lint) { LintProcess.new }
  describe 'The LintProcess class ' do
      describe '#bracket_line' do
        context 'when brackets are found in the file' do
          it 'Returns a hash of opening brackets and closing brackets' do
            expect(lint.bracket_line).to eq({1=>"{", 3=>"}"})
          end
        end

        # context 'when brackets are not found in the file' do
          # it 'when there is no title' do
            # expect(linter.bracket_line).to eq({})
          # end
        # end
      end

      # context 'when title is not provided' do
        # it 'when there is no title' do
          # expect(game_ui_no_title.display_title_on_screen).to eq('No title')
        # end
      # end
    end
# 
    # describe '#validating_value' do
      # context 'When the player inputs the right value' do
        # it 'validate the X and O' do
          # expect(game_ui.validating_value('X')).to eq('X')
        # end
      # end
# 
      # context 'When the player inputs the wrong value' do
        # before do
          # allow(game_ui).to receive(:gets).and_return('O')
        # end
        # it 'validate input differences values than the X and O' do
          # expect { game_ui.validating_value(' ') }.to output("Please enter X or O\n").to_stdout
        # end
      # end
    # end
  # end
end
