class DiaryEntry
    def initialize(title, contents) 
        @title = title
        @contents = contents
        @furthest_word_read = 0
        @words = @contents.split(" ")
    end

    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
      return @contents.split(" ").size
    end
  
    def reading_time(wpm) 
        return count_words / wpm
    end
  
    def reading_chunk(wpm, minutes) 
        words_to_read = wpm * minutes
        start_at = @furthest_word_read
        end_at = @furthest_word_read + words_to_read

        chunk = @words[start_at, end_at]

        if end_at >= count_words
            @furthest_word_read = 0
        else
            @furthest_word_read = end_at
        end
        return chunk.join(" ")
    end
end