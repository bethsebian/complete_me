class CompleteMe
  attr_reader :root, :count

  def initialize
    @root = Node.new
    @count = 0
  end

  def insert(word)
    @count += 1 unless duplicate(word)
    @root.load_word(word)
  end

  def duplicate(word)
    children = root.children
    while children[word[0]]
      children = children[word[0]].children
      word     = word[1..-1]
    end
    word == ""
  end
end
