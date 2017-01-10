require_relative 'test_helper'

class CompleteMeTest < Minitest::Test
  attr_reader :cm

  def setup
    @cm = CompleteMe.new
  end

  def test_it_exists
    assert_instance_of CompleteMe, CompleteMe.new
  end

  def test_it_has_root_node
    assert_instance_of Node, cm.root
  end

  def test_it_can_insert_a_word
    cm.insert("ad")
    assert_instance_of Node, cm.root.children["a"].children["d"]
  end

  def test_it_has_count_of_zero_when_created
    assert_equal 0, cm.count
  end

  def test_it_keeps_track_of_inserted_words
    cm.insert("ad")
    cm.insert("at")
    assert_equal 2, cm.count
  end

  def test_it_does_not_double_count_duplicate_words_inserted
    cm.insert("ad")
    cm.insert("at")
    cm.insert("ad")

    assert_equal 2, cm.count
  end

  def test_it_does_not_double_count_duplicate_words_inserted
    cm.insert("at")
    cm.insert("ad")
    cm.insert("carrot")
    cm.insert("carrots")
    cm.insert("banana")

    assert_equal 5, cm.count
  end

  def test_it_identifies_duplicate
    refute cm.duplicate("at")

    cm.insert("at")

    assert cm.duplicate("at")
  end
end
