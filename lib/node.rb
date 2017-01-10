class Node
  attr_accessor :children, :word_indicator

  def initialize
    @children = {}
    @word_indicator = false
  end

  def first_letter(word)
    word[0]
  end

end
