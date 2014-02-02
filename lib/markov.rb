require "markov/version"
require 'matrix'

class Markov
  def initialize states_sequence
    @states_sequence = states_sequence
  end

  def states
    @states ||= Set.new(states_sequence).to_a
  end

  def next
    next_probs = transition_matrix.row states.index(states_sequence.last)
    max_at = next_probs.each_with_index.max[1]

    states[max_at]
  end

  def transition_matrix
    @transition_matrix ||= begin
      matrix = Matrix.zero states.count
      states_sequence.map { |state|
        states.index state
      }.each_cons(2) do |c, n|
        val = matrix[c, n] + 1
        matrix.send :[]=, c, n, val
      end

      matrix
    end
  end

  def probability_matrix
    @probability_matrix ||= Matrix.build states.count do |row, col|
      transition_matrix[row, col].to_f / transition_matrix.row(row).reduce(:+)
    end
  end

  private

  attr_reader :states_sequence
end
