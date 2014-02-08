class Markov
  class FrequencyStore
    attr_reader :total

    def initialize
      @store = Hash.new 0
      @total = 0
    end

    def max
      store.max { |a, b| a[1] <=> b[1] }[0]
    end

    def add item
      @total += 1
      store[item] += 1
    end

    def frequency item
      score[item]
    end

    def probability item
      score[item] / total.to_f
    end

    private

    attr_reader :store
  end
end
