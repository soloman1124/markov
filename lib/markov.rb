require "markov/version"
require "markov/ngram"

class Markov
  def initialize states_sequence, n = 2
    @states_sequence = states_sequence
    @n = n
  end

  def next
    (2..n).reverse_each.map { |n| next_by n }.compact.first
  end

  private

  def next_by n
    ngram = Ngram.new states_sequence, n
    current = states_sequence.last(n - 1)

    ngram.next_state current
  end

  attr_reader :states_sequence, :n
end
