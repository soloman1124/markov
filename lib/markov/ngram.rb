class Markov
  class Ngram
    attr_reader :states_sequence, :n

    def initialize states_sequence, n = 2
      @states_sequence = states_sequence
      @n = n
    end

    def next_state base
      if store[base]
        store[base].max
      end
    end

    private

    def store
      @store ||= states_sequence.each_cons(n).
        each_with_object(Hash.new FrequencyStore.new) do |states, hash|
          base, target = states.take(states.count - 1).sort, states.last
          hash[base].add target
        end
    end
  end
end
