#add word bank


class WordBank
  attr_reader :root
  def initialize
    @root = {}
  end

  def check_or_add_word(word)
    current_node = @root
    is_new_word = false

    word.chars.each do |letter|
      unless current_node.key?(letter)
        current_node[letter] = {}
        is_new_word = true
      end
      current_node = current_node[letter]
    end

    unless current_node.key?('end of word')
      current_node['end of word'] = {}
      is_new_word = true
    end

    is_new_word
  end
end
