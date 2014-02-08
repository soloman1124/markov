require 'test_helper'

class FrequencyStoreTest < MiniTest::Test
  def test_total_count_returns_number_of_items_inserted
    store = Markov::FrequencyStore.new
    3.times { store.add "red" }
    2.times { store.add "blue" }

    assert_equal 5, store.total
  end
end
