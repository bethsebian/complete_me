require_relative 'test_helper'

class NodeTest < Minitest::Test
  def test_it_exists
    assert_instance_of Node, Node.new
  end
end
