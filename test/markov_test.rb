require 'test_helper'

class MarkovTest < MiniTest::Test
  def setup
    @states_seq = [
      [nil, 'purple', 'orange', 'blue',   'blue', 'blue', nil], #Jan 12 - 18
      [nil, 'maroon', 'blue',   'blue',   'blue', 'blue', nil], #Jan 19 - 25
      [nil, nil,      'blue',   'orange', 'blue', 'blue', nil],
      ['green', 'blue',   'green',  'blue',   'green', 'green'] # Feb 2 - 8
    ].flatten.compact
    @markov = Markov.new states_seq, 4
  end

  def test_next_return_the_current_prediction
    next_state = markov.next

    puts next_state
  end

  private

  attr_reader :states_seq, :markov
end
