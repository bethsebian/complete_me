class CompleteMe
  attr_reader :root, :count

  def initialize
    @root = Node.new
    @count = 0
  end

  def insert(word)
    @count += 1 unless @root.duplicate?(word)
    @root.load_word(word)
  end
end
