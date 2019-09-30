# frozen_string_literal: true

require_relative '../lib/gamelogic'
require_relative '../lib/players'
RSpec.describe GameLogic do
  subject(:game) { GameLogic.new }

  describe '#check_empty_space method' do
    context 'when all the cells are available for marking' do
      it 'will return true' do
        game.instance_variable_set('@cells', [1, 2, 3, 4, 5, 6, 7, 8, 9])
        expect(game.check_empty_space). to be true
      end
    end

    context 'when all the cells are already marked' do
      it 'will return false' do
        game.instance_variable_set('@cells', %w[X O X X O O X])
        expect(game.check_empty_space). to be false
      end
    end
  end

  describe '#game_end method' do
    context 'tests various conditions of game' do
      it 'will give true' do
        allow(game).to receive(:check_empty_space).and_return(true)
        expect(game.game_end(nil)).to be nil
      end
    end

    context 'there is no winner as well as space' do
      it 'will give true' do
        allow(game).to receive(:check_empty_space).and_return(false)
        expect(game.game_end('X')).to be true
      end
    end
  end

  describe '#check_existance method' do
    context 'checks whether mark is already taken or not'
    it 'return true' do
      game.instance_variable_set('@cells', [1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect(game.check_existance(4)). to eq(true)
    end

    it 'return false as it is already marked by player X' do
      game.instance_variable_set('@cells', [1, 2, 3, 'X', 'X', 6, 7, 8, 9])
      expect(game.check_existance(4)). to eq(false)
    end
  end
end

RSpec.describe Players do
  let(:players) { Players.new }

  describe '#change_players method' do
    context 'this will change status of the current player' do
      it 'will return other player than current player' do
        players.instance_variable_set('@player1', 'X')
        players.instance_variable_set('@player2', 'O')
        @current_player = @player1
        expect(players.change_players).not_to eql(players.player2)
      end
    end
  end

  describe '#store_mark method' do
    context 'when current player is player1' do
      it 'should add the mark in the player1_array' do
        @current_player = @player1
        players.instance_variable_set('@player1_array', [3, 5])
        players.instance_variable_set('@mark', 7)
        expect(players.store_mark).to eq([3, 5, 7])
      end
    end
  end

  describe '#check_winner method' do
    compositions = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    context 'when there are empty arrays of marks both player' do
      it 'will return nil' do
        expect(players.check_winner(compositions)).to eq(nil)
      end
    end

    context 'when array of one element has wining composition ' do
      it 'will return the player symbol' do
        players.instance_variable_set('@player1_array', [2, 5, 7])
        players.instance_variable_set('@player2', 'O')
        players.instance_variable_set('@player1', 'X')
        players.instance_variable_set('@player2_array', [1, 2, 3])
        expect(players.check_winner(compositions)).to eql(players.player2)
      end
    end
  end

  describe '#check_invalid_input method' do
    context 'when players entered a invalid input' do
      it 'will return true' do
        players.instance_variable_set('@mark', 20)
        expect(players.check_invalid_input).to be true
      end
    end

    context 'when players select a mark between 1 and 9' do
      it 'will return false' do
        players.instance_variable_set('@mark', 4)
        expect(players.check_invalid_input).to be false
      end
    end
  end
end
