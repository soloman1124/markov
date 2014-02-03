require 'test_helper'

class NgramTest < MiniTest::Test
  def setup
    @states_seq = %w(A B C A B A A B)
  end

  def test_bigram_returns_probabilities_for_next_states
    bigram = ngram
    result = {"B" => 0.75, "A" => 0.25}

    assert_equal result, bigram.next_states(["A"])
  end

  private

  attr_reader :states_seq

  def ngram n = 2
    Markov::Ngram.new states_seq, n
  end
end
