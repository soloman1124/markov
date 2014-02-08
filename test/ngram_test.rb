require 'test_helper'

class NgramTest < MiniTest::Test
  def setup
    @states_seq = %w(A B C A B A A B)
  end

  def test_bigram_returns_probabilities_for_next_state
    bigram = ngram

    assert_equal "B", bigram.next_state(["A"])
  end

  private

  attr_reader :states_seq

  def ngram n = 2
    Markov::Ngram.new states_seq, n
  end
end
