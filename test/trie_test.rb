require_relative 'test_helper'

class TrieTest < Minitest::Test
  def test_it_exists
    assert_instance_of Trie, Trie.new
  end
end
