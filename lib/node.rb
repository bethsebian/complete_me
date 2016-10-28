class Node
  attr_accessor :children, :word_indicator

  def initialize
    @children = {}
    @word_indicator = false
  end

  def load_word(word)
    children[word[0]] = Node.new                unless matching_child(word)
    matching_child(word).load_word(word[1..-1]) unless last_letter?(word)
    matching_child(word).word_indicator = true  if     last_letter?(word)
  end

  def matching_child(word)
    children[first_letter(word)]
  end

  def last_letter?(word)
    word.length == 1
  end

  def first_letter(word)
    word[0]
  end

  def duplicate?(word)
    children = @children
    while children[first_letter(word)]
      children, word = children[word[0]].children, word[1..-1]
    end
    word == ""
  end

end
