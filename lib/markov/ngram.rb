class Markov
  class Ngram
    attr_reader :states_sequence, :n

    def initialize states_sequence, n = 2
      @states_sequence = states_sequence
      @n = n
    end

    def next_states base
      if store[base]
        result = Hash.new 0
        store[base].each { |state| result[state] += 1 }
        result.each_key do |key|
          result[key] = result[key] / store[base].count.to_f
        end

        result
      end
    end

    private

    def store
      @store ||= states_sequence.each_cons(n).
                   each_with_object({}) do |states, hash|
        base, target = states.take(states.count - 1), states.last
        hash[base] = [] unless hash[base]
        hash[base] << target
      end
    end
  end
end
