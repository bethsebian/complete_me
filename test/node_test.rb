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

  def test_it_creates_child_node_when_passed_single_letter_string
    node.load_word("a")

    assert node.children["a"]
  end

  def test_it_creates_child_and_grandchild_when_passed_two_letter_string
    node.load_word("ad")

    assert node.children["a"].children["d"]
  end

  def test_it_loads_two_similar_words
    node.load_word("ad")
    node.load_word("at")

    assert node.children["a"].children["d"]
    assert node.children["a"].children["t"]
  end

  def test_last_node_has_no_children
    node.load_word("ad")

    assert node.children["a"].children["d"].children.empty?
  end

  def test_it_loads_several_character_word_2
    node.load_word("advice")

    "advice".each_char.inject(node) do |next_node, letter|
      assert next_node
      next_node.children[letter]
    end
  end

  def test_node_has_false_word_indicator_by_default
    assert_equal false, node.word_indicator
  end

  def test_nodes_at_ends_of_words_have_word_indicators
    node.load_word("ad")
    node.load_word("at")

    refute node.children["a"].word_indicator
    assert node.children["a"].children["d"].word_indicator
    assert node.children["a"].children["d"].word_indicator
  end

  def test_it_returns_child_for_first_letter_in_word
    node.children["a"] = n_1 = Node.new
    node.children["a"].children["d"] = n_2 = Node.new

    assert_equal n_2, n_1.matching_child("d")
    refute n_1.matching_child("t")
  end

  def test_it_verifies_if_word_fragment_is_last_letter_of_word
    assert node.last_letter?("a")
    refute node.last_letter?("ab")
    refute node.last_letter?("")
  end

  def test_it_finds_first_letter_of_word
    assert_equal "a", node.first_letter("advice")
  end

  def test_it_identifies_duplicate_word
    node.load_word("advice")
    assert node.duplicate?("advice")
  end

  def test_it_identifies_new_word
    node.load_word("advice")
    refute node.duplicate?("advocate")
  end
end
