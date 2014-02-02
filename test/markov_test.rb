require 'test_helper'

class MarkovTest < MiniTest::Test
  def setup
    @states_seq = [
      [nil, 'purple', 'orange', 'blue',   'blue', 'blue', nil], #Jan 12 - 18
      [nil, 'maroon', 'blue',   'blue',   'blue', 'blue', nil], #Jan 19 - 25
      [nil, nil,      'blue',   'orange', 'blue', 'blue', nil]
    ].flatten.compact
    @markov = Markov.new states_seq
  end

  def test_states_returns_all_states
    states = ["purple", "orange", "blue", "maroon"]

    assert_equal states, markov.states
  end

  def test_next_return_the_prediction_within_the_state_spaces
    next_state = markov.next

    assert_includes markov.states, next_state
  end

  def test_next_return_the_current_prediction
    next_state = markov.next

    puts next_state
  end

  private

  attr_reader :states_seq, :markov
end
