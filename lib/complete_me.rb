require './lib/node'

class CompleteMe
  attr_reader :root, :count

  def initialize
    @root = Node.new
    @count = 0
  end

  def insert(word)
    @count += 1 unless duplicate?(root, word)
    load_word(root, word)
  end

  def load_word(node, word)
    node.children[word[0]] = Node.new              unless node.children[word[0]]
    set_word_indicator(node, word)                 if     end_of_word?(word)
    load_word(node.children[word[0]], word[1..-1]) unless end_of_word?(word)
  end

  def set_word_indicator(node, word)
    node.children[word[0]].word_indicator = true
  end

  def end_of_word?(word)
    word.length == 1
  end

  def duplicate?(current, word)
    while current.children[word[0]]
      current, word = current.children[word[0]], word[1..-1]
    end
    word == "" && current.word_indicator
  end

  def suggest(fragment)
    last_node = last_node(fragment)
    @words = []
    find_all_words(fragment, last_node)
    @words
  end

  def last_node(fragment)
    current = root
    while current.children[fragment[0]]
      current, fragment = current.children[fragment[0]], fragment[1..-1]
    end
    current
  end

  def find_all_words(fragment, last_node)
    last_node.children.each do |letter, child_node|
      fragment += letter
      @words << fragment if child_node.word_indicator
      find_all_words(fragment, child_node)
    end
  end
end
