require_relative 'test_helper'

class NodeTest < Minitest::Test
  attr_reader :node

  def setup
    @node = Node.new
  end

  def test_it_exists
    assert_instance_of Node, node
  end

  def test_it_stores_collection_of_children
    assert_instance_of Hash, node.children
  end

  def test_node_has_false_word_indicator_by_default
    assert_equal false, node.word_indicator
  end

  def test_it_finds_first_letter_of_word
    assert_equal "a", node.first_letter("advice")
  end
end
